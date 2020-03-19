<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap-select.min.css">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/common-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.slim.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.js"></script>
<style type="text/css">
@media (min-width:1000px){.container{padding:10px; max-width: 100%; max-height:100%; !important;}}
@media (min-width:1100px){.container {padding:10px; max-width: 100%; max-height:100%; !important;}}
@media (min-width:1200px){.container{padding:10px; max-width: 100%; max-height:100%; !important;}}
@media (min-width:1300px){.container {padding:10px; max-width: 100%; max-height:100%; !important;}}
@media (min-width:1400px){.container{padding:10px; max-width: 100%; max-height:100%; !important;}}
</style>
</head>
<body>
        <tiles:insertAttribute name="tiles_header"/>
    <div class="container">
        <div class="main">
             <tiles:insertAttribute name="tiles_main"/>
        </div>
        <tiles:insertAttribute name="tiles_footer"/>
    </div>
</body>
</html>