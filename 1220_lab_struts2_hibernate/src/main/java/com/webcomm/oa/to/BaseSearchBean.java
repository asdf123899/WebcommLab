package com.webcomm.oa.to;

import lombok.Data;

/**
 * Instantiates a new base search bean.
 */
@Data
public class BaseSearchBean {
	
	/** The current page. */
	private Integer currentPage = 1;

	/** The page number. */
	private Integer pageNumber = 5;
	
	/** The report search. */
	private Boolean reportSearch = false;
}
