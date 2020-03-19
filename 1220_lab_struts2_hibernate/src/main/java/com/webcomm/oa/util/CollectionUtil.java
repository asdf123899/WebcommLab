package com.webcomm.oa.util;

import java.util.List;

/**
 * The Class CollectionUtil.
 */
public class CollectionUtil {

	/**
	 * Checks if is empty.
	 *
	 * @param list the list
	 * @return the boolean
	 */
	public static Boolean isEmpty(List<?> list) {
		return list == null || list.isEmpty();
	}
	
	/**
	 * Checks if is non empty.
	 *
	 * @param list the list
	 * @return the boolean
	 */
	public static Boolean isNonEmpty(List<?> list) {
		return !isEmpty(list);
	}
}
