<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="com.kh.cook.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");

	MemberVo mvo = (MemberVo)request.getAttribute("loginMember");

	ReviewVo rvo = (ReviewVo)request.getAttribute("rvo");
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

<style>
div{
    --border: 1px solid black;
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
  --padding: 20px 0;
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
  width: 200px;
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
  width: 1050px;
  margin: 0 auto;
}

#table-head{
    background-color: rgba(211, 211, 211, 0.566);
}
#table-body{
    background-color: rgba(211, 211, 211, 0.566);
    
}

.review-space>textarea{
	width: 895px;
	height: 267px;
}

textarea {
    width: 500px;
    height: 30px;
    resize: none;
}

.container > h1{
	font-size: 20px;
	font-weight: 500;
}

#write-bttn{
	text-align: center;
	width: 100px;
	display: block;
	margin: auto;
	float: right;
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
    	<br>
    	<div id="review-top">
    	</div>
			<form action="/cookTeacher/product/detail/ReviewWrite" method="post">
				  <div id="board-list">
                            <div class="container">
                    	    	<br><h1 align="left">■ 리뷰 작성하기</h1><br>
	                                <table class="board-table">
	                                    <thead>
	                                    <tr id="table-head">
	                                      	<th scope="col" class="th-prodNo" name="prodNo">식재료</th>
	                                        <th scope="col" class="th-content" name="content">내용</th>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                    </tr>
	                                        <td><input name="prodNo" value="${reviewNo}"></td>
	                                        <td><textarea rows="" cols="" name="content"></textarea></td>
	                                    </tr>
	                                        <!-- <td>강동원</td> -->
	                                    </tbody>
	                                </table>
	                                <br>
	                                <div id="bttn-wrapper" align="center">
		                               	<a href="/cookTeacher"><input type="button" value="취소하기" id="write-bttn"></a>
		                               	<input type="submit" value="작성하기" id="write-bttn">
	                                </div>
                            </div>
                     </div>
			</form>
    

</body>
</html>