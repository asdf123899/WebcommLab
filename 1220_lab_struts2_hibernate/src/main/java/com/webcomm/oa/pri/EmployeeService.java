package com.webcomm.oa.pri;

import java.util.List;

import com.webcomm.oa.domain.Employee;

/**
 * The Interface EmployeeService.
 */
public interface EmployeeService {
	
	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<Employee> queryAll();

	/**
	 * Query one.
	 *
	 * @param empId the emp id
	 * @return the employee
	 */
	public Employee queryOne(String empId);
}
