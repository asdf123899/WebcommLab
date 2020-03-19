package com.webcomm.oa.data;

public enum CaseMonitorLevelEnum {
	/** (Default). */
	Default_ALL(0, "全部")
	/** 報部列管 (ReportForControl). */
	, ReportForControl(1, "報部列管")
	/** 科室列管(DeptControl). */
    , DeptControl(2, "科室列管")
    /** 局列管(BureauControl). */
    , BureauControl(3, "局列管")
    /** 不列管(NoControl). */
    , NoControl(4, "不列管") ;
	
    /** The all enums. */
    private static CaseMonitorLevelEnum[] allEnums = { Default_ALL, ReportForControl, DeptControl, BureauControl, NoControl };
    
    private int value;
    
    private String desc;

    private CaseMonitorLevelEnum(int value, String desc) {
    	this.value = value;
    	this.desc = desc;
    }

    public static CaseMonitorLevelEnum[] getAllEnums() {
        return allEnums;
    }
    
    public String getDesc() {
    	return desc;
    }
    public int getValue() {
        return value;
    }
    public static CaseMonitorLevelEnum getEnum(int value) {
        switch (value) {
        	case 0:
        		return Default_ALL;
            case 1:
                return ReportForControl;
            case 2:
                return DeptControl;
            case 3:
                return BureauControl;
            default:
                return null;
        }
    }
    public static CaseMonitorLevelEnum getEnum(String value) {
        return CaseMonitorLevelEnum.valueOf(value);
    }
}
