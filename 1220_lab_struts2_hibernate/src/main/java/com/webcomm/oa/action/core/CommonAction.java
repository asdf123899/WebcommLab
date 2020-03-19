package com.webcomm.oa.action.core;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.webcomm.oa.domain.Employee;
import com.webcomm.oa.domain.Unit;
import com.webcomm.oa.impl.EmployeeServiceImpl;
import com.webcomm.oa.impl.UnitServiceImpl;
import com.webcomm.oa.pri.EmployeeService;
import com.webcomm.oa.pri.UnitService;
import com.webcomm.oa.to.BaseSearchBean;

import lombok.Getter;
import lombok.Setter;

public abstract class CommonAction {
	protected UnitService unitService;
	protected EmployeeService employeeService;
	private List<Unit> units;
	private List<Employee> employees;
	
	@Getter
	@Setter
	private Integer totalPage = 1;
	
	@Getter
	@Setter
	private Integer currentPage = 1;
	
	@Getter
	@Setter
	private Integer pageNumber = 5;
	
	@Getter
	private List<Integer> pageNumbers = Arrays.asList(5, 10, 20, 50, 100);
	
	@Getter
	@Setter
	private BaseSearchBean searchBean;
	
	@Getter
	@Setter
	private String msg;
	
	@Getter
	@Setter
	private String key;
	
	@Getter
	@Setter
	private List<String> keys;
	
	public CommonAction() {
		unitService = new UnitServiceImpl();
		employeeService = new EmployeeServiceImpl();
	}
	
	
	public List<Unit> getUnits() {
		if (units== null) {
			units = unitService.queryAll();
		}
		return units;
	}
	
	public List<Employee> getEmployees() {
		if (employees== null) {
			employees = employeeService.queryAll();
		}
		return employees;
	}
	
}
