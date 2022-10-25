<%@page import="com.kh.cook.cs.vo.CSVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	CSVo FAQvo = (CSVo)request.getAttribute("FAQvo");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
#container>div{
	box-sizing: border-box;
}

#container{
    position: absolute;
    padding-bottom: 50px;
    top: 280px;
    left: 50%;
    transform: translate(-50%);

}
/* 타이틀 글자 */
.name{
/*position: absolute;*/
display: flex;

font-family: 'Inter';
font-style: normal;
font-weight: 600;
font-size: 30px;
line-height: 50px;
text-align: center;
color: #000000;
}

/* 제목 영역 */
.title-area{
	width: 600px;
	height: 50px;
	margin: 0px auto;
	border-top: 3px solid black;
	line-height: 50px;
	padding-left: 10px;
	padding-right: 10px;
}

/* 내용 영역 */
.content-area{
	width: 600px;
	height: 400px;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	padding: 10px;
	font-size: small;
}
/* 등록 버튼 */
#writebtn{
	height: 20px;
	display: flex;
	flex-direction: row-reverse;
	font-size: small;
	margin: 5px;
}
#writebtn>a{
	margin: 10px;
}
</style>
</head>
<body>
<%@include file="/views/common/header.jsp" %>

<!-- 관리자만 가능한 기능 -->
	
	
	<div id="container"> <!-- 컨테이너 -->
		<div class="name">
			<!-- 게시판 이름 -->
			<div id="qna">FAQ 자주묻는질문</div>
		</div>

		<div class="title-area">
				제목 : <%= FAQvo.getTitle() %>
		</div>


		<div class="content-area">
			<br>
			<%=FAQvo.getContent() %>
			<br><br>
		</div>
		
	<%	if(loginMember != null && loginMember.getId().equals("admin")){ %>
	<div id=writebtn>
		<a href="/cookTeacher/cs/FAQ/edit?no=<%= FAQvo.getQnaNo() %>">수정</a>
		<a href="/cookTeacher/cs/FAQ/delete?no=<%= FAQvo.getQnaNo() %>">삭제</a>
	</div>		
	<% } %>
		
	<%@include file="/views/common/footer.jsp" %>
	</div>

</body>
</html>