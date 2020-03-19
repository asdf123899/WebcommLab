package com.webcomm.oa.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE")
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static String ATTR_EMP_ID = "empId";
	public static String ATTR_NAME = "name";
	public static String ATTR_UNIT = "unit";
	
	@Id
    @Column(name = "EMP_ID", nullable = false)
    private String empId;
    
    @Column(name = "NAME", nullable = false)
    private String name;

    @ManyToOne
	@JoinColumn(name = "UNIT_ID", nullable = false)
	private Unit unit;
    
    public String getLabel() {
    	return unit == null ? "": unit.getName() + "-" + getName() + "(" + getEmpId() + ")";
    }

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}


}
