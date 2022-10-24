<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVo findMember = (MemberVo)session.getAttribute("findMember");
	session.removeAttribute("findMember");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 아이디 찾기</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/success/id.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %> 
	<div id="container">
		<main>
			<div class="main-items">
				<div class="top">
					<div>고객님의 집밥쿡선생 아이디를 찾았습니다.</div>
					<div>아이디 확인 후 로그인해주세요.</div>
				</div>
				<div class="middle">
					<div><%=findMember.getId() %></div>
					<div>가입일 : <%=findMember.getEnrollDate() %></div>
				</div>
				<div class="bottom">
					<button type="button" onclick="findPwdBtn();">
						<span>비밀번호 찾기</span>
					</button>
					<button type="button" onclick="loginBtn();">
						<span>로그인</span>
					</button>
				</div>
			</div>
		</main>
		<%@include file="/views/common/footer.jsp" %>
	</div>

	<script>

		function findPwdBtn(){
			window.location.href="/cookTeacher/member/find/pwd";
		};

		function loginBtn(){
			window.location.href="/cookTeacher/member/login";
		};

	</script>
</body>
</html>