<%@page import="com.kh.cook.cart.vo.CartVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CartVo vo = (CartVo)request.getAttribute("vo");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<!-- 수량 버튼 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="./10-11.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

div{
    --border: 1px solid black;
}
#product-name{
	text-align: left;

}
#product-main-img/product{
    width: 100px;
}
.inner{
    width: 70%;
    height: 15%;
    --display: flex;
    margin: 0 auto;
    font-size: 20px;
}
.basketprice{
    width: 70%;
    height: 15%;
    --display: flex;
    margin: 0 auto;
    font-size: 20px;
}
.inner-last{
    width: 70%;
    height: 30%;
    line-height: 14rem;
    display: flex;
    margin: 0 auto;
}
.outer{
    font-weight: 800;
    font-size: 20px;
}
#real-name{
    font-size: 24px;
    --display: flex;
    margin: 0 auto;

}
#product-detail-info{
    font-size: medium;
}
.main-menu-bar-items{
    width: 30%;
    font-weight: 700;
    background-color: #255D00;
    box-shadow: 3px 3px #FFD335;
}
.main-menu-bar-items > a{
    color : white;
}


#main{
    width: 60vw;
    height: 60vh;
    display: grid;
    grid-template-rows: repeat(11 , 30px);
    grid-template-columns: 1fr 5fr 3fr 3fr;
    margin: 0 auto;
    border: 1px solid black;
    align-content: center;
    row-gap: 10px;
}
#big-name{
    font-size: 30px;
    font-weight: 500;
}
.review-outer, .review-inner{
    border: 1px solid black;
    box-sizing: border-box;
    height: 30px;
}
#t1{
    display: flex;
    display: grid;
    grid-template-columns: 6fr 1.5fr 1fr;
}
#t1 > div{
    border: 1px solid black;
    --display: grid;
    --grid-template-columns: 5fr 4fr 3fr;
}
/* 리뷰 */
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 20px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
  font-size: 19px;
  font-weight: 500;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 250px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
  font-size: 16px;
  font-weight: 400;

}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: center;
  font-size: 16px;
  font-weight: 400;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

#write-bttn{
    text-align: center;
    width: 100px;
}
#table-head{
    background-color: rgba(211, 211, 211, 0.566);
}


.css-1qirdbn {
    --display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 80%;
    height: 52px;
    border-radius: 10px;
    color: black;
    background-color: #FFD335;
    --border: 0px none;
    border: 2px solid #255D00;
    font-size: medium;
    font-weight: 700;
}


button[disabled], input[disabled] {
    cursor: default;
}

.css-1e90glc {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iI0RERCIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
    vertical-align: top;
}
.css-18y6jr4 {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xNiAxMHY0aDR2MmgtNHY0aC0ydi00aC00di0yaDR2LTRoMnoiIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyIvPgo8L3N2Zz4K);
    vertical-align: top;
}


.fa-arrow-alt-circle-up:before {
    content: "\f35b";
}

.fa-arrow-alt-circle-down:before {
    content: "\f358";
}

#main-menu-area{
	height: 550px;

}

#header-search-area>button {
	width: 45px;
	height: 45px;
	background-color: white;
	border-left: white;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
        	<h1>여기에 장바구니에 담을 식재료, 수량 넘기면 됨</h1>
        	
        	<h2><%= vo.getCnt() %></h2>
        	
        
        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
                


    
    

</body>
</html>