<%@page import="com.kh.cook.bobstory.vo.PageVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BobstoryVo> voList = (List<BobstoryVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BobStory</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/list.css">

</head>
<body>
		<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container"> <!-- 컨테이너 -->
			<br>
			<br>
			<h1 align="center">쿡 스토리</h1>
			<br>
			<br>
			<table class="table table-striped">
				<thead>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>조회수</th>
				</thead>
				<tbody>
				<%for(int i = 0; i < voList.size(); i++){%>
					<tr align="center">
						<th><%=voList.get(i).getNo() %></th>
						<th><a href="<%=root%>/board/detail?bno=<%=voList.get(i).getNo() %>"><%=voList.get(i).getTitle() %></a></th>
						<th><%=voList.get(i).getWriter() %></th>
						<th><%=voList.get(i).getEnrollDate() %></th>
						<th><%=voList.get(i).getViewCount() %></th>
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

			<!-- <div id="main">
				<%if(loginMember != null){%>
			        <div id="main-top">
			            <a href="/cookTeacher/bobstory/write">글쓰기</a>
			        </div>
				<%}%>
			
			        <div>번호</div>
			        <div>제목</div>
			        <div>작성자</div>
			        <div>작성일시</div>
			        <div>조회수</div>
			        
			        <%for(int i = 0; i < voList.size(); i++){%>
			        	<div><%=voList.get(i).getNo() %></div>
			        	<div><a href="<%=root%>/board/detail?bno=<%=voList.get(i).getNo() %>"><%=voList.get(i).getTitle() %></a></div>
			        	<div><%=voList.get(i).getWriter() %></div>
			        	<div><%=voList.get(i).getEnrollDate() %></div>
			        	<div><%=voList.get(i).getViewCount() %></div>		
			        <%}%>
			
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
			
			    </div> -->
			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>

</body>
</html>