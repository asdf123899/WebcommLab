package com.webcomm.oa.batch.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import com.webcomm.oa.service.CaseReqService;

//@Component
public class CaseReqEmailJob extends QuartzJobBean {

	@Autowired
    private CaseReqService caseReqService;

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
	}
 
}
