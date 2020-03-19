package com.webcomm.oa.util;

import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;

public class DateUtil {
	public static String DATE_DORMAT = "yyyy/MM/dd";
	
	public static Date shiftDate(Date date, Integer field, Integer amount) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(field, amount);
		return c.getTime();
	}
	
	public static String getRocDateStr(Date date) {
		String dateStr = DateFormatUtils.format(date, DATE_DORMAT);
		return (Integer.valueOf(dateStr.substring(0, 4)) - 1911) + dateStr.substring(4);
	}
}
