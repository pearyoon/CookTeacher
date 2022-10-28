<%@page import="com.kh.cook.product.vo.PageVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 관리자 페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<style>

a {
	color: black;
}
a:link {
	text-decoration: none;
}
a:visited { 
	color: black; text-decoration: none;
}
a:hover { 
	text-decoration: none;
}

#main-menu-bar a{
    font-size: 16px;
    text-align: center;
}

#main-menu-bar {
margin-top: 30px;
margin-bottom: 30px;
}

#price{
    font-size: larger;
    font-weight: 700;
}
#category-name{
    font-weight: 800;
    font-size: xx-large;
}
#main-top>div:first-child, #main-middle>div:first-child, #main-bottom>div:first-child {
	font-size: 1.5rem;
	padding: 20px;
}   

.header-menu-items > a {
	color: white;
}
#header-search-area>button {
	width: 45px;
	height: 45px;
	background-color: white;
	border-left: white;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

.main-menu-bar-items > a:hover{
	color: white;
	
}
button.btnMain {
  position: absolute;
  top: 90px;
  left : 440px; 
}

.outer{
   --color: white;
   width: 100%;
   --height: 550px;
   margin: auto;
   padding-top: 50px;
}

#enroll-form table{border: 1px solid white; margin:auto;}
#enroll-form input, #enroll-form textarea{
   width: 100%;
   box-sizing: border-box;
}

table {
	border-collapse: separate;
	border-spacing: 0 20px;
}

#option{
	float: left;
	text-align: center;
}

</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
        <hr>
        	<div id="main-bottom">
        		<div class="outer">
	        		<div id="admin_insert">
		        		<form id="enroll-form" action="/cookTeacher/product/main/admin_insertProduct" method="post" enctype="multipart/form-data">
		        		<table>
		        		<tr>
		        			<th >카테고리&nbsp;:&nbsp;&nbsp;</th>
	                    	<td >
			        		<select id="option" name="cateNo">
			        			<option value="0" selected>선택</option>
			        			<option value="1">과일 / 채소</option>
			        			<option value="2">해산물</option>
			        			<option value="3">육류 / 계란</option>
			        			<option value="4">면 / 베이커리</option>
			        			<option value="5">유제품</option>
			        			<option value="6">음료</option>
			        			<option value="7">기타</option>
			        		</select>
		        		</tr> 
		        		<!-- 
		                <tr>
		                    <th>카테고리 번호&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="cateNo" ></td>
		                </tr> -->
		                <tr>
		                    <th>이름&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="name" ></td>
		                </tr>
		                <tr>
		                    <th>소개&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input name="info" rows="10" style="resize:none;" ></input></td>
		                </tr>
		                <tr>
		                    <th>상세 소개&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input name="detail" rows="10" style="resize:none;" ></input></td>
		                </tr>
		                <tr>
		                    <th>가격&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="price"></td>
		                </tr>
		                <tr>
		                    <th>무게&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="weight" ></td>
		                </tr>
		                <tr>
		                    <th>재고 수량&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="stock"></td>
		                </tr>
		                <tr>
		                    <th>메인 사진&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="file" name="file"></td>
		                </tr>
		         
	            		</table>
	            		
	            		<br><br>
	
			            <div align="center">
			                <button type="submit">작성하기</button>
			                <button type="reset">취소하기</button>
			            </div>
		        		</form>
	        		</div>
        		</div>
	        </div>
	        
	        
			<%@include file="/views/common/footer.jsp" %>
        </main>
    </div>
</body>
</html>