<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 회원조회</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/admin/list.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>회원정보조회</div>
        <div class="list-wrap">
            <div class="list-top">
                <a href="">최신순</a>
                <span>|</span>
                <a href="">가입일순</a>
                <span>|</span>
                <a href="">탈퇴회원</a>
            </div>
            <div class="list-middle">
                <div id="list-title" class="list-flex">
                    <div>번호</div>
                    <div>이름</div>
                    <div>아이디</div>
                    <div>가입일</div>
                    <div>탈퇴여부</div>
                </div>
                <ul>
                    <li>
                        <a href="">
                            <div>
                                <div>1</div>
                                <div>배윤아</div>
                                <div>yoona0769</div>
                                <div>2022-10-28</div>
                                <div>O</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="search-wrap">
            <form action="">
                <div class="flex-box">
                    <div id="input-area">
                        <input type="text" name="memberId" placeholder="찾고 싶은 아이디를 입력해주세요.">
                    </div>
                    <div id="btn-area">
                        <button type="submit">
                            <span>찾기</span>
                            <i class="bi bi-search-heart"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    <script>
        $('input[name="memberId"]').focus(function(){
            $('input[name="memberId"]').css("border", "1px solid rgb(51, 51, 51)");
        });

        $('input[name="memberId"]').blur(function(){
            $('input[name="memberId"]').css("border", "1px solid rgb(221, 221, 221)");
        });

    </script>
</body>
</html>