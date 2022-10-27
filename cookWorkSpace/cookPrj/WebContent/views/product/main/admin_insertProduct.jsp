<%@page import="com.kh.cook.product.vo.PageVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ProductVo> voList = (List<ProductVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 쇼핑</title>
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
</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
        <hr>
            <div id="main-bottom">
            <tr>
            	<th>하이</th>
            	<td>하이</td>
            </tr>
                 
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    

</body>
</html>