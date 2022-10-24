<%@page import="com.kh.cook.report.vo.ReportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReportVo vo = (ReportVo)request.getAttribute("vo");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="container">
		<h1 align="center">신고글 상세조회</h1>
		<div id="main">
			
		</div>
	<%@ include file="/views/common/footer.jsp" %>		
	</div>
	

</body>
</html>