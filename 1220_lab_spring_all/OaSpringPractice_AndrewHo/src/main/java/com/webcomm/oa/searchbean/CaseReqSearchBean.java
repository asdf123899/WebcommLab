package com.webcomm.oa.searchbean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.webcomm.oa.data.CaseMonitorLevelEnum;
import com.webcomm.oa.data.CaseTypeEnum;
import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.domain.Employee;
import com.webcomm.oa.domain.Unit;
import com.webcomm.oa.util.StringUtil;

public class CaseReqSearchBean extends BaseSearchBean<CaseReq> {

	private CaseMonitorLevelEnum monitorLevel;

	private CaseTypeEnum type;

	private String managerUnitId;

	private String contactUnitId;

	
	public CaseReqSearchBean() {
		super();
		setSort(CaseReq.ATTR_CASE_NO);
	}

	@Override
	public Specification<CaseReq> getBaseSpecification() {
		return new BaseSpecification();
	}

	private class BaseSpecification implements Specification<CaseReq> {
		private static final long serialVersionUID = 1L;

		@Override
		public Predicate toPredicate(Root<CaseReq> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
			List<Predicate> conditions = new ArrayList<>();
			
			if (StringUtil.isNonEmptyEnum(monitorLevel)) {
				conditions.add(cb.equal(root.get(CaseReq.ATTR_MONITOR_LEVEL).as(CaseMonitorLevelEnum.class), monitorLevel));
			}
			
			if (StringUtil.isNonEmptyEnum(type)) {
				conditions.add(cb.equal(root.get(CaseReq.ATTR_TYPE).as(CaseTypeEnum.class), type));
			}
			
			if (StringUtil.isNonEmpty(managerUnitId)) {
				conditions.add(cb.equal(root.get(CaseReq.ATTR_MANAGER_EMP).get(Employee.ATTR_UNIT).get(Unit.ATTR_UNIT_ID).as(String.class), managerUnitId));
			}
			
			if (StringUtil.isNonEmpty(contactUnitId)) {
				conditions.add(cb.equal(root.get(CaseReq.ATTR_CONTACT_EMP).get(Employee.ATTR_UNIT).get(Unit.ATTR_UNIT_ID).as(String.class), contactUnitId));
			}
			
			query.where(conditions.toArray(new Predicate[]{}));
			return query.getRestriction();
		}
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

	public String getManagerUnitId() {
		return managerUnitId;
	}

	public void setManagerUnitId(String managerUnitId) {
		this.managerUnitId = managerUnitId;
	}

	public String getContactUnitId() {
		return contactUnitId;
	}

	public void setContactUnitId(String contactUnitId) {
		this.contactUnitId = contactUnitId;
	}

}
