package com.webcomm.oa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webcomm.oa.domain.Unit;
import com.webcomm.oa.repository.BaseRepository;
import com.webcomm.oa.repository.UnitRepository;

@Service("unitService")
public class UnitService extends BaseService<Unit> {
	
	@Autowired
	private UnitRepository unitRepository;

	@SuppressWarnings("rawtypes")
	@Override
	public BaseRepository getRepository() {
		return unitRepository;
	}
	
}
