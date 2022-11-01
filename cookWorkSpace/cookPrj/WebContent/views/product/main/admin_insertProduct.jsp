<%@page import="com.kh.cook.product.vo.PageVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	ProductVo vo = (ProductVo)request.getAttribute("vo");
	String prodNo = (String)request.getAttribute("prodNo");

%>
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
		        		<form id="enroll-form" action="/cookTeacher/product/main/admin_insertProduct" method="post" enctype="multipart/form-data">
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
		                <tr>
		                    <th>리뷰 안내&nbsp;:&nbsp;&nbsp;</th>
		                    <td><input type="text" name="content" value="*[공지]* 리뷰 작성 시 건당 100p 지급합니다. 많은 참여 부탁드립니다 ^^" style="width:600px;"></td>
		                </tr>
		                <tr>
		                    <td><input type="hidden" name="prodNo"></td>
		                </tr>
	            		</table>
			            <div align="center">
			                <button type="submit" id="bottom-bttn">등록하기</button>
			                <button type="reset" id="bottom-bttn">취소하기</button>
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