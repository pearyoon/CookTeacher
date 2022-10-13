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
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="">과일/채소</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">해산물</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">육류/계란</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">면류/빵류</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">유제품</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">음료</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="">기타</a>
                    </div>
                </div>
                <hr>
                <br><br>
                <div class="main-prod-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/olive_oil.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>올리브 오일 / 500g</div>
                        <div id="price">8,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/ggongchi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>꽁치 / 450g</div>
                        <div id="price">3,830원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/beef.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>등심 / 400g</div>
                        <div id="price">23,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/baguette_cheese.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                       
                        <div>바게트 치즈 / 200g</div>
                        <div id="price">13,000원</div>
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
                            <img src="/cookTeacher/resources/img/olive_oil.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>올리브 오일 / 500g</div>
                        <div id="price">8,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/ggongchi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>꽁치 / 450g</div>
                        <div id="price">3,830원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/beef.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>등심 / 400g</div>
                        <div id="price">23,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/baguette_cheese.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                       
                        <div>바게트 치즈 / 200g</div>
                        <div id="price">13,000원</div>
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
                            <img src="/cookTeacher/resources/img/olive_oil.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>올리브 오일 / 500g</div>
                        <div id="price">8,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/ggongchi.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>꽁치 / 450g</div>
                        <div id="price">3,830원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/beef.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                        <div>등심 / 400g</div>
                        <div id="price">23,900원</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/baguette_cheese.png" alt="식재료게시판담당" width="100%" height="100%">
                        </a>
                       
                        <div>바게트 치즈 / 200g</div>
                        <div id="price">13,000원</div>
                    </div>
                </div>
                 
            </div>
		<%@include file="/views/common/footer.jsp" %>

        </main>
    </div>
    

</body>
</html>