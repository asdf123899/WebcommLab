package com.webcomm.oa.util;

public class StringUtil {

	public static Boolean isEmpty(Object obj) {
		return obj == null || obj.toString().length() == 0;
	}
	
	public static Boolean isNonEmpty(Object obj) {
		return !isEmpty(obj);
	}
	
	public static Boolean isEmptyEnum(Enum e) {
		return e== null || e.ordinal() == 0;
	}
	
	public static Boolean isNonEmptyEnum(Enum e) {
		return !isEmptyEnum(e);
	}
}
