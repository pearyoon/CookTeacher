<%@page import="com.kh.cook.bobstory.vo.PageVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<span class="bb-title">제목</span>
					<span class="bb-writer">글쓴이</span>
					<span class="bb-date">날짜</span>
					<span class="bb-like">추천</span>
				</div>
					<div id="bob-content">
						<div>1</div>
						<div class="content-title">반복해서 나올 제목내용</div>
						<div>글쓴놈</div>
						<div>2201212</div>
						<div>0</div>					
					</div>
				<div class="board-footer">
					<input type="text" name="search-board" id="board-search" placeholder="검색">
					<input type="button" value="글쓰기" class="write-btn" onclick="location.href='/cookTeacher/views/write.jsp'">
				</div>
				<div id="page-area">
					<a href="">1</a>
					<a href="">2</a>
					<a href="">3</a>
					<a href="">4</a>           
				</div>
				<br>
			</div>
			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
		
</body>
</html>