package com.webcomm.oa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webcomm.oa.domain.Employee;
import com.webcomm.oa.repository.BaseRepository;
import com.webcomm.oa.repository.EmployeeRepository;

@Service("employeeService")
public class EmployeeService extends BaseService<Employee> {
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@SuppressWarnings("rawtypes")
	@Override
	public BaseRepository getRepository() {
		return employeeRepository;
	}
	
}
