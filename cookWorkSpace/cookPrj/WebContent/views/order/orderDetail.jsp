<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view = (String)request.getAttribute("view");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/member/mypage/check.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/modify.css">

</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="mypage-area">
                <div id="mypage-left">
                    <h2 id="tit-aticle">마이쿡</h2>
                    <div id="inner">
                        <ul id="list-menu">
                            <li class="non-clcik">
                                <a href="/cookTeacher/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <div class="header">
                        <h2 id="head-aticle">주문내역</h2>
                        <span>최대 지난 1년간의 주문 내역까지 확인 할 수 있어요</span>
                    </div>
                    <div class="period">
                        <select class="dropdown">
                            <option>3개월</option>
                            <option>6개월</option>
                            <option>1년</option>
                        </select>
                    </div>
                    <div id="line"></div>
                    <div id="board-container">
                        <div class="order-header">
                            <span>2022.11.07</span>
                            <a href="">주문내역 상세보기</a>
                        </div>
                        <div class="order-img">
                            <img src="../../resources/img/product/apple.png" alt="사과">
                        </div>
                        <div class="order-info">
                            <dl>
                                <dt>상품명</dt>
                                <dd>사과 외 2건</dd>
                            </dl>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>


    </script>
</body>
</html>