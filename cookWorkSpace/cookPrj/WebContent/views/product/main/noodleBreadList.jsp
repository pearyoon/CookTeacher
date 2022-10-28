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
<title>cookTeacher</title>
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

#main-title{
	font-size: 1rem;
	margin-top: 20px;
}

.main-prod-area{
	flex-wrap: wrap;
	justify-content: space-between;
	width: 100%;
	height: 100%;
	display: flex;
}

    
</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <hr>
            <div id="main-bottom">
            <img src="https://product-image.kurly.com/category/banner/pc/bca0156a-d599-4bf1-9a74-520a184d13ac.jpg">
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/fruitVegeList">과일/채소</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/seafoodList">해산물</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/meatEggList">육류 / 계란</a>
                    </div>
                    <div class="main-menu-bar-items" style="background-color: #255D00; box-shadow: 3px 3px #FFD335;">
                        <a href="/cookTeacher/product/main/noodleBreadList">면류 / 빵류</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/dairyList">유제품</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/drinkList">음료</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/etcList">기타</a>
                    </div>
                </div>
                <hr><div style="font-size: 20px; font-weight: 700; ">[ 면류 / 빵류 ]</div>
                <hr>
                <br><br>
                <div class="main-prod-area">
               		<%for(int i = 0; i < voList.size(); ++i){%>
               			<div>
	            			<a href="/cookTeacher/product/detail/productDetail?no=<%=voList.get(i).getProdNo() %>">
		                        <img src="/cookTeacher/upload/img/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %> / <%= voList.get(i).getWeight() %></div>
					            <div><%= voList.get(i).getPrice() %> 원</div>
	                        </a>
                        </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br>
					<%}%>
                </div>
                

		        <div id="page-area">
		        	<!-- 이전 버튼 -->
		        	<%if(pv.getStartPage() != 1){%>
			        	<a href="/cookTeacher/product/main/noodleBreadList?pno=<%= pv.getStartPage()-1 %>" class="btn btn-primary btn-sm">이전</a>
		        	<%}%>
		        	
		            <!-- 페이지 버튼 -->
		        	<%for(int i = pv.getStartPage(); i<= pv.getEndPage(); ++i){%>
			            <a href="/cookTeacher/product/main/noodleBreadList?pno=<%= i %>" class="btn btn-primary btn-sm"><%= i %></a>
		        	<%}%>
		        	
		        	<!-- 다음 버튼 -->
		        	<%if(pv.getEndPage() != pv.getMaxPage()){%>
					    <a href="/cookTeacher/product/main/noodleBreadList?pno=<%= pv.getEndPage()+1 %>" class="btn btn-primary btn-sm">다음</a>
		       		<%}%>
		        	
		        </div>
  

                 
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    

</body>
</html>