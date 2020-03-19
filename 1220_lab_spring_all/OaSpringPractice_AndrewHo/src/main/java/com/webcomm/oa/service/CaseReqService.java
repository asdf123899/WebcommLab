package com.webcomm.oa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webcomm.oa.domain.CaseReq;
import com.webcomm.oa.repository.BaseRepository;
import com.webcomm.oa.repository.CaseReqRepository;
import com.webcomm.oa.searchbean.CaseReqSearchBean;

@Service("caseReqService")
public class CaseReqService extends BaseService<CaseReq> {
	
	@Autowired
	private CaseReqRepository caseReqRepository;

	@SuppressWarnings("rawtypes")
	@Override
	public BaseRepository getRepository() {
		return caseReqRepository;
	}
	
}
