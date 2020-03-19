package com.webcomm.oa.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.webcomm.oa.data.CaseMonitorLevelEnum;
import com.webcomm.oa.data.CaseTypeEnum;
import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.domain.Employee;
import com.webcomm.oa.domain.Unit;
import com.webcomm.oa.to.CaseReqSearchBean;
import com.webcomm.oa.util.HibernateUtil;
import com.webcomm.oa.util.StringUtil;

/**
 * The Class CaseReqDao.
 */
public class CaseReqDao extends BaseDao<CaseReq> {
	
	/**
	 * Query all.
	 *
	 * @param searchBean the search bean
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List<CaseReq> queryAll(CaseReqSearchBean searchBean) {
		return getQuery(searchBean, false).getResultList();
	}
	
	/**
	 * Count.
	 *
	 * @param searchBean the search bean
	 * @return the long
	 */
	public Long count(CaseReqSearchBean searchBean) {
		return (Long) getQuery(searchBean, true).getSingleResult();
	}
	
	/**
	 * Gets the query.
	 *
	 * @param searchBean the search bean
	 * @param page the page
	 * @return the query
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Query getQuery(CaseReqSearchBean searchBean, Boolean count) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		CriteriaBuilder cb = session.getCriteriaBuilder();
		
		CriteriaQuery criteriaQuery;
		if (count) {
			criteriaQuery = cb.createQuery(Long.class);
		} else {
			criteriaQuery = cb.createQuery(CaseReq.class);
		}
		Root<CaseReq> root = criteriaQuery.from(CaseReq.class);
		if (count) {
			criteriaQuery.select(cb.count(root));
		} else {
			criteriaQuery.select(root);
		}
		
		List<Predicate> conditions = new ArrayList<>();
		if (StringUtil.isNonEmptyEnum(searchBean.getMonitorLevel())) {
			conditions.add(cb.equal(root.get(CaseReq.ATTR_MONITOR_LEVEL).as(CaseMonitorLevelEnum.class), searchBean.getMonitorLevel()));
		}
		if (StringUtil.isNonEmptyEnum(searchBean.getType())) {
			conditions.add(cb.equal(root.get(CaseReq.ATTR_TYPE).as(CaseTypeEnum.class), searchBean.getType()));
		}
		if (StringUtil.isNonEmpty(searchBean.getManagerUnitId())) {
			conditions.add(cb.equal(root.get(CaseReq.ATTR_MANAGER_EMP).get(Employee.ATTR_UNIT).get(Unit.ATTR_UNIT_ID).as(String.class), searchBean.getManagerUnitId()));
		}
		if (StringUtil.isNonEmpty(searchBean.getContactUnitId())) {
			conditions.add(cb.equal(root.get(CaseReq.ATTR_CONTACT_EMP).get(Employee.ATTR_UNIT).get(Unit.ATTR_UNIT_ID).as(String.class), searchBean.getContactUnitId()));
		}
		criteriaQuery.where(conditions.toArray(new Predicate[]{}));
		Query query = session.createQuery(criteriaQuery);
		
		if (!count && !searchBean.getReportSearch()) {
			query.setFirstResult((searchBean.getCurrentPage()- 1) * searchBean.getPageNumber());
			query.setMaxResults(searchBean.getPageNumber());
		}
		return query;
	}
	
}
