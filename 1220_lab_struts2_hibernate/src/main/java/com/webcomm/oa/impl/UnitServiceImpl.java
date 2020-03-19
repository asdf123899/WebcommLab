package com.webcomm.oa.impl;

import java.util.List;

import com.webcomm.oa.dao.UnitDao;
import com.webcomm.oa.domain.Unit;
import com.webcomm.oa.pri.UnitService;

/**
 * The Class UnitServiceImpl.
 */
public class UnitServiceImpl implements UnitService {

	/** The unit dao. */
	private UnitDao unitDao = new UnitDao();
	
	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<Unit> queryAll() {
		return unitDao.queryAll();
	}

}
