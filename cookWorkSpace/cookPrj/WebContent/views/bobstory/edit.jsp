<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BobstoryVo vo = (BobstoryVo)request.getAttribute("vo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿡스토리</title>
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container">
			<br>
			<br>
			<p>쿡 스토리</p>
			<br>
			<br>
			<table class="table">
				<thead>
					<tr class="ta-1">
					<td class="t-ti" ><%=vo.getTitle()%></td>
					</tr>
					<tr class="ta-2">
					<td class="t-wr"><p><%=vo.getWriter()%></p></td>
					<td class="t-da"><%=vo.getEnrollDate()%></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=vo.getContent()%></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="vote_btn">
				<input type="button" id="like_btn" value="좋아요">
				<input type="button" id="report_btn" value="신고">
			</div>
			<%if(loginMember != null && loginMember.getNick().equals(vo.getWriter())){%>
			<div id="main-bot">
				<a href="/cookTeacher/bobstory/edit?no=<%=vo.getNo()%>">수정하기</a>
				<a href="/cookTeacher/bobstory/delete?no=<%=vo.getNo()%>" class="check-d" onclick="delete_b();">삭제하기</a>
			<%}%>
		</div>
	<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
</body>
</html>