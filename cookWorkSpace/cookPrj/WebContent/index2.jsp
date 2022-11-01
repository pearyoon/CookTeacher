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

<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <div id="slide-area">
                <div class="slide-items">
                    <div style="width: 1050px; height: 400px; ">
                        <!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
                        <!-- carousel는 특이하게 id를 설정해야 한다.-->
                        <div id="carousel-example-generic" class="carousel slide" >
                          <!-- carousel의 지시자 -->
                          <!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
                          <ol class="carousel-indicators">
                            <!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
                            <!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
                            <!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                          </ol>
                          <!-- 실제 이미지 아이템 -->
                          <!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
                          <div class="carousel-inner" role="listbox">
                            <!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
                            <div class="item active">
                              <!-- 아미지 설정- -->
                              <img src="/cookTeacher/resources/img/test2.jpg" style="width:1050px ; height:400px; ">
                              <!-- 캡션 설정 (생략 가능) -->
                              <!-- 글자 색은 검은색 -->
                            </div>
                            <div class="item">
                              <img src="/cookTeacher/resources/img/test3.jpg" style="width:1050px ; height:400px; ">
                            </div>
                          </div>
                          <!-- 왼쪽 화살표 버튼 -->
                          <!-- href는 carousel의 id를 가르킨다. -->
                          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <!-- 왼쪽 화살표 -->
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          </a>
                          <!-- 오른쪽 화살표 버튼 -->
                          <!-- href는 carousel의 id를 가르킨다. -->
                          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <!-- 오른쪽 화살표 -->
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          </a>
                        </div>
                      </div>


                </div>

                  <script>
                    $(function(){
                      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
                      $('#carousel-example-generic').carousel({
                        // 슬리아딩 자동 순환 지연 시간
                        // false면 자동 순환하지 않는다.
                        interval: 2300,
                        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
                        pause: "hover",
                        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
                        wrap: true,
                        // 키보드 이벤트 설정 여부(?)
                        keyboard : true
                      });
                    });
                  </script>
                
  				

            </div>

           
    
    
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
