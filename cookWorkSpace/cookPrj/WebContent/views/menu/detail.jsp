<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>



<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/detail.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">


</head>
<body>
    <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
    
            <div id="recipe-detail">
                <div id="resipe" >|&nbsp;&nbsp; 밤맛탕 &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px;">
                <div id="ment"><label> 입이 심심할 때 간단하게 만들어 먹을 수 있는, 자꾸 손이 가는 밤맛탕 레시피! </label></div>
                    
                    <div id="gap"></div>
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px;">

            </div>
                    
            </div>
            <div id="w">
                <div id="en">

                    <!-- <div id="recipe">
                        <button id="btn" type="button" class="btn btn-warning">
                        <label id="re-btn" style="font-size: large;">요리법</label>
                        </button>
                    </div> -->
                    <div id="re-img">
                        <img src="/cookTeacher/resources/img/초코머핀.jpg" alt="" width="450px" height="500px">
                    </div>
                    
                    <div>
                        <div style="font-size: 2rem; margin-bottom: 10px; text-align: center;">
                            <button id="btn" type="button" class="btn btn-warning">
                                <label id="re-btn" style="font-size: large;">쿡선생의 비법</label>
                            </button>
                        </div>
<pre style="white-space: pre-wrap; padding: 5px;">
1) 비닐 봉지에 깐밤을 넣고 녹말가루를 1큰술 반을 넣고 입구를 손으로 쥐고 흔들어줍니다.  
2) 녹말가루를 묻힌 밤을 넣고 튀겨줍니다. 노릇하게 튀겨지도록 1-2분 튀겨줍니다.    
3) 다시 기름 온도를 높여 준 다음 2차로 밤을 튀겨줍니다. 기름은 녹말가루가 들어가서 색상이 좀 뿌얘졌구요.    
4) 소스를 만들어 주는데 물이 하나도 들어가지 않고 기름을 사용하여 만드는 방법입니다.
카놀라유( 식용유도 괜찮아요. ) 2큰술, 황설탕 2큰술, 물엿 1큰술 반을 넣고 젓지 말고 그대로 녹여줍니다. 젓지 않는 것이 포인트예요.    
5) 소스가 다 녹으면 튀긴 밤을 넣어줍니다. 소스가 잘 묻도록 팬을 흔들어주는 것이 좋답니다.    
6) 마지막에 검은 깨를 넣어줍니다.    
7) 종이 호일을 접어서 모양을 내줍니다. 밤맛탕이 완성되었습니다.
</pre>
                    </div>    
                       



                    <div id="prod-btn">
                        <button id="btn" type="button" class="btn btn-warning">
                            <label id="re-btn" style="font-size: large;">비법 퍼가기</label>
                        </button>
                    </div>

                    <div id="prod-img" style="width: 100%; height: 100%;">

                        <div class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                            </div>
                            <div id="price">3,500원</div>
                        </div>    
                        
                        <div  class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/tangerine.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox">하우스 감귤 / 500g
                            </div>
                            <div id="price">7,300원</div>
                        </div>

                        <div class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox">레몬 / 2kg
                            </div>
                            <div id="price">31,900원</div>
                        </div>

                        <div class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                            </div>
                            <div id="price">3,500원</div>
                        </div>    
                    </div>

                        <!-- -----------  -->

                    <div>

                        <div class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox">레몬 / 2kg
                            </div>
                                <div id="price">31,900원</div>
                        </div>

                        
                        
                        
                        <div class="product">
                            <a href="">
                                <img src="/cookTeacher/resources/img/lemon.png" alt="식재료게시판담당" width="100%" height="100%">
                            </a>
                            <div>
                                <input type="checkbox">레몬 / 2kg
                            </div>
                            <div id="price">31,900원</div>
                        </div>
                    </div> 
                    
                </div>

                   
                   
    



                </div>
            </div>
            

            
			<br><br><br><br>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>

    

</body>
</html>