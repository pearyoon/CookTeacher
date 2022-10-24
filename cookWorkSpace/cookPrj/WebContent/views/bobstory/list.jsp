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
<style>
	
</style>
</head>
<body>
		<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container"> <!-- 컨테이너 -->
			<div class="bob-main">
					<img src="/cookTeacher/resources/img/icons/bobstory.png" alt="밥책" width="50px" height="40px">
					<h1>밥 스토리</h1>
			</div>
			<div id="main">
				<div class="soon">
					<span><a href="">추천순 </a></span>
					<span><a href=""> 조회순 </a></span>
					<span><a href=""> 댓글순</a></span>
				</div>
				<div class="bob-board-head">
					<span class="bb-num">번호</span>
					<span class="bb-title">글제목</span>
					<span class="bb-writer">작성자</span>
					<span class="bb-date">작성일</span>
					<span class="bb-like">추천수</span>
				</div>
				<div id="bob-content">
				<%for(int i = 0; i < voList.size(); i++) {%>
						<div><%=voList.get(i).getNo() %></div>
						<div class="content-title"><a href="/cookTeacher/bobstory/detail?bno<%=voList.get(i).getNo()%>"><%=voList.get(i).getTitle() %></a></div>
						<div><%=voList.get(i).getWriter() %></div>
						<div><%=voList.get(i).getEnrollDate() %></div>
						<div><%=voList.get(i).getcLike() %></div>					
				<%} %>
					</div>
				<div class="board-footer">
					<input type="text" name="search-board" id="board-search" placeholder="검색">
					<input type="button" value="글쓰기" class="write-btn" onclick="location.href='/cookTeacher/views/write.jsp'">
				</div>
				<br>
				<div id="page-area">
					<%if(pv.getStartPage() != 1){%>
	        	<a href="/cookTeacher/bobstory/list?pno=<%=pv.getStartPage()-1%>">이전</a>
		        	<%}%>
		        
			        <%for(int i = pv.getStartPage(); i <= pv.getEndPage(); i++){%>
				        <a href="/cookTeacher/bobstory/list?pno=<%=i%>"><%=i%></a>
			        <%}%>
			        
			        <%if(pv.getEndPage() != pv.getMaxPage()){%>
					        <a href="/cookTeacher/bobstory/list?pno=<%=pv.getEndPage()+1 %>">다음</a>
			        <%}%>          
				</div>
			</div>
			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
		
</body>
</html>