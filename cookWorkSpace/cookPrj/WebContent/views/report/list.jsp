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
<title>집밥 쿡선생 :: 신고 게시판</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/report/list.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="container"> <!-- 컨테이너 -->
			<br>
			<br>
			<p>신고 게시판</p>
			<br>
			<br>
			<br>
			<table class="table">
				<thead>
					<th scope="col">번호</th>
					<th scope="col">유형</th>
					<th scope="col">작성자</th>
				</thead>
				<tbody>
				<%for(int i = 0; i < voList.size(); i++){%>
					<tr align="center">
						<td style="width: 150px;"><%=voList.get(i).getNo() %></td>
						<td style="width: 150px;"><%=voList.get(i).getType() %></td>
						<td style="width: 150px;"><a href="<%=root%>/bobstory/detail?bno=<%=voList.get(i).getNo() %>"><%=voList.get(i).getWriter() %></a></td>
					</tr>
				<%} %>	
				</tbody>
			</table>

			<div id="page-area">
			        	
				<%if(pv.getStartPage() != 1){%>
					<a href="/cookTeacher/report/list?pno=<%=pv.getStartPage()-1%>" class="btn"><</a>
				<%}%>
			
			
				<%for(int i = pv.getStartPage(); i <= pv.getEndPage(); i++){%>
					<a href="/cookTeacher/report/list?pno=<%=i%>" class="btn"><%=i%></a>
				<%}%>
				
				<%if(pv.getEndPage() != pv.getMaxPage()){%>
						<a href="/cookTeacher/report/list?pno=<%=pv.getEndPage()+1 %>" class="btn">></a>
				<%}%>
				
				
			</div>
		</main>
	<%@ include file="/views/common/footer.jsp" %>	
	</div>
</body>
</html>