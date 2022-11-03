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
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/edit.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>집밥쿡선생 :: 쿡스토리</title>
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container">
			<br>
			<br>
			<p>쿡 스토리 수정하기</p>
			<br>
			<br>
			<form action="" method="post">
				<table class="table">
					<thead>
						<tr class="ta-1">
						<td class="t-ti" ><input type="text" name="title" value="<%=vo.getTitle()%>" style="width: 400px; height: 26px;"></td>
						</tr>
						<tr class="ta-2">
						<td class="t-wr"><p><%=vo.getWriter()%></p></td>
						<td class="t-da" ><%=vo.getEnrollDate()%></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2"><textarea name="content" cols="110" rows="25"><%=vo.getContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<hr>
			
				<%if(loginMember != null && loginMember.getNick().equals(vo.getWriter())){%>
				<div id="main-bot">
					<input type="submit" value="수정하기">
				<%}%>
				</div>
			</form>
	<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
</body>
</html>