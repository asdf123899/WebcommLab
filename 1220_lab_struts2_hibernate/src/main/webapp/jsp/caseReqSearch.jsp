<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<s:url value="/css/bootstrap.min.css"  />">
<script src="<s:url value="/js/jquery.min.js"  />"></script>
<script src="<s:url value="/js/popper.min.js"  />"></script>
<script src="<s:url value="/js/bootstrap.min.js"/>"></script>
<script src="<s:url value="/js/caseReq.js"  />"></script>	
<script src="<s:url value="/js/jquery.twbsPagination.js"  />"></script>
<title>查詢畫面</title>
</head>
<body>
	<div id="caseReq_Search_Page">
		<div class="">
			<div class="container">
				<form id="caseReq_Search_Form" method="POST">
					<s:hidden name="searchBean.currentPage" />
					<s:hidden name="searchBean.pageNumber" />
					<h5 class="display-3">查詢條件</h5>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="searchBean.monitorLevel">列管層級</label> 
							<s:select cssClass="custom-select d-block w-100"
							headerKey=""
							headerValue="請選擇"
							list="@com.webcomm.oa.data.CaseMonitorLevelEnum@getAllEnums()" 
							listValue="label"
							name="searchBean.monitorLevel" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="searchBean.type">類別</label> 
							<s:select cssClass="custom-select d-block w-100"
							headerKey=""
							headerValue="請選擇"
							list="@com.webcomm.oa.data.CaseTypeEnum@getAllEnums()" 
							listValue="label"
							name="searchBean.type" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="searchBean.managerUnitId">主管單位</label> 
							<s:select cssClass="custom-select d-block w-100"
							headerKey=""
							headerValue="請選擇"
							list="units" 
							listKey="unitId"
							listValue="label"
							name="searchBean.managerUnitId" />
		
						</div>
						<div class="col-md-6 mb-3">
							<label for="searchBean.contactUnitId">承辦單位</label> 
							<s:select cssClass="custom-select d-block w-100"
							headerKey=""
							headerValue="請選擇"
							list="units" 
							listKey="unitId"
							listValue="label"
							name="searchBean.contactUnitId" />
						</div>
					</div>
				</form>
				<p class="text-right">
					<button id='caseReq_create_btn' class="btn btn-primary btn-lg">新增</button>
					<button id='caseReq_search_btn' class="btn btn-primary btn-lg">查詢</button>
					<button id='caseReq_print_btn' class="btn btn-primary btn-lg">列印</button>
				</p>
			</div>
		</div>
		<s:if test="%{resultPage}">
		<div class="container" >
			<div>
				查詢結果
				<button id='caseReq_delete_btn' class="btn btn-primary btn-sm">刪除</button>
			</div>
			<div class="table-responsive">
	        <table class="table table-striped table-lg">
	          <thead>
	            <tr>
	              <th>
	    			<input type="checkbox" id="check_all">
	              </th>
	              <th>項次</th>
	              <th>工作編號</th>
	              <th>類別</th>
	              <th>列管層級</th>
	              <th>主管單位</th>
	              <th>主管單位承辦人</th>
	              <th>承辦單位</th>
	              <th>承辦單位承辦人</th>
	              <th>辦理起日</th>
	              <th>辦理迄日</th>
	              <th>工作項目</th>
	              <th>功能</th>
	            </tr>
	          </thead>
	          <tbody>
		          <s:iterator status="status" value="caseReqList" >
		          	<tr>
		          		<td><input type="checkbox" id="check" value="<s:property value="caseNo" />"></td>
		          		<td><s:property value="#status.count" /></td>
		          		<td><s:property value="caseNo" /></td>
		          		<td><s:property value="type.label" /></td>
		          		<td><s:property value="monitorLevel.label" /></td>
		          		<td><s:property value="managerEmp.unit.label" /></td>
		          		<td><s:property value="managerEmp.label" /></td>
		          		<td><s:property value="contactEmp.unit.label" /></td>
		          		<td><s:property value="contactEmp.label" /></td>
		          		<td><s:date name="startDate" format="yyy-MM-dd" /></td>
		          		<td><s:date name="endDate" format="yyy-MM-dd" /></td>
		          		<td><s:property value="workItemDesc" /></td>
		          		<td><a class="btn btn-primary btn-sm" href="#" role="button" onclick="caseReqModel.preUpdate('<s:property value="caseNo" />')">修改</a></td>
		          	</tr>          
		          </s:iterator>
	          </tbody>
	        </table>
	      </div>
	           每頁筆數: <s:select list="pageNumbers" name="pageNumber" />
		  <ul class="pagination"></ul>
		</div>
	</div>
	</s:if>
	<script>
		var totalPage = <s:property value="totalPage"/>;
		var pageNumber = <s:property value="pageNumber"/>;
		var currentPage = <s:property value="currentPage"/>;
		
		$('.pagination').twbsPagination({
			totalPages : totalPage,
			visiblePages : pageNumber,
			startPage: currentPage,
			onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#searchBean_currentPage').val(page);
					caseReqModel.search();
				}
			}
		});

		$('select[name="pageNumber"]').change((event) => {
			$('#searchBean_pageNumber').val(event.target.value);
			caseReqModel.search();
		});
		
	</script>
</body>
</html>