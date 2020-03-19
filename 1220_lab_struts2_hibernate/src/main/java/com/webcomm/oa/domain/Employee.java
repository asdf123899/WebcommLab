package com.webcomm.oa.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * The Class Employee.
 */
@Entity
@Table(name = "EMPLOYEE")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
public class Employee implements Serializable {

	/** The attr emp id. */
	public static String ATTR_EMP_ID = "empId";

	/** The attr name. */
	public static String ATTR_NAME = "name";

	/** The attr unit. */
	public static String ATTR_UNIT = "unit";

	/** The emp id. */
	@Id
	@Column(name = "EMP_ID", length = 7, nullable = false)
	private String empId;

	/** The unit. */
	@ManyToOne
	@JoinColumn(name = "UNIT_ID")
	private Unit unit = new Unit();

	/** The name. */
	@Column(name = "NAME", length = 20, nullable = false)
	private String name;

	public String getLabel() {
		return unit == null ? "" : unit.getName() + "-" + getName() + "(" + getEmpId() + ")";
	}
}
