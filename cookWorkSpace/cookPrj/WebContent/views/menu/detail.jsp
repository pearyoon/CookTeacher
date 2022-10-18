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
                    
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px; margin-bottom: 50px;">
                <div id="gap"></div>

            </div>
                    
            <div>
            <div id="grid">
                <div id="en">
                    <!-- 1 -->
                    <div id="re-img">
                        <img id="re-imgimg" src="/cookTeacher/resources/img/초코머핀.jpg" alt="" width="500px" height="500px">
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
                                
                                document.getElementById("imgId").src = "/cookTeacher/resources/img/좋아요(초).jpg";
                                
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
                <div id="middle">
                    <div class="middle" style="font-size: 1.3rem;" >
                        <label id="kcal">280 </label>
                        <img alt="" src="/cookTeacher/resources/img/칼로리.jpg" alt="식재료게시판담당" id="imgid" width="35px" height="30px" onclick="ChnImg()">
                    </div>
                    <div class="middle" style="text-align: center; font-size: 0.8rem; font-weight: 700; line-height: 1rem; padding-left: 20px;">
                        <a href="">
                            디저트의 더 많은 레시피가
                            <br>궁금하다면?
                        </a>
                    </div>
                    <div class="middle" style="font-size: 1.5rem;" style="margin-right: 10px;">
                        <img alt="" src="/cookTeacher/resources/img/좋(초).jpg" style="margin-right: 5px; margin-bottom: 13px;" alt="식재료게시판담당" id="imgid"  width="25px" height="25px" onclick="ChnImg()">
                        <label id="kcal">55</label>
                    </div>
                </div>
    

                    <!-- 3 -->
                    <div id="prod-btn">
                        <div style="border-top: 1px solid black;  margin-top: 0px;"></div>
                        <button id="btn" type="button" class="btn btn-warning">
                            <label id="re-btn" style="font-size: large;">비법 퍼가기</label>
                        </button>
                    </div>

                    <div id="prod-img" style="width: 100%; height: 100%;">
                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>

                        <div class="prd-all">
                            <div class="product">
                                <a href="">
                                    <img src="/cookTeacher/resources/img/banana.png" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                            </div>    
                            <div class="prod-price">
                                <input type="checkbox" width="50px" height="50px">바나나 / 500g
                                <pre>3,500</pre>
                            </div>
                        </div>
                        

                    
                </div>
            </div>

                   
                   
    



            </div>
                
                
                
                <br><br><br><br>
                
            </main>
            <!-- 인클루드 == 메인보다 밖에 있어야 함, 컨테이너 안에 있어야 함!-->
            <%@include file="/views/common/footer.jsp" %>
    </div>

    

</body>
</html>