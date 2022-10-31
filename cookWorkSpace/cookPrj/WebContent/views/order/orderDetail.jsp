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

<link rel="stylesheet" href="../resources/css/order/orderDetail.css">

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
                                <a href="/cookTeacher/mypage/member/orderDetail">
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
                           <h2 id="head-aticle">주문 내역 상세</h2>
                        </div>
                        <div class="order-header">
                            <h3 class="orderNo">주문번호 22797152599</h3>
                            <span class="askQnA">배송 또는 상품에 문제가 있나요?
                                <a href="">1:1 문의하기
                                    <img src="../../resources/img/icons/right-arrow.png" alt="문의하기" class="askImg">
                                </a>
                            </span>
                        </div>
                        
                    <div>
                    <div id="board-container"> 
                        <div class="board-wrapper">
                            <div class="thumb">
                                <img src="../../resources/img/product/청양고추.jpg" alt="청양고추">
                            </div>
                            <div class="productName">
                                <a href="">청양고추</a>
                                <div class="productPrice">
                                    <span class="price">3000원</span>
                                    <span class="cnt">1개</span>
                                </div>
                                
                            </div>
                            <span class="shipping">배송완료</span>
                            <div class="cartWrap">
                                <button class="cartAdd-btn">
                                    <span>장바구니 담기</span>
                                </button>
                            </div>
                        </div>
                        <div class="btn-wrapper">
                            <button class="product-cancel">
                                <span>전체 상품 주문 취소</span>
                            </button>
                        </div>
                        <span class="notice">주문취소는 [주문완료] 상태일 경우에만 가능합니다.</span>
                        <div class="payment-info">
                            <div class="payment-header">
                                <h3>결제정보</h3>
                            </div>
                            <ul>
                                <li class="list">
                                    <span class="listName">상품금액</span>
                                    <span class="pay-info">3000<span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">배송비</span>
                                    <span class="pay-info">2500<span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">결제금액</span>
                                    <span class="pay-info">5500<span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">적립금액</span>
                                    <span class="pay-info">5<span>원</span></span>
                                </li>
                                <li class="list">
                                    <span class="listName">결제방법</span>
                                    <span class="pay-info">카카오페이</span>
                                </li>
                            </ul>
                        </div>

                        <div class="order-info">
                            <div class="order-info-header">
                                <h3>주문정보</h3>
                            </div>
                            <ul>
                                <li class="list">
                                    <span class="info-name">주문번호</span>
                                    <span class="info">22797152599</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">보내는분</span>
                                    <span class="info">홍길동</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">결제일시</span>
                                    <span class="info">2022-10-31 22:00:00</span>
                                </li>
                            </ul>
                        </div>

                        <div class="order-info">
                            <div class="order-info-header">
                                <h3>배송정보</h3>
                            </div>
                            <ul>
                                <li class="list">
                                    <span class="info-name">받는분</span>
                                    <span class="info">홍길동</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">핸드폰</span>
                                    <span class="info">010-1111-1111</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">주소</span>
                                    <span class="info">강남구 테헤란로 111-111</span>
                                </li>
                                <li class="list">
                                    <span class="info-name">받으실 장소</span>
                                    <span class="info">문앞</span>
                                </li>
                            </ul>
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