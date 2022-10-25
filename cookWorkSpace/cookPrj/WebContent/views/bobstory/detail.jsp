<%@page import="com.kh.cook.bobstory.vo.AttachmentVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BobstoryVo vo = (BobstoryVo)request.getAttribute("vo");
	AttachmentVo attVo = (AttachmentVo)request.getAttribute("attachmentVo");
	if(attVo == null){
		attVo = new AttachmentVo();
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥이야기 상세페이지</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/detail.css">
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container">
			<br>
			<br>
			<p>쿡 스토리</p>
			<br>
			<hr>
			<br>
			<table class="table">
				<thead>
					<th scope="col"><%=vo.getTitle()%></th>
					<th scope="col"><%=vo.getViewCount()%></th>
					<th scope="col"><%=vo.getWriter()%></th>
					<th scope="col"><%=vo.getEnrollDate()%></th>
				</thead>
				<tbody>
					<tr>
						<td><%=vo.getContent()%></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="vote_btn">
				<input type="button" value="좋아요">
				<input type="button" value="신고">
			</div>
			<!-- <div id = "main">
				<div><%=vo.getCategory() %></div>
				<div><%=vo.getTitle() %></div>
				<div><%=vo.getWriter() %></div>
				<div><%=vo.getViewCount() %></div>
				<div><%=vo.getEnrollDate() %></div>
				<div><%=vo.getcLike()%></div>
				<div id="content-box"><%=vo.getContent() %></div>
				<div id="img-box"><img alt="사진" src="/cookTeacher/<%=attVo.getFilePath() %>/<%=attVo.getChangeName() %>" width="100px" height="100px"></div>
			</div> -->
			<%if(loginMember != null && loginMember.getNick() == vo.getWriter()){%>
			<div id="main-bot">
				<a href="/cookTeacher/bobstory/edit?no=<%=vo.getNo()%>">수정하기</a>
				<a href="/cookTeacher/bobstory/delete?no=<%=vo.getNo()%>">삭제하기</a>
			<%}%>
		</div>
	<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
		
</body>
</html>