<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 아이디찾기</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/id.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>   
    <div id="container">
        <main>
            <div>아이디 찾기</div>
            <div id="find-area">
                <div>이메일 인증</div>
                <form action="/cookTeacher/member/find/id" method="post">
                    <div class="find-items">
                        <label for="memberName">이름</label>
                        <div>
                            <input id="memberName" type="text" name="memberName" placeholder="이름을 입력해주세요.">
                        </div>
                    </div>
                        <div id="hidden-name">
                            <p>가입 시 등록한 이름을 입력해주세요.</p>
                        </div>
                    <div class="find-items">
                        <label for="memberEmail">이메일</label>
                        <div>
                            <input id="memberEmail" type="text" name="memberEmail" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div id="hidden-email">
                        <p>가입 시 등록한 이메일을 입력해주세요.</p>
                    </div>
                    
                    <div id="find-btn">
                        <input type="submit" value="확인">
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>