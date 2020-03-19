package com.webcomm.oa.pri;

import java.util.List;

import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.to.CaseReqSearchBean;

/**
 * The Interface CaseReqService.
 */
public interface CaseReqService {
	
	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<CaseReq> queryAll();
	
	/**
	 * Count.
	 *
	 * @param searchBean the search bean
	 * @return the long
	 */
	public Long count(CaseReqSearchBean searchBean);
	
	/**
	 * Creates the.
	 *
	 * @param caseReq the case req
	 */
	public void create(CaseReq caseReq);
	
	/**
	 * Update.
	 *
	 * @param caseReq the case req
	 */
	public void update(CaseReq caseReq);
	
	/**
	 * Batch delete.
	 *
	 * @param caseNos the case nos
	 */
	public void batchDelete(List<String> caseNos);
	
	/**
	 * Query one.
	 *
	 * @param caseNo the case no
	 * @return the case req
	 */
	public CaseReq queryOne(String caseNo);
	
	/**
	 * Query all.
	 *
	 * @param searchBean the search bean
	 * @return the list
	 */
	public List<CaseReq> queryAll(CaseReqSearchBean searchBean);
}
