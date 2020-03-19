package com.webcomm.oa.batch;

import org.quartz.JobDetail;
import org.quartz.SimpleTrigger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;

import com.webcomm.oa.batch.job.CaseReqEmailJob;

//@Configuration
public class CronJobConfig {

//	@Bean
	public JobDetailFactoryBean caseReqEmail() {
	    JobDetailFactoryBean jobDetailFactory = new JobDetailFactoryBean();
	    jobDetailFactory.setJobClass(CaseReqEmailJob.class);
	    jobDetailFactory.setDescription("Invoke Sample Job service...");
	    jobDetailFactory.setDurability(true);
	    
	    return jobDetailFactory;
	}
	
//	@Bean
	public SimpleTriggerFactoryBean trigger(JobDetail job) {
	    SimpleTriggerFactoryBean trigger = new SimpleTriggerFactoryBean();
	    trigger.setJobDetail(job);
	    trigger.setRepeatInterval(3600000);
	    trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
	    return trigger;
	}
}
