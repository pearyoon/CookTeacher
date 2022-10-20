<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/recipe_cate.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
        <%@include file="/views/common/header.jsp" %>
       <div id="container">
        	<main>
    
            <div id="recipe-middle">
                <div id="resipe" >레시피</div>
                <hr width="60%" style="margin-bottom: 10px; margin-top: 0px;">
                    <div id="category">
                        <a href="/cookTeacher/views/menu/korean.jsp"> 한식  </a>
                        <label for="">  |  </label>
                        <a href="/cookTeacher/views/menu/banchan.jsp"> 반찬 </a>
                        <label for="">  |  </label>
                        <a href="/cookTeacher/views/menu/japanese.jsp"> 일식 </a>
                        <label for="">  |  </label>
                        <a href="/cookTeacher/views/menu/chinese.jsp"> 중식 </a>
                        <label for="">  |  </label>
                        <a href="/cookTeacher/views/menu/westren.jsp"> 양식 </a>
                        <label for="">  |  </label>
                        <a href="/cookTeacher/menu/dessert"> 디저트 </a>
                    </div>
                
                    <div class="cate-name"><a href="/cookTeacher/views/menu/korean.jsp">< 한식 ></a></div>
                    <div class="recipe-menu-area">
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>김치찌개</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div>김치볶음밥</div>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                        </a>
                        <div>갈치조림</div>
                    </div>
                    
                </div>

                <!-- ------- -->
                <div class="cate-name"><a href="/cookTeacher/views/menu/banchan.jsp">< 반찬 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>김치찌개</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>김치볶음밥</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div>갈치조림</div>
                </div>
                </div>

                <!-- ------- -->
                <div class="cate-name"><a href="/cookTeacher/views/menu/westren.jsp">< 양식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>김치찌개</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>김치볶음밥</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div>갈치조림</div>
                </div>
                </div>
                <!-- ------- -->
                <div class="cate-name"><a href="/cookTeacher/views/menu/chinese.jsp">< 중식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>돼지고기청경채볶음</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>마라샹궈</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/동파육.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div>동파육</div>
                </div>
                </div>

                <div class="cate-name"><a href="/cookTeacher/views/menu/japanese.jsp">< 일식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/일식 레시피 이미지/가츠동.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>가츠동</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/일식 레시피 이미지/계란 초밥.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>계란 초밥</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/일식 레시피 이미지/스키야끼.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div>스키야끼</div>
                </div>
                </div>

                <div class="cate-name"><a href="/cookTeacher/menu/dessert">< 디저트 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/초코머핀.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>초코머핀</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/식빵푸딩.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div>식빵푸딩</div>
                </div>
                <div>
                    <a href="">
                        <img src="/cookTeacher/resources/img/티라미수.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div>티라미수</div>
                </div>
                </div>

            </div>


        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>