<%@page import="com.kh.cook.report.vo.ReportVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReportVo> voList = (List<ReportVo>)request.getAttribute("voList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="container">
		<main>
			<h1 align="center">신고게시판</h1>
			
			<div id="main">
			
				<div>번호</div>
				<div>작성자</div>
				<div>조회수</div>
				
				<%for(int i = 0; i < voList.size(); i++) {%>
					<div><%=voList.get(i).getNo() %></div>
		            <div><a href="/app99/notice/detail?no=<%=voList.get(i).getNo() %>"><%=voList.get(i).getWriter() %></a></div>
		            <div><%=voList.get(i).getHit() %></div>
				<%} %>
			</div>
			
		</main>
	<%@ include file="/views/common/footer.jsp" %>	
	</div>
</body>
</html>