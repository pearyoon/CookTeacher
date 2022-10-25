<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.controller.ProductListController"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" defer src="/cookTeacher/resources/js/menu/detail.js"></script>
<%
	MenuVo vo = (MenuVo)request.getAttribute("vo");
	List<ProductVo> prodList = (List<ProductVo>)request.getAttribute("prodList");
%>


<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/detail.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src=""></script>

</head>
<body>

    <%@include file="/views/common/header.jsp" %>

    <div id="container">

        <main>
    
            <div id="recipe-detail">
                <div id="resipe" >|&nbsp;&nbsp; <%=vo.getMenuName() %> &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px;">
                <div id="ment"><label> <%=vo.getMenuInfo() %></label></div>
                    
                <hr width="60%" style=" margin-top: 20px; margin-bottom: 70px;">
                <div id="gap"></div>

            </div>
                    
            <div>
            <div id="grid">
                <div id="en">
                    <!-- 1 -->
                    <div id="re-img">
                    
                    <!-- 레시피 카테고리별로 이미지 폴더 어떻게 구분할지 -->

                    
                        <img id="re-imgimg" src="/cookTeacher/resources/img/<%=vo.getImgPath()%>" alt="" width="500px" height="500px">
                    </div>
                    
                    <!-- 2 -->
                    <div style="margin-top: 0;">
                        <div style="font-size: 2rem; margin-bottom: 10px; text-align: center;">
                            <button id="btn-title" type="button" class="btn btn-warning">
                                <label id="re-btn" style="font-size: large;">쿡선생의 비법</label>
                            </button>
                        
                        </div>
                        
                        
                        <script type="text/javascript">
                            
                            function ChnImg(){
                                
                                document.getElementById("imgId").src = "/cookTeacher/resources/img/icons/좋아요(초).jpg";
                                
                            }
                            
                            </script>

<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
    <script type="text/javascript">
        $("#pic").hover(
            function () { // mouseout
                $(this).attr("src","/cookTeacher/resources/img/좋아요(초).jpg");
            }
            );
        </script> -->
        
<pre style="white-space: pre-wrap; padding: 5px;">
<%=vo.getRecipe()%>
</pre>
    </div>    
                <div id="middle">
                    <div class="middle" style="font-size: 1.3rem;" >
                        <label id="kcal"><%=vo.getCal() %></label>
                        <img alt="" src="/cookTeacher/resources/img/icons/칼로리.jpg" alt="식재료게시판담당" id="imgid" width="35px" height="30px" onclick="ChnImg()">
                    </div>
                    <div class="middle" style="text-align: center; font-size: 0.8rem; font-weight: 700; line-height: 1.2rem; padding-left: 20px;">
                    <!-- 수정할 것!! => 메인이랑 레시피 연결 후 -->
                        <a href="/cookTeacher/views/menu/recipe_cate.jsp">
                            더 많은 레시피가
                            <br>궁금하다면?
                        </a>
                    </div>
                    <div class="middle" style="font-size: 1.5rem;" style="margin-right: 10px;">
                        <img alt="" src="/cookTeacher/resources/img/icons/좋(초).jpg" style="margin-right: 5px; margin-bottom: 13px;" alt="식재료게시판담당" id="imgid"  width="25px" height="25px" onclick="ChnImg()">
                        <label id="kcal"><%=vo.getRecommend()%></label>
                    </div>
                </div>
    

                    <!-- 3 -->
                   	<div id="menu-prod">

                        <div style="margin-bottom: 18px; border-top: 5px double black; padding-top: 30px; font-size: large; font-weight: 900">* 쿡선생표 비법 재료 !</div>
                        <div id="prod-name" ><%=vo.getMenuProd() %></div>
                    </div>
                    
                    <div id="prod-btn" >
                        <div style="border-top: 1px solid black; "></div>
	                    
                   <button id="btn" type="button" class="btn btn-warning" onclick="cartCheck()">
                        <label class="re-btn" style="font-size: large;">비법 퍼가기</label>
                        <label class="re-btn-click">퍼가요~♡</label>
                   </button>

                        
                        <div id="prod-ment" >* 장바구니에 담을 재료를 선택해주세요. 
                        <br> <br>
                        <input type='checkbox' name='product' value='selectall' onclick='selectAll(this)' style="justify-content: ;">모두 선택
                        </div>
                    </div>
                    
         

                    <div id="prod-img" style="width: 100%; height: 650px;">
                    
                    
                    <%for(int i = 0; i < prodList.size(); i++ ){%>
                    
                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/product/<%=prodList.get(i).getImgPath() %>" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                                
                            </div>    
                            <div style="margin-top : 10px" class="prod-price">
                                <input type="checkbox" name="product"><%=prodList.get(i).getName() %> / <%=prodList.get(i).getWeight() %>
                                <pre style="margin-bottom: 10px"><%=prodList.get(i).getPrice() %>원</pre>
                            </div>
                        </div>
                    		
                    <%} %>

					

                </div>
            </div>


            </div>
                
                
                
                
                
            </main>
            <!-- 인클루드 == 메인보다 밖에 있어야 함, 컨테이너 안에 있어야 함!-->
            <%@include file="/views/common/footer.jsp" %>
    </div>

    

</body>
</html>