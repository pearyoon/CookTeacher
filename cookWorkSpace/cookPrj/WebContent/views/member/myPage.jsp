<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/myPage.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="main-top">
                <div id="mem-info">
                    <div id="mem-nick">
                        <div>쿡선생회원님</div>
                    </div>
                    <div class="flex">
                        <div>일반</div>
                        <div>적립 1%</div>
                    </div>
                    <div class="flex">
                        <div>포인트</div>
                        <div>3000점</div>
                    </div>
                </div>
            </div>
            <div id="main-bottom">

            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>