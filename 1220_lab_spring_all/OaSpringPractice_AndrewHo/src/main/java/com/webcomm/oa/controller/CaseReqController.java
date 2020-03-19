package com.webcomm.oa.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webcomm.oa.batch.job.EmailJob;
import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.searchbean.BaseSearchBean;
import com.webcomm.oa.searchbean.CaseReqSearchBean;
import com.webcomm.oa.service.BaseService;
import com.webcomm.oa.service.CaseReqService;
import com.webcomm.oa.util.DateUtil;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@RequestMapping("/caseReq")
public class CaseReqController extends BaseController<CaseReq, CaseReqSearchBean> {

	@Autowired
	private CaseReqService caseReqService;
	
	@Value("${email.to}")
	private String emailTo;
	 
	@Value("${wait.send.email.secs}")
	private Integer waitSendEmailSecs;
	
	@Autowired
    private Scheduler scheduler;

	@SuppressWarnings("rawtypes")
	@Override
	public BaseSearchBean getSearchBeanInstance() {
		return new CaseReqSearchBean();
	}

	@Override
	public CaseReq getTargetObjInstance() {
		return new CaseReq();
	}

	@Override
	public BaseService<CaseReq> getService() {
		return caseReqService;
	}
	
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/doPrint")
	public void doPrint(@ModelAttribute("searchBean") CaseReqSearchBean searchBean, Pageable pageable,
			HttpSession session, HttpServletResponse response, Authentication authentication) {
		String reportName = "caseReqExport001";
		String filename = reportName + ".pdf";
		try {
			response.setContentType(MediaType.APPLICATION_PDF_VALUE);
			response.addHeader("Content-Disposition", "inline; filename=" + filename);
			
			OutputStream output = response.getOutputStream();
			InputStream is = this.getClass().getResourceAsStream("/jasper/" + reportName + ".jasper");
			JasperReport jr = (JasperReport) JRLoader.loadObject(is);
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("nowStr", DateUtil.getRocDateStr(new Date()));
			JasperPrint jp = JasperFillManager.fillReport(jr, parameters, new JRBeanCollectionDataSource(
					getService().listAll(((BaseSearchBean) searchBean).getBaseSpecification(), CaseReq.ATTR_CASE_NO)));
			byte[] report = JasperExportManager.exportReportToPdf(jp);
			output.write(report);
			
			registerEmailJob(authentication.getName(), reportName, filename, report);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	private void registerEmailJob(String userName, String reportName, String filaname, byte[] report) {
		try {
			JobDataMap jobDataMap = new JobDataMap();

			jobDataMap.put("email", emailTo);
			jobDataMap.put("subject", MessageFormat.format("使用者: {0} 匯出了報表({1})", userName, reportName));
			jobDataMap.put("body", "請參造附件。");
			Map<String, InputStreamSource> attachments = new HashMap<>();
			attachments.put(filaname, new ByteArrayResource(report));
			jobDataMap.put("attachments", attachments);
			
			JobDetail jobDetail = JobBuilder.newJob(EmailJob.class)
					.withIdentity(UUID.randomUUID().toString(), "email-jobs")
					.withDescription("Send Email Job")
					.usingJobData(jobDataMap)
					.storeDurably()
					.build();
			Trigger trigger = buildJobTrigger(jobDetail, DateUtil.shiftDate(new Date(), Calendar.SECOND, waitSendEmailSecs));
			scheduler.scheduleJob(jobDetail, trigger);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private Trigger buildJobTrigger(JobDetail jobDetail, Date startAt) {

		return TriggerBuilder.newTrigger()
				.forJob(jobDetail)
				.withIdentity(jobDetail.getKey().getName(), "email-triggers")
				.withDescription("Send Email Trigger")
				.startAt(startAt)
				.withSchedule(SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
				.build();
	}
	
}
