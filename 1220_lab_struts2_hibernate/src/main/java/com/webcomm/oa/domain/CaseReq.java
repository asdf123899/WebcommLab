package com.webcomm.oa.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.webcomm.oa.data.CaseMonitorLevelEnum;
import com.webcomm.oa.data.CaseTypeEnum;

import lombok.Data;

/**
 * The Class CaseReq.
 */
@Entity
@Table(name = "CASE_REQ")
@Data
public class CaseReq implements Serializable {
	
	/** The attr case no. */
	public static String ATTR_CASE_NO = "caseNo";
	
	/** The attr monitor level. */
	public static String ATTR_MONITOR_LEVEL = "monitorLevel";
	
	/** The attr type. */
	public static String ATTR_TYPE = "type";
	
	/** The attr manager emp. */
	public static String ATTR_MANAGER_EMP = "managerEmp";
	
	/** The attr contact emp. */
	public static String ATTR_CONTACT_EMP = "contactEmp";
	
	/** The attr start date. */
	public static String ATTR_START_DATE = "startDate";
	
	/** The attr end date. */
	public static String ATTR_END_DATE = "endDate";
	
	/** The attr work item desc. */
	public static String ATTR_WORK_ITEM_DESC = "workItemDesc";
	
	/** The case no. */
	@Id
	@Column(name = "CASE_NO", length = 11, updatable = false, nullable = false)
	private String caseNo;
	
	/** The monitor level. */
	@Column(name = "MONITOR_LEVEL", nullable = false)
	private CaseMonitorLevelEnum monitorLevel;
	
	/** The type. */
	@Column(name = "TYPE", nullable = false)
	private CaseTypeEnum type;
	
	/** The manager emp. */
	@ManyToOne
	@JoinColumn(name = "MANAGER_EMP_ID")
	private Employee managerEmp = new Employee();
	
	/** The contact emp. */
	@ManyToOne
	@JoinColumn(name = "CONTACT_EMP_ID")
	private Employee contactEmp = new Employee();
	
	/** The start date. */
	@Column(name = "START_DATE", nullable = false)
	private Date startDate;
	
	/** The end date. */
	@Column(name = "END_DATE", nullable = false)
	private Date endDate;
	
	/** The work item desc. */
	@Column(name = "WORK_ITEM_DESC", nullable = false, length = 200)
	private String workItemDesc;

}
