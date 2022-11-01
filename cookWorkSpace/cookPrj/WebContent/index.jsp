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
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <div id="slide-area">
<%--                  <%for(int i=0; i<3; i++ ){%>
		                 <div class="slide-items">
		                    <a href="cookTeacher/menu/detail?no=<%=recommList.get(i).getNo()%>">
		                        <img src="/cookTeacher/resources/img/<%=recommList.get(i).getImgPath()%>" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
		                    </a>
		                </div>
                		
                	<%}%> --%>
                
  				<div class="slide-items">
                    <a href="">
                        <img src="/cookTeacher/resources/img/test2.jpg" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
                    </a>
                </div>
                <div class="slide-items">
                    <a href="">
                        <img src="/cookTeacher/resources/img/test3.jpg" alt="조회수높은레시피띄어주기(레시피게시판담당)" width="1050px" height="400px">
                    </a>
                </div> 

            </div>

            <div id="slide-btn-area">
                <button id="slide-btn1"></button>
                <button id="slide-btn2"></button>
                <button id="slide-btn3"></button>
            </div>
    
    
            <script>
                const btn1 = document.querySelector('#slide-btn1');
                btn1.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform= 'translate(0)';
                })
                const btn2 = document.querySelector('#slide-btn2');
                btn2.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform = 'translate(-1050px)';
                })
                
                const btn3 = document.querySelector('#slide-btn3');
                btn3.addEventListener('click',function(){
                    document.querySelector('#slide-area').style.transform = 'translate(-2100px)';
                })
            </script>
    
    
            <div id="main-middle">
                <div>레시피</div>
                <div id="main-menu-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>메뉴이름</div>
                    </div>
                </div>
            </div>
            <br><hr>
            <div id="main-bottom">
                <div>식재료 쇼핑</div><br><hr>
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
                        <a href="/cookTeacher/product/main/noodleBreadList">면류/빵류</a>
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
    

</body>
</html>
