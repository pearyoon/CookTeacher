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
    
</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>

<!-- 
- 해산물
- 과일
- 채소
- 곡식, 견과
- 육류, 계란
- 유제품
- 즉석 제품
- 음료
- 조미료, 양념, 가루 (튀김가루, 밀가루, 쌀가루)
- 면류, 빵류
 -->
            <hr>
            <div id="main-bottom">
            <div>카테고리 선택</div>
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/fruit_vege.jsp">과일/채소</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/seafood.jsp">해산물</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/meat_egg.jsp">육류/계란</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/noodle_bread.jsp">면류/빵류</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/dairy.jsp">유제품</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/drink.jsp">음료</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/views/product/main/etc.jsp">기타</a>
                    </div>
                </div>
                <hr>
                <br><br>
                <div class="main-prod-area">
               		<%for(int i = 1; i < 5; ++i){%>
               			<div>
	            			<a href="/cookTeacher/views/product/detail/dairy.jsp">
		                        <img src="/cookTeacher/resources/img/product/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %></div>
					            <div><%= voList.get(i).getPrice() %></div>
	                        </a>
                        </div>
					<%}%>
                </div>
                <div class="main-prod-area">
               		<%for(int i = 6; i < 10; ++i){%>
               			<div>
	            			<a href="/cookTeacher/views/product/detail/dairy.jsp">
		                        <img src="/cookTeacher/resources/img/product/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %></div>
					            <div><%= voList.get(i).getPrice() %></div>
	                        </a>
                        </div>
					<%}%>
                </div>
                <div class="main-prod-area">
               		<%for(int i = 11; i < 15; ++i){%>
               			<div>
	            			<a href="/cookTeacher/views/product/detail/dairy.jsp">
		                        <img src="/cookTeacher/resources/img/product/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %></div>
					            <div><%= voList.get(i).getPrice() %></div>
	                        </a>
                        </div>
					<%}%>
                </div>
                <div class="main-prod-area">
               		<%for(int i = 16; i < 20; ++i){%>
               			<div>
	            			<a href="/cookTeacher/views/product/detail/dairy.jsp">
		                        <img src="/cookTeacher/resources/img/product/<%=voList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
					            <div><%= voList.get(i).getName() %></div>
					            <div><%= voList.get(i).getPrice() %></div>
	                        </a>
                        </div>
					<%}%>
                </div>

		        <div id="page-area">
		        	<!-- 이전 버튼 -->
		        	<%if(pv.getStartPage() != 1){%>
			        	<a href="/cookTeacher/product/main/productList?pno=<%= pv.getStartPage()-1 %>" class="btn btn-primary btn-sm">이전</a>
		        	<%}%>
		        	
		            <!-- 페이지 버튼 -->
		        	<%for(int i = pv.getStartPage(); i<= pv.getEndPage(); ++i){%>
			            <a href="/cookTeacher/product/main/productList?pno=<%= i %>" class="btn btn-primary btn-sm"><%= i %></a>
		        	<%}%>
		        	
		        	<!-- 다음 버튼 -->
		        	<%if(pv.getEndPage() != pv.getMaxPage()){%>
					    <a href="/cookTeacher/product/main/productList?pno=<%= pv.getEndPage()+1 %>" class="btn btn-primary btn-sm">다음</a>
		       		<%}%>
		        	
		        </div>

                 
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    

</body>
</html>