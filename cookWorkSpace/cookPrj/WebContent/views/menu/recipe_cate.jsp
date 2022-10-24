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
                        <a href="<%=root %>/views/menu/korean.jsp"> 한식  </a>
                        <label for="">  |  </label>
                        <a href="<%=root %>/views/menu/banchan.jsp"> 반찬 </a>
                        <label for="">  |  </label>
                        <a href="<%=root %>/views/menu/japanese.jsp"> 일식 </a>
                        <label for="">  |  </label>
                        <a href="<%=root %>/views/menu/chinese.jsp"> 중식 </a>
                        <label for="">  |  </label>
                        <a href="<%=root %>/views/menu/westren.jsp"> 양식 </a>
                        <label for="">  |  </label>
                        <a href="<%=root %>/menu/dessert"> 디저트 </a>
                    </div>
                <hr width="60%" style="margin-top: 10px; margin-bottom: 50px">
                
                    <div class="cate-name"><a href="<%=root %>/views/menu/korean.jsp">- 한식 -</a></div>
                    <div class="recipe-menu-area">
                    <div>
                        <a href="<%=root %>/menu/detail?no=1">
                            <img src="<%=root %>/resources/img/한식레시피/kimchi_stew.png" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div class="re-title">김치찌개</div>
                        <div class="re-ment">한국인의 영원한 밥 친구 김치찌개</div>
                        
                    </div>
                    <div>
                        <a href="<%=root %>/menu/detail?no=5">
                            <img src="<%=root %>/resources/img/한식레시피/stewed_tofu.png" alt="레시피게시판담당" width="100%" height="100%">
                        </a>
                        <div class="re-title">두부조림</div>
                        <div class="re-ment">흰 쌀밥이 생각나는 맛도 좋고 영양가도 좋은 최고의 반찬</div>
                    </div>
                    <div>
                        <a href="<%=root %>/menu/detail?no=9">
                            <img src="<%=root %>/resources/img/한식레시피/galbitang.png" alt="레시피게시판담당"  width="100%" height="100%">
                        </a>
                        <div class="re-title">갈비탕</div>
                        <div class="re-ment">따뜻한 국물이 생각날 땐 담백한 갈비탕</div>
                    </div>
                    
                </div>

                <!-- ------- -->
                <div class="cate-name"><a href="<%=root %>/views/menu/banchan.jsp">< 반찬 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="<%=root %>/menu/detail?no=11">
                        <img src="<%=root %>/resources/img/반찬 레시피/sausageyachaebokkeum.PNG" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">소세지 야채볶음</div>
                    <div class="re-ment">어른아이 할것없이 다 좋아하는 만능 반찬</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=20">
                        <img src="<%=root %>/resources/img/반찬 레시피/mechurialjolim.PNG" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">메추리알스팸조림</div>
                    <div class="re-ment">아이반찬 걱정 뚝! 10분반찬 메추리알조림</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=15">
                        <img src="<%=root %>/resources/img/반찬 레시피/kongnamulmuchim.PNG" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div class="re-title">콩나물무침</div>
                    <div class="re-ment">콩나물무침으로 밥 한끼 뚝딱</div>
                </div>
                </div>

                <!-- ------- -->
                <div class="cate-name"><a href="<%=root %>/views/menu/westren.jsp">< 일식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="<%=root %>/menu/detail?no=21">
                        <img src="<%=root %>/resources/img/일식 레시피 이미지/일식계란말이.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">일식 계란말이</div>
                    <div class="re-ment">달달하고 부드러운 계란말이! 밥 반찬으로 뚝딱!</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=27">
                        <img src="<%=root %>/resources/img/일식 레시피 이미지/가츠동.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">가츠동</div>
                    <div class="re-ment">유난히 힘이 나지 않는 날이 있죠~ <br>그럴 때 돈가스 올린 푸짐한 덮밥 한 그릇</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=29">
                        <img src="<%=root %>/resources/img/일식 레시피 이미지/밀푀유나베.jpg"  alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div class="re-title">밀푀유나베</div>
                    <div class="re-ment">따끈한 국물이 생각나는 요즘 <br>만들기도 간단하고 맛과 담음새까지 좋은 밀푀유나베</div>
                </div>
                </div>
                <!-- ------- -->
                <div class="cate-name"><a href="<%=root %>/views/menu/chinese.jsp">< 중식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="<%=root %>/menu/detail?no=31">
                        <img src="<%=root %>/resources/img/jjambbong.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">짬뽕</div>
                    <div class="re-ment">깔끔하고 얼큰하고 시원한 국물 맛이 일품인 짬뽕</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=32">
                        <img src="<%=root %>/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">마파두부</div>
                    <div class="re-ment">마파두부==중국의 마파할머니가 만든 사천 지방 대표요리</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=33">
                        <img src="<%=root %>/resources/img/크림새우.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div class="re-title">크림새우</div>
                    <div class="re-ment">온 가족이 즐길 수 있는 부드러우면서 바삭한 크림새우!</div>
                </div>
                </div>

                <div class="cate-name"><a href="<%=root %>/views/menu/japanese.jsp">< 양식 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="<%=root %>/menu/detail?no=41">
                        <img src="<%=root %>/resources/img/양식레시피/토마토스파게티.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">토마토 스파게티 </div>
                    <div class="re-ment">클래식은 영원하다 오리지널 토마토 스파게티 </div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=44">
                        <img src="<%=root %>/resources/img/양식레시피/양송이스프.jpg " alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">양송이스프</div>
                    <div class="re-ment">반찬으로도, 간단한 아침식사로도, 에피타이저로도 좋은 양송이 스프 </div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=47">
                        <img src="<%=root %>/resources/img/양식레시피/감바스.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div class="re-title">감바스 </div>
                    <div class="re-ment">마늘과 새우로 완성되는 요리</div>
                </div>
                </div>

                <div class="cate-name"><a href="<%=root %>/menu/dessert">< 디저트 ></a></div>
                <div class="recipe-menu-area">
                <div>
                    <a href="<%=root %>/menu/detail?no=51">
                        <img src="<%=root %>/resources/img/디저트레시피/바나나크레페.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">바나나크레페</div>
                    <div class="re-ment">바나나를 넣어 든든하며 주말 브런치로 맛있게 즐길 수 있는 바나나크레페!</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=59">
                        <img src="<%=root %>/resources/img/디저트레시피/초코머핀.jpg" alt="레시피게시판담당"  width="100%" height="100%">
                    </a>
                    <div class="re-title">초코머핀</div>
                    <div class="re-ment">초코칩을 넣어 씹는 재미를 더해 달콤 촉촉한 초코머핀.</div>
                </div>
                <div>
                    <a href="<%=root %>/menu/detail?no=56">
                        <img src="<%=root %>/resources/img/디저트레시피/티라미수.jpg" alt="레시피게시판담당" width="100%" height="100%">
                    </a>
                    <div class="re-title">티라미수</div>
                    <div class="re-ment">초코칩을 넣어 씹는 재미를 더해 달콤 촉촉한 초코머핀.</div>
                </div>
                </div>

            </div>


        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>