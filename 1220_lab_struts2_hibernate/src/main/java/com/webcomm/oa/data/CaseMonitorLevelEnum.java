package com.webcomm.oa.data;

import lombok.Getter;

/**
 * The Enum CaseMonitorLevelEnum.
 */
public enum CaseMonitorLevelEnum {
	/** (Default). */
	Default_ALL(0, "Default_ALL")
	
	/**  	報部列管 (ReportForControl). */
	, ReportForControl(1, "報部列管 (ReportForControl)")
	
	/**  	科室列管 (DeptControl). */
    , DeptControl(2, "科室列管 (DeptControl)")
    
    /**  	局列管 (BureauControl). */
    , BureauControl(3, "局列管 (BureauControl)")
    
    /**  	不列管 (NoControl). */
	,  NoControl(4, "不列管 (NoControl)");
	
	/**
	 * Gets the all enums.
	 *
	 * @return the all enums
	 */
	@Getter
    private static CaseMonitorLevelEnum[] allEnums = { ReportForControl, DeptControl, BureauControl, NoControl };
    
    /**
     * Gets the value.
     *
     * @return the value
     */
    @Getter
    private Integer value;
    
    /**
     * Gets the label.
     *
     * @return the label
     */
    @Getter
    private String label;

    /**
     * Instantiates a new case monitor level enum.
     *
     * @param value the value
     * @param label the label
     */
    private CaseMonitorLevelEnum(Integer value, String label) {
    	this.value = value;
    	this.label = label;
    }
}

