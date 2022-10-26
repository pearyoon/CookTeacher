<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 비밀번호 변경</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/success/pwd.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	    <div id="container">
        <main>
            <div>비밀번호 변경</div>
            <div class="modify-wrap">
                <form action="" method="post" onsubmit="return checkPwd();">
                    <div class="modify-items">
                        <label for="memberName">새 비밀번호</label>
                        <div>
                            <input id="memberPwd1" type="text" name="memberPwd1" placeholder="비밀번호을 입력해주세요.">
                        </div>
                    </div>
                        <div class="hidden-box">
                            <p id="hidden-pwd1"></p>
                        </div>
                    <div class="modify-items">
                        <label for="memberPwd2">새 비밀번호 확인</label>
                        <div>
                            <input id="memberPwd2" type="text" name="memberPwd2" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div class="hidden-box">
                        <p id="hidden-pwd2"></p>
                    </div>
                    
                    <div class="modify-btn">
                        <button type="submit">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>
	<script>
        let pwd1ck = false
        $('#memberPwd1').keyup(function(){
            
        });
    </script>
</body>
</html>