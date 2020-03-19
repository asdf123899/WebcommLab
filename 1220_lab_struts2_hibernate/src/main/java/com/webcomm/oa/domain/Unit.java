package com.webcomm.oa.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * The Class Unit.
 */
@Entity
@Table(name = "UNIT")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
public class Unit implements Serializable {
	
	/** The attr unit id. */
	public static String ATTR_UNIT_ID = "unitId";
	
	/** The attr name. */
	public static String ATTR_NAME = "name";
	
	/** The unit id. */
	@Id
	@Column(name = "UNIT_ID", length = 7, nullable = false)
	private String unitId;
	
	/** The name. */
	@Column(name = "NAME", length = 20, nullable = false)
	private String name;
	
	/**
	 * Gets the label.
	 *
	 * @return the label
	 */
	public String getLabel() {
		return name + " (" + unitId + ")";
	}

}
