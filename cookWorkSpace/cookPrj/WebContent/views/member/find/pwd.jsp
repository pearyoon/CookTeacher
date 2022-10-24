<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 비밀번호찾기</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/id.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>   
    <div id="container">
        <main>
            <div>비밀번호 찾기</div>
            <div id="find-area">
                <div>휴대폰/이메일 인증</div>
                <form action="/cookTeacher/member/findPwd" method="post">
                    <div class="find-items">
                        <label for="find-id">아이디</label>
                        <div>
                            <input id="find-id" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                        </div>
                    </div>
                        <div id="hidden-name">
                            <p>가입 시 등록한 아이디를 입력해주세요.</p>
                        </div>
                    <div class="find-items">
                        <label for="find-phone">휴대폰</label>
                        <div>
                            <input id="find-phone" type="text" name="memberPhone" placeholder="번호만 입력해주세요.">
                        </div>
                    </div>
                        <div id="hidden-name">
                            <p>가입 시 등록한 휴대폰 번호를 입력해주세요.</p>
                        </div>    
                    <div class="find-items">
                        <label for="find-email">이메일</label>
                        <div>
                            <input id="find-email" type="text" name="memberEmail" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div id="hidden-email">
                        <p>가입 시 등록한 이메일을 입력해주세요.</p>
                    </div>
                    
                    <div id="find-btn">
                        <button type="submit" onclick="findPwd();">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>
        
    </script>
</body>
</html>