<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 로그인</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/login.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>로그인</div>
        <div id="login-wrap">
            <form action="/cookTeacher/member/login" method="post">
                <div id="login-top">
                    <div>
                        <input type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                    </div>
                    <div>
                        <input type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요.">
                    </div>
                </div>
                <div id="findMem">
                    <a href="/cookTeacher/member/findId">아이디 찾기 </a>
                    <span> | </span>
                    <a href="/cookTeacher/member/findPwd"> 비밀번호 찾기</a>
                </div>
                <div id="btn">
                    <div>
                        <input type="submit" value="로그인"> 
                    </div>
                    <div>
                        <button>회원가입</button>
                    </div>   
                    
                </div>
            </form>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>