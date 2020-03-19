package com.webcomm.oa.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.webcomm.oa.data.CaseMonitorLevelEnum;
import com.webcomm.oa.data.CaseTypeEnum;

@Entity
@Table(name = "CASE_REQ")
public class CaseReq implements Serializable {
	private static final long serialVersionUID = 1L;

	public static String ATTR_CASE_NO = "caseNo";
	public static String ATTR_MONITOR_LEVEL = "monitorLevel";
	public static String ATTR_TYPE = "type";
	public static String ATTR_MANAGER_EMP = "managerEmp";
	public static String ATTR_CONTACT_EMP = "contactEmp";
	public static String ATTR_WORK_ITEM_DESC = "workItemDesc";
	public static String ATTR_START = "start";
	public static String ATTR_END = "end";

	@Id
	@Column(name = "CASE_NO", nullable = false)
	private String caseNo;

	@Column(name = "MONITOR_LEVEL", nullable = false)
	private CaseMonitorLevelEnum monitorLevel;

	@Column(name = "TYPE", nullable = false)
	private CaseTypeEnum type;

	@ManyToOne
	@JoinColumn(name = "MANAGER_EMP_ID", nullable = false)
	private Employee managerEmp = new Employee();

	@ManyToOne
	@JoinColumn(name = "CONTACT_EMP_ID", nullable = false)
	private Employee contactEmp = new Employee();

	@Column(name = "WORK_ITEM_DESC")
	private String workItemDesc;

	@Column(name = "START_DATE")
	private Date startDate;

	@Column(name = "END_DATE")
	private Date endDate;

	public String getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}

	public CaseMonitorLevelEnum getMonitorLevel() {
		return monitorLevel;
	}

	public void setMonitorLevel(CaseMonitorLevelEnum monitorLevel) {
		this.monitorLevel = monitorLevel;
	}

	public CaseTypeEnum getType() {
		return type;
	}

	public void setType(CaseTypeEnum type) {
		this.type = type;
	}

	public Employee getManagerEmp() {
		return managerEmp;
	}

	public void setManagerEmp(Employee managerEmp) {
		this.managerEmp = managerEmp;
	}

	public Employee getContactEmp() {
		return contactEmp;
	}

	public void setContactEmp(Employee contactEmp) {
		this.contactEmp = contactEmp;
	}

	public String getWorkItemDesc() {
		return workItemDesc;
	}

	public void setWorkItemDesc(String workItemDesc) {
		this.workItemDesc = workItemDesc;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "CaseReq [caseNo=" + caseNo + ", monitorLevel=" + monitorLevel + ", type=" + type + ", managerEmp="
				+ managerEmp + ", contactEmp=" + contactEmp + ", workItemDesc=" + workItemDesc + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}

}
