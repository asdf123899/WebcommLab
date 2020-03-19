package com.webcomm.oa.data;

import lombok.Getter;

/**
 * The Enum CaseTypeEnum.
 */
public enum CaseTypeEnum {
	/** (Default). */
	Default_ALL(0, "Default_ALL")
	/** 總綱目 (General). */
	, General(1, "總綱目 (General)")
	/** 臨時列管 (TempControl. */
    , TempControl(2, "臨時列管 (TempControl")
    /** 非列管(原A類案件) (NoControl). */
    , NoControl(3, "非列管(原A類案件) (NoControl)");
	
	/**
	 * Gets the all enums.
	 *
	 * @return the all enums
	 */
	@Getter
    private static CaseTypeEnum[] allEnums = { General, TempControl, NoControl };
    
    /**
     * Gets the value.
     *
     * @return the value
     */
    
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
    
    /**
     * Gets the label.
     *
     * @return the label
     */
    @Getter
    private String label;

    /**
     * Instantiates a new case type enum.
     *
     * @param value the value
     * @param label the label
     */
    private CaseTypeEnum(Integer value, String label) {
    	this.value = value;
    	this.label = label;
    }
}
