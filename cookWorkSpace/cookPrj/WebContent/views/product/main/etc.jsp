<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
    #main-menu-bar a{
        font-size: 16px;
        text-align: center;
    }
    #main-menu-bar{
        margin-top: 30px;
        margin-bottom: 50px;
    }
    #main-top>div:first-child, #main-middle>div:first-child, #main-bottom>div:first-child {
        padding: 1px;
        margin: 5 auto;
    }
    #price{
        font-size: larger;
        font-weight: 700;
    }
    #category-name{
        font-weight: 800;
        font-size: xx-large;
    }
    #category-name-detail{
    font-weight: 500;
    font-size: large;
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
 
            <div id="main-bottom">
                <!-- <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="">과일/채소</a>
                    </div>
                </div> -->
                <hr><br><br>
                <div id="category-name">
                 기타
                <div id="category-name-detail"><br>조미료 / 양념 / 가루 / 곡식 / 견과/ 즉석제품</div>
                </div><br><br>
                <hr>
                <br><br>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/product/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>바나나 / 500g</div>
                        <div id="price">3,500원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/shine_muscat.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>샤인머스켓 / 2kg</div>
                        <div id="price">38,000원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>청도 반시 / 1.5kg</div>
                        <div id="price">8,400원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/grape.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                       
                        <div>적포도 / 500g</div>
                        <div id="price">10,900원</div>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/tangerine.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>하우스 감귤 / 500g</div>
                        <div id="price">7,300원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/kiwi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>키위 / 350g</div>
                        <div id="price">5,800원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>레몬 / 2kg</div>
                        <div id="price">31,900원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>청도 반시 / 1.5kg</div>
                        <div id="price">8,400원</div>
                    </div>
                </div>  
                <div class="main-prod-area">
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>바나나 / 500g</div>
                        <div id="price">3,500원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/shine_muscat.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>샤인머스켓 / 2kg</div>
                        <div id="price">38,000원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>청도 반시 / 1.5kg</div>
                        <div id="price">8,400원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/grape.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>적포도 / 500g</div>
                        <div id="price">10,900원</div>
                    </div>
                  
                </div> 
                <div class="main-prod-area">
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/tangerine.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>하우스 감귤 / 500g</div>
                        <div id="price">7,300원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/kiwi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>키위 / 350g</div>
                        <div id="price">5,800원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>레몬 / 2kg</div>
                        <div id="price">31,900원</div>
                    </div>
                    <div>
                        <a href="/cookTeacher/views/product/detail/dairy.jsp">
                            <img src="/cookTeacher/resources/img/product/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>청도 반시 / 1.5kg</div>
                        <div id="price">8,400원</div>
                    </div>

                    
                </div> 
                    
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    
    

</body>
</html>