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
</head>
<body>
	<div class="container">
		<form id="caseReq_Create_Form" action="doCreate.action" method="POST">
			<h5 class="display-3">新增畫面</h5>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="caseReq.caseNo">工作編號</label>
					<input type="text" class="form-control" name="caseReq.caseNo" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="caseReq.monitorLevel">列管層級</label>
					<s:select cssClass="custom-select d-block w-100"
						headerKey=""
						headerValue="請選擇"
						list="@com.webcomm.oa.data.CaseMonitorLevelEnum@getAllEnums()"
						listValue="label" name="caseReq.monitorLevel" />
				</div>
				<div class="col-md-6 mb-3">
					<label for="caseReq.type">類別</label>
					<s:select cssClass="custom-select d-block w-100"
						headerKey=""
						headerValue="請選擇"
						list="@com.webcomm.oa.data.CaseTypeEnum@getAllEnums()"
						listValue="label" name="caseReq.type" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="caseReq.managerEmp.empId">主管單位承辦人</label>
					<s:select cssClass="custom-select d-block w-100"
						headerKey=""
						headerValue="請選擇"
						list="employees" listKey="empId" listValue="label"
						name="caseReq.managerEmp.empId" />

				</div>
				<div class="col-md-6 mb-3">
					<label for="caseReq.contactEmp.empId">承辦單位承辦人</label>
					<s:select cssClass="custom-select d-block w-100" 
						headerKey=""
						headerValue="請選擇"
						list="employees" listKey="empId" listValue="label"
						name="caseReq.contactEmp.empId" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="caseReq.start">辦理啟日</label>
					<input type="date" class="form-control" name="caseReq.startDate"/>
				</div>
				<div class="col-md-6 mb-3">
					<label for="caseReq.end">辦理迄日</label>
					<input type="date" class="form-control" name="caseReq.endDate"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="caseReq.workItemDesc">工作項目</label>
					<textarea class="form-control" name="caseReq.workItemDesc"></textarea>
				</div>
			</div>
		</form>
		<p class="text-right">
			<button id='caseReq_save_btn' class="btn btn-primary btn-lg">儲存</button>
			<button id='caseReq_cancel_btn' class="btn btn-primary btn-lg">取消</button>
		</p>
	</div>
</body>
</html>