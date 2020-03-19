package com.webcomm.oa.impl;

import java.util.List;

import com.webcomm.oa.dao.CaseReqDao;
import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.pri.CaseReqService;
import com.webcomm.oa.to.CaseReqSearchBean;

/**
 * The Class CaseReqServiceImpl.
 */
public class CaseReqServiceImpl implements CaseReqService {

	/** The case req dao. */
	private CaseReqDao caseReqDao = new CaseReqDao();
	
	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<CaseReq> queryAll() {
		return caseReqDao.queryAll();
	}

	/**
	 * Query all.
	 *
	 * @param searchBean the search bean
	 * @return the list
	 */
	public List<CaseReq> queryAll(CaseReqSearchBean searchBean) {
		return caseReqDao.queryAll(searchBean);
	}
	
	/**
	 * Count.
	 *
	 * @param searchBean the search bean
	 * @return the long
	 */
	public Long count(CaseReqSearchBean searchBean) {
		return caseReqDao.count(searchBean);
	}

	/**
	 * Creates the.
	 *
	 * @param caseReq the case req
	 */
	public void create(CaseReq caseReq) {
		caseReqDao.save(caseReq);
	}

	/**
	 * Query one.
	 *
	 * @param caseNo the case no
	 * @return the case req
	 */
	public CaseReq queryOne(String caseNo) {
		return caseReqDao.queryOne(caseNo);
	}

	/**
	 * Update.
	 *
	 * @param caseReq the case req
	 */
	public void update(CaseReq caseReq) {
		caseReqDao.save(caseReq);
	}

	/**
	 * Batch delete.
	 *
	 * @param caseNos the case nos
	 */
	public void batchDelete(List<String> caseNos) {
		caseNos.stream().forEach(caseNo -> caseReqDao.delete(caseNo));
	}
}
