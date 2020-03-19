package com.webcomm.oa.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "UNIT")
public class Unit implements Serializable {
	private static final long serialVersionUID = 1L;

	public static String ATTR_UNIT_ID = "unitId";
	public static String ATTR_NAME = "name";
	
	@Id
    @Column(name = "UNIT_ID", nullable = false)
    private String unitId;
    
    @Column(name = "NAME", nullable = false)
    private String name;

    public String getLabel() {
		return getName() + "(" + getUnitId() + ")";
	}
    
	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

}
