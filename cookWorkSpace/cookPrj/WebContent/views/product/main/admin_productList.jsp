<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.cook.product.vo.PageVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ProductVo> voList = (List<ProductVo>)request.getAttribute("voList");
	PageVo pv = (PageVo)request.getAttribute("pv");
	DecimalFormat formatter = new DecimalFormat("###,###");
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

<link rel="stylesheet" href="/cookTeacher/resources/css/product/admin_productList.css">

</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
        <hr>
            <div id="main-bottom">
            <img src="/cookTeacher/resources/img/product/admin_gray.png" height="200px" width="1050px">
            <button class="btnMain" type="button" onclick="location.href='/cookTeacher/product/main/admin_insertProduct'">식재료 등록하기</button>
            <!-- <div id="main-title">카테고리 선택</div> -->
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/fruitVegeList">과일 / 채소</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/seafoodList">해산물</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/meatEggList">육류 / 계란</a>
                    </div>
                    <div class="main-menu-bar-items">
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
                   <hr><div style="font-size: 20px; font-weight: 700; ">[ 카테고리 선택 ]</div>
                <hr>
                <br><br>
                <div class="main-prod-area">
               		<%for(int i = 0; i < voList.size(); ++i){%>
               			<div>
	            			<a href="/cookTeacher/product/detail/productDetail?no=<%=voList.get(i).getProdNo() %>">
		                        <img src="/cookTeacher/upload/img/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %> / <%= voList.get(i).getWeight() %></div>
					            <div><%= formatter.format(Integer.parseInt(voList.get(i).getPrice())) %> 원</div>
	                        </a>
                        </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br> 
					<%}%>
                </div>
                
		        <div id="page-area">
		        	<!-- 이전 버튼 -->
		        	<%if(pv.getStartPage() != 1){%>
			        	<a href="/cookTeacher/product/main/admin_productList?pno=<%= pv.getStartPage()-1 %>" class="btn btn-success btn-sm">이전</a>
		        	<%}%>
		        	
		            <!-- 페이지 버튼 -->
		        	<%for(int i = pv.getStartPage(); i<= pv.getEndPage(); ++i){%>
			            <a href="/cookTeacher/product/main/admin_productList?pno=<%= i %>" class="btn btn-warning btn-sm"><%= i %></a>
		        	<%}%>
		        	
		        	<!-- 다음 버튼 -->
		        	<%if(pv.getEndPage() != pv.getMaxPage()){%>
					    <a href="/cookTeacher/product/main/admin_productList?pno=<%= pv.getEndPage()+1 %>" class="btn btn-success btn-sm">다음</a>
		       		<%}%>
		        	
		        </div>
  

                 
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    

</body>
</html>