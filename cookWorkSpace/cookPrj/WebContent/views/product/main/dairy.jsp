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
                <div id="category-name">유제품</div><br><br>
                <hr>
                <br><br>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/milk.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>우유 / 1.8L</div>
                        <div id="price">4,740원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/milk2.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>유기농 우유 / 1L</div>
                        <div id="price">4,480원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/yogurt.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>그릭요거트 플레인 맛 / 320g</div>
                        <div id="price">3,980원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/greekday.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                       
                        <div>그릭요거트 시그니처 / 450g</div>
                        <div id="price">13,000원</div>
                    </div>
                </div>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/cheese.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>슈레드 치즈 / 210g</div>
                        <div id="price">6,820원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/cheese2.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>어린이 치즈 / 180g</div>
                        <div id="price">4,600원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/butter.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>무염 버터 / 200g</div>
                        <div id="price">12,580원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/butter2.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>메이플 버터 / 150g</div>
                        <div id="price">8,000원</div>
                    </div>
                </div>  
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>바나나 / 500g</div>
                        <div id="price">3,500원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/shine_muscat.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>샤인머스켓 / 2kg</div>
                        <div id="price">38,000원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>청도 반시 / 1.5kg</div>
                        <div id="price">8,400원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/grape.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>적포도 / 500g</div>
                        <div id="price">10,900원</div>
                    </div>
                  
                </div> 
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/tangerine.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>하우스 감귤 / 500g</div>
                        <div id="price">7,300원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/kiwi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>키위 / 350g</div>
                        <div id="price">5,800원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>레몬 / 2kg</div>
                        <div id="price">31,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/bansi.png" alt="식재료게시판담당" width="100%" height="100%">
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