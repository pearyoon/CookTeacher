<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
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

<link rel="stylesheet" href="/cookTeacher/resources/css/product/reviewWrite.css">

<!-- 수량 버튼 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="./10-11.css">

</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    	<br>
    	<div id="review-top">
    	</div>
			<form action="/cookTeacher/product/detail/ReviewWrite" method="post">
				  <div id="board-list">
                            <div class="container">
                    	    	<br><h1 align="left">■ 리뷰 작성하기&nbsp;&nbsp;<img src="/cookTeacher/upload/img/note.png" style="height: 5%; width: 5%"></h1><br>
	                                <table class="board-table">
	                                    <thead>
		                                    <tr id="table-head">
		                                        <th colspan="2" scope="col" class="th-content" name="content">내용</th>
		                                    </tr>
	                                    </thead>
	                                    <tbody>
		                                    </tr>
		                                        <td><input type="hidden"name="prodNo" value="${reviewNo}"></td>
		                                        <td><textarea rows="" cols="" name="content"></textarea></td>
		                                    </tr>
	                                    </tbody>
	                                </table>
	                                <br>
	                                <div id="bttn-wrapper" align="center">
		                               	<a href="/cookTeacher/product/main/productList">
		                               	<input type="button" value="취소하기" id="write-bttn" style="font-size: 15px;"></a>
		                               	<input type="submit" value="작성하기" id="write-bttn" style="font-size: 15px;">
	                                </div>
                            </div>
                     </div>
			</form>
    

</body>
</html>