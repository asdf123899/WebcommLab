package com.webcomm.oa.data;

public enum CaseTypeEnum {
	/** (Default). */
	Default_ALL(0, "全部")
	/** 總綱目 (General). */
	, General(1, "總綱目")
	/** 臨時列管 (TempControl. */
    , TempControl(2, "臨時列管")
    /** 非列管(原A類案件) (NoControl). */
    , NoControl(3, "非列管(原A類案件)");
    /** The all enums. */
    private static CaseTypeEnum[] allEnums = { Default_ALL, General, TempControl, NoControl };
    
    private int value;
    
    private String desc;

    private CaseTypeEnum(int value, String desc) {
    	this.value = value;
    	this.desc = desc;
    }

    public static CaseTypeEnum[] getAllEnums() {
        return allEnums;
    }
    public String getDesc() {
    	return desc;
    }
    public int getValue() {
        return value;
    }
    public static CaseTypeEnum getEnum(int value) {
        switch (value) {
        	case 0:
        		return Default_ALL;
            case 1:
                return General;
            case 2:
                return TempControl;
            case 3:
                return NoControl;
            default:
                return null;
        }
    }
    public static CaseTypeEnum getEnum(String value) {
        return CaseTypeEnum.valueOf(value);
    }
}
