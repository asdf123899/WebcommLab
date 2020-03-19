package com.webcomm.oa.to;

import com.webcomm.oa.data.CaseMonitorLevelEnum;
import com.webcomm.oa.data.CaseTypeEnum;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Instantiates a new case req search bean.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CaseReqSearchBean extends BaseSearchBean {
	
	/** The monitor level. */
	private CaseMonitorLevelEnum monitorLevel;

	/** The type. */
	private CaseTypeEnum type;

	/** The manager unit id. */
	private String managerUnitId;

	/** The contact unit id. */
	private String contactUnitId;

}
