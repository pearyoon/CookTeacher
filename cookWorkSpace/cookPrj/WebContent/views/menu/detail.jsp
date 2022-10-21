<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<%
	MenuVo vo = (MenuVo)request.getAttribute("vo");
%>


<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/detail.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">


</head>
<body>

    <%@include file="/views/common/header.jsp" %>

    <div id="container">

        <main>
    
            <div id="recipe-detail">
                <div id="resipe" >|&nbsp;&nbsp; <%=vo.getMenuName() %> &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px;">
                <div id="ment"><label> <%=vo.getMenuInfo() %></label></div>
                    
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px; margin-bottom: 50px;">
                <div id="gap"></div>

            </div>
                    
            <div>
            <div id="grid">
                <div id="en">
                    <!-- 1 -->
                    <div id="re-img">
                        <img id="re-imgimg" src="/cookTeacher/resources/img/디저트레시피/<%=vo.getImgPath()%>" alt="" width="500px" height="500px">
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
                                
                                document.getElementById("imgId").src = "/cookTeacher/resources/img/icons/좋아요(초).jpg";
                                
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
<%=vo.getRecipe()%>
</pre>
    </div>    
                <div id="middle">
                    <div class="middle" style="font-size: 1.3rem;" >
                        <label id="kcal"><%=vo.getCal() %></label>
                        <img alt="" src="/cookTeacher/resources/img/icons/칼로리.jpg" alt="식재료게시판담당" id="imgid" width="35px" height="30px" onclick="ChnImg()">
                    </div>
                    <div class="middle" style="text-align: center; font-size: 0.8rem; font-weight: 700; line-height: 1rem; padding-left: 20px;">
                    <!-- 수정할 것!! => 메인이랑 레시피 연결 후 -->
                        <a href="/cookTeacher/views/menu/recipe_cate.jsp">
                            더 많은 레시피가
                            <br>궁금하다면?
                        </a>
                    </div>
                    <div class="middle" style="font-size: 1.5rem;" style="margin-right: 10px;">
                        <img alt="" src="/cookTeacher/resources/img/icons/좋(초).jpg" style="margin-right: 5px; margin-bottom: 13px;" alt="식재료게시판담당" id="imgid"  width="25px" height="25px" onclick="ChnImg()">
                        <label id="kcal"><%=vo.getRecommend()%></label>
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