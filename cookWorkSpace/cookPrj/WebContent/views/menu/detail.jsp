<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.controller.ProductListController"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>cookTeacher</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" defer src="/cookTeacher/resources/js/menu/detail.js"></script>

<%
	MenuVo vo = (MenuVo)request.getAttribute("vo");
	List<ProductVo> prodList = (List<ProductVo>)request.getAttribute("prodList");
%>


<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/detail.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src=""></script>

</head>
<body>

    <%@include file="/views/common/header.jsp" %>

    <div id="container">

        <main>
    
            <div id="recipe-detail">
                <div id="resipe" >|&nbsp;&nbsp; <%=vo.getMenuName() %> &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 20px; margin-top: 20px;">
                <div id="ment"><label> <%=vo.getMenuInfo() %></label></div>
                    
                <hr width="60%" style=" margin-top: 20px; margin-bottom: 70px;">
                <div id="gap"></div>

            </div>
                    
            <div>
            <div id="grid">
                <div id="en">
                    <!-- 1 -->
                    <div id="re-img">
                    
                    <!-- 레시피 카테고리별로 이미지 폴더 어떻게 구분할지 -->

                    
                        <img id="re-imgimg" src="/cookTeacher/resources/img/<%=vo.getImgPath()%>" alt="" width="500px" height="500px">
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
                        <img alt="" src="/cookTeacher/resources/img/icons/칼로리.jpg" alt="식재료게시판담당" id="imgid" width="35px" height="30px" onclick="likeUp();">
                    </div>
                    <div class="middle" style="text-align: center; font-size: 0.8rem; font-weight: 700; line-height: 1.2rem; padding-left: 20px;">
                    <!-- 수정할 것!! => 메인이랑 레시피 연결 후 -->
                        <a href="/cookTeacher/views/menu/recipe_cate.jsp">
                            더 많은 레시피가
                            <br>궁금하다면?
                        </a>
                    </div>
                    <div class="middle" style="font-size: 1.5rem;" style="margin-right: 10px;" onclick="plusRecomm(); likeUp();">
                        <img alt="" src="/cookTeacher/resources/img/icons/좋(초).jpg"  alt="식재료게시판담당" id="imgid"  width="25px" height="25px">
                        <label id="recomm" for="imgid"><%=vo.getRecommend()%></label>
                    </div>
                </div>
    
    				<script>
    					function plusRecomm() {
                            // console.log('${no}')
                            let cnt = '${vo.recommend}';
                            let no = '${no}';
							$.ajax({
                                url : "/cookTeacher/menu/plusRecomm",
                                type : "post",
                                data : {"no" : no } ,
                                success : function(result){
                                    if(result != ""){
										$('#recomm').text(result);
                                    }
                                },
                                error : function(){
                                    
                                }
                            })
						}
    					
    					
    					function likeUp(){
    						Swal.fire({
    							  position: 'top-end',
    							  icon: 'success',
    							  title: '추천 좋아요!',
    							  showConfirmButton: false,
    							  timer: 1500
    							})
    					}
    					
    				</script>

                    <!-- 3 -->
                   	<div id="menu-prod">

                        <div style="margin-bottom: 18px; border-top: 5px double black; padding-top: 30px; font-size: large; font-weight: 900">* 쿡선생표 비법 재료 !</div>
                        <div id="prod-name" ><%=vo.getMenuProd() %></div>
                    </div>
                    
                    <div id="prod-btn" >
                        <div style="border-top: 1px solid black; "></div>
	               <div>    
                   <form action="/cookTeacher/menu/detail" method="post">
                   <input id="btn" type="submit" class="btn btn-warning" style="font-size: 1.2rem; font-weight: 700;" value="비법퍼가기" onclick="cartInput()">
                        <!-- <label class="re-btn" style="font-size: large;">비법 퍼가기</label> -->
                        <label class="re-btn-click">퍼가요~♡</label>
                   </div> 
                   
                   <script type="text/javascript">
					function cardInput(){
						Swal.fire({
							  position: 'top-end',
							  icon: 'success',
							  title: '장바구니 담기 성공~',
							  showConfirmButton: false,
							  timer: 1500
							})
					}
                   </script>

                        
                        <div id="prod-ment" >* 장바구니에 담을 재료를 선택해주세요. 
                        <br> <br>
                        <input type='checkbox' name='product' value='selectall' onclick='selectAll(this)' style="justify-content: ;">모두 선택
                        </div>
                    </div>
                    
         

                    <div id="prod-img" style="width: 100%; height: 650px;">
                    
                    

                    
                        <c:forEach items="${prodList}" var="prod">
                        <div class="prd-all">
                            <div class="product">
                                <a href="/cookTeacher/product/detail/productDetail?no=${prod.prodNo}">
                                    <img src =" <c:url value = "/resources/img/product/"></c:url>${prod.imgPath}" alt="식재료게시판담당" width="100%" height="100%">
                                </a>
                             
                            </div>    
                            <div style="margin-top : 10px" class="prod-price">
                                <input type="checkbox" name="prodNo" value="${prod.prodNo}" > ${prod.name} / ${prod.weight}
                                <pre ><fmt:formatNumber value="${prod.price}" pattern="#,###"/>원</pre>
                                <!-- 데이터 넘길 때 produckCnt로 넘기면 될듯? -->
                               	수량 : <input type="number" name="prodCnt" value="1" style="width: 20px; margin-bottom: 10px">
                            	<!--  -->
                            
                            </div>

                            	
                        </div>
                    </c:forEach>		
                            </form>

				<!--  -->
				
<!-- 				<tr style="text-align:center;">
				    <td>
				        <button type ="button" onclick="fnCalCount('p',this);">+</button>
				        <input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
				        <button type="button" onclick="fnCalCount('m', this);">-</button>
				    </td>
				</tr>
				
				<script type="text/javascript">
					function fnCalCount(type, ths){
					    var $input = $(ths).parents("td").find("input[name='pop_out']");
					    var tCount = Number($input.val());
					    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
					    
					    if(type=='p'){
					        if(tCount < tEqCount) $input.val(Number(tCount)+1);
					        
					    }else{
					        if(tCount >0) $input.val(Number(tCount)-1);    
					        }
					}
				</script> -->
				



                </div>
            </div>


            </div>
                
                
                
                
                
            </main>
            <!-- 인클루드 == 메인보다 밖에 있어야 함, 컨테이너 안에 있어야 함!-->
            <%@include file="/views/common/footer.jsp" %>
    </div>

    

</body>
</html>