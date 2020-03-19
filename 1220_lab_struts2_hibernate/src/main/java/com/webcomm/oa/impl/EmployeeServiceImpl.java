package com.webcomm.oa.impl;

import java.util.List;

import com.webcomm.oa.dao.EmployeeDao;
import com.webcomm.oa.domain.Employee;
import com.webcomm.oa.pri.EmployeeService;

/**
 * The Class EmployeeServiceImpl.
 */
public class EmployeeServiceImpl implements EmployeeService {
	
	/** The employee dao. */
	private EmployeeDao employeeDao = new EmployeeDao();
	
	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<Employee> queryAll() {
		return employeeDao.queryAll();
	}

	/**
	 * Query one.
	 *
	 * @param empId the emp id
	 * @return the employee
	 */
	public Employee queryOne(String empId) {
		return employeeDao.queryOne(empId);
	}
	
}
