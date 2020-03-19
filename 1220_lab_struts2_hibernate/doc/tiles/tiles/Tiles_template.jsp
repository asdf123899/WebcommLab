<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 匯入自己的script -->

<title>TilesPractice</title>
</head>
<body>
    <div class="container">
        <tiles:insertAttribute name="tiles_header"/>
        <div class="main">
             <tiles:insertAttribute name='tiles_main'/>
        </div>
        <tiles:insertAttribute name="tiles_footer"/>
    </div>
</body>
</html>