<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MenuVo> recommList = (List<MenuVo>)request.getAttribute("recommList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
         <!-- <h1 align="center" style="font-size: 2rem"><img src="/cookTeacher/resources/img/thumbs-up.png" style="height:3%; width:3%">&nbsp;&nbsp;쿡선생 추천</h1> --> 
            <div id="slide-area">
                <div class="slide-items">
                    <div style="width: 1050px; height: 400px; ">
                        <div id="carousel-example-generic" class="carousel slide" >
                          <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                          </ol>
                          <div class="carousel-inner" role="listbox">
                            <div class="item active">
                              <img src="/cookTeacher/resources/img/메인1.png" style="width:1050px ; height:400px; ">
                            </div>
                            <div class="item">
                              <a href="<%=root %>/menu/detail?no=40">
                              <img src="/cookTeacher/resources/img/best1.jpg" style="width:1050px ; height:400px; ">
                              </a>
                            </div>
                            <div class="item">
                            <a href="<%=root %>/menu/detail?no=26">
                              <img src="/cookTeacher/resources/img/best2.jpg" style="width:1050px ; height:400px; ">
                            </a>  
                            </div>
                          </div>
                          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          </a>
                          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          </a>
                        </div>
                      </div>
                </div>
            </div>
            <div id="main-middle">
               <br><hr style="border-top:3px solid #eee">
                <div id="recomm">쿡선생 PICK!<img alt="" src="/cookTeacher/resources/img/recipe.png" width="40px" height="43px" style="padding-top:10px; padding-left: 10px;" > </div>
               <hr style="border-top:3px solid #eee; margin-bottom: 30px"> 
                <div id="main-menu-area">
                    <div>
                        <a href="<%=root %>/menu/detail?no=41">
                            <img src="/cookTeacher/resources/img/양식레시피/토마토스파게티.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        <div class="main-reinfo">
                        </a>
                        양식이 끌리시나요? 간편하지만 맛있는!</div>
                        <div class="main-recipe" >
                        <img alt="" src="/cookTeacher/resources/img/check.png" style="width: 15px; height: 15px;">
                        토마토스파게티</div>
                    </div>
                    <div>
                        <a href="<%=root %>/menu/detail?no=9">
                            <img src="/cookTeacher/resources/img/한식레시피/galbitang.png" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div class="main-reinfo">요즘처럼 쌀쌀한 날, 속은 따뜻하게~</div>
                        <div class="main-recipe">
                         <img alt="" src="/cookTeacher/resources/img/check.png" style="width: 15px; height: 15px;">
                        갈비탕</div>
                    </div>
                    <div>
                        <a href="<%=root %>/menu/detail?no=16">
                            <img src="/cookTeacher/resources/img/반찬 레시피/jangjolim.PNG" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div class="main-reinfo">반찬계의 괴도키드!!</div>
                        <div class="main-recipe">
                         <img alt="" src="/cookTeacher/resources/img/check.png" style="width: 15px; height: 15px;">
                        장조림</div>
                    </div>
                </div>
            </div>
            <br><hr style="border-top:3px solid #eee">
            <div id="main-bottom">
                <div>식재료 쇼핑 <img src="/cookTeacher/resources/img/online-shopping.png" style="height:5%; width:5%"></div><hr style="border-top:3px solid #eee">
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
                        <a href="/cookTeacher/product/main/noodleBreadList">면 / 베이커리</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/dairyList">유제품</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="/cookTeacher/product/main/etcList">기타</a>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=143">
                            <img src="/cookTeacher/resources/img/product/p_토마토주스.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>토마토주스</div>
                        <div id="prod_price">3,500원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=119">
                            <img src="/cookTeacher/resources/img/product/p_오렌지주스.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>오렌지주스</div>
                        <div id="prod_price">2,880원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=95">
                            <img src="/cookTeacher/resources/img/product/p_초코우유.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>초코우유</div>
                        <div id="prod_price">2,640원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=91">
                            <img src="/cookTeacher/resources/img/product/p_바나나우유.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>바나나우유</div>
                        <div id="prod_price">4,900원</div>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=149">
                            <img src="/cookTeacher/resources/img/product/prod_pepper.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>후추</div>
                        <div id="prod_price">3,800원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=152">
                            <img src="/cookTeacher/resources/img/product/초코스프레드.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>초코스프레드</div>
                        <div id="prod_price">5,900원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=154">
                            <img src="/cookTeacher/resources/img/product/소금.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>소금</div>
                        <div id="prod_price">3,900원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/product/detail/productDetail?no=150">
                            <img src="/cookTeacher/resources/img/product/밀가루.jpg" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>밀가루</div>
                        <div id="prod_price">5,200원</div>
                    </div>
                </div>
            </div>
        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
        <script>
           $(function(){
             $('#carousel-example-generic').carousel({
               interval: 2200,
               pause: "hover",
               wrap: true,
               keyboard : true
             });
           });
         </script>
</body>
</html>
