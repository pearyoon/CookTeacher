<%@page import="com.kh.cook.bobstory.vo.PageVo"%>
<%@page import="com.kh.cook.report.vo.ReportVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReportVo> voList = (List<ReportVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
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
			<br>
			<br>
			<h1 align="center">신고 게시판</h1>
			<br>
			<br>
			<table class="report-table">
				<thead>
					<th>번호</th>
					<th>작성자</th>
					<th>조회수</th>
				</thead>
				<tbody>
				<%for(int i = 0; i < voList.size(); i++){%>
					<tr align="center">
						<th><%=voList.get(i).getNo() %></th>
						<th><a href="<%=root%>/board/detail?bno=<%=voList.get(i).getNo() %>"><%=voList.get(i).getWriter() %></a></th>
						<th><%=voList.get(i).getHit() %></th>
					</tr>
				<%} %>	
				</tbody>
			</table>

			<div id="page-area">
			        	
				<%if(pv.getStartPage() != 1){%>
					<a href="/cookTeacher/bobstory/list?pno=<%=pv.getStartPage()-1%>" class="btn">이전</a>
				<%}%>
			
			
				<%for(int i = pv.getStartPage(); i <= pv.getEndPage(); i++){%>
					<a href="/cookTeacher/bobstory/list?pno=<%=i%>" class="btn"><%=i%></a>
				<%}%>
				
				<%if(pv.getEndPage() != pv.getMaxPage()){%>
						<a href="/cookTeacher/bobstory/list?pno=<%=pv.getEndPage()+1 %>" class="btn">다음</a>
				<%}%>
				
				
			</div>
		<%-- 	<div id="main">
			
				<div>번호</div>
				<div>작성자</div>
				<div>조회수</div>
				
				<%for(int i = 0; i < voList.size(); i++) {%>
					<div><%=voList.get(i).getNo() %></div>
		            <div><a href="/app99/notice/detail?no=<%=voList.get(i).getNo() %>"><%=voList.get(i).getWriter() %></a></div>
		            <div><%=voList.get(i).getHit() %></div>
				<%} %>
			</div> --%>
			
		</main>
	<%@ include file="/views/common/footer.jsp" %>	
	</div>
</body>
</html>