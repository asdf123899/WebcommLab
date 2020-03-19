package com.webcomm.oa.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.webcomm.oa.action.core.CommonAction;
import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.impl.CaseReqServiceImpl;
import com.webcomm.oa.pri.CaseReqService;
import com.webcomm.oa.to.CaseReqSearchBean;
import com.webcomm.oa.util.CollectionUtil;

import lombok.Getter;
import lombok.Setter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;

public class CaseReqAction extends CommonAction implements Action {
	
	private CaseReqService caseReqService;
	
	@Getter
	private List<CaseReq> caseReqList;
	
	@Getter
	@Setter
	private CaseReq caseReq = new CaseReq();
	
	@Getter
	private Boolean resultPage = false;
	
	@Getter
	private InputStream pdfStream;
	
	public CaseReqAction() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		if (session.containsKey("searchBean")) {
			setSearchBean((CaseReqSearchBean) session.get("searchBean"));
		} else {
			setSearchBean(new CaseReqSearchBean());
		}
		caseReqService = new CaseReqServiceImpl();
	}
	
	public String execute() throws Exception {
		resultPage = false;
		return SUCCESS;
	}
	
	public String doSearch() throws Exception {
		resultPage = true;
		caseReqList = caseReqService.queryAll((CaseReqSearchBean) getSearchBean());
		setCurrentPage(getSearchBean().getCurrentPage());
		setPageNumber(getSearchBean().getPageNumber());
		setTotalPage((int) Math.ceil(caseReqService.count((CaseReqSearchBean) getSearchBean()) * 1.0 / getSearchBean().getPageNumber()));
		getSearchBean().setReportSearch(false);
		ActionContext.getContext().getSession().put("searchBean", getSearchBean());
		return SUCCESS;
	}
	
	public String doPrint() throws Exception {
		String jasperReportXMLPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes/CaseReqReport.jrxml");
		JRPdfExporter exporter = new JRPdfExporter();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        JasperReport jasperReport = JasperCompileManager.compileReport(jasperReportXMLPath);
        getSearchBean().setReportSearch(true);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, new JRBeanCollectionDataSource(caseReqService.queryAll((CaseReqSearchBean) getSearchBean())));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputStream));
        SimplePdfExporterConfiguration configuration = new SimplePdfExporterConfiguration();
        exporter.setConfiguration(configuration);
        exporter.exportReport();
        pdfStream = new ByteArrayInputStream(outputStream.toByteArray());
        return SUCCESS;
	}
	
	public String create() throws Exception {
		return SUCCESS;
	}
	
	public String doCreate() throws Exception {
		caseReqService.create(caseReq);
		return SUCCESS;
	}
	
	public String update() throws Exception {
		caseReq = caseReqService.queryOne(getKey());
		return SUCCESS;
	}
	
	public String doUpdate() throws Exception {
		caseReqService.create(caseReq);
		return SUCCESS;
	}
	
	public String doDelete() throws Exception {
		if (CollectionUtil.isNonEmpty(getKeys())) {
			caseReqService.batchDelete(getKeys());
		}
		return SUCCESS;
	}

}
