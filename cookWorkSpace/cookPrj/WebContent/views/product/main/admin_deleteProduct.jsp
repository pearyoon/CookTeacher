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

<link rel="stylesheet" href="/cookTeacher/resources/css/product/admin_insertProduct.css">

</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
        <hr>
        	<div id="main-bottom">
        		<div class="outer">
	        		<div id="admin_insert">
		        		<form id="enroll-form" action="/cookTeacher/product/main/admin_deleteProduct" method="post" enctype="multipart/form-data">
		        		<table>
		        		<tr>
		        			<th >카테고리&nbsp;:&nbsp;&nbsp;</th>
	                    	<td >
			        		<select id="option" name="cateNo">
			        			<option value="0" selected>선택</option>
			        			<option value="1">과일 🍓 / 채소 🥦</option>
			        			<option value="2">해산물 🐟</option>
			        			<option value="3">육류 🥩 / 계란 🥚</option>
			        			<option value="4">면 🍝 / 베이커리 🍞</option>
			        			<option value="5">유제품 🥛</option>
			        			<option value="6">음료 🧃</option>
			        			<option value="7">기타 🧂</option>
			        		</select>
		        		</tr> 
		                <tr>
		                    <th>이름&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="name" ></td>
		                </tr>
	            		</table>
			            <div align="center">
			                <button type="submit" id="bottom-bttn">삭제하기</button>
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