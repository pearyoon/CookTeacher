<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MenuVo> voList = (List<MenuVo>)request.getAttribute("voList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/dessert.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
    <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
    
            <div id="recipe-dessert">
                <div id="resipe" >|&nbsp;&nbsp; 디저트 &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                <div id="ment"><label for="">쿡선생과 함께라면 여기가 디저트 최고 맛집 ! </label></div>
                    
                    <div id="gap"></div>
                    <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                
                    <div class="recipe-dessert-area">
                    
                    <%
                    	for(int i = 0; i<4; ++i ){%>
		                    <div>
		                        <a href="">
		                            <img src="/cookTeacher/resources/img/" + <%=voList.get(i).getImgPath() %> alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="dessert-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>


                <!-- ------------------------------ -->
                <div class="recipe-dessert-area">
                    <div>
                    
                        <a href="">
                            <img src="/cookTeacher/resources/img/돼지고기청경채볶음.jpg" alt="레시피게시판담당" width="100%" height="100%">
	                        <div id="ment-detail">
                                김치찌개의 영원한 라이벌 구수한 된장찌개	                        
                            </div>
	                        <div class="dessert-name">된장찌개</div>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
	                        <div id="ment-detail">
	                            매콤하고 부드러운 입에서 살살 녹는 
                                <br>매콤 돼지 갈비찜
	                        </div>
	                        <div class="dessert-name">매콤 돼지 갈비찜</div>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/마라샹궈.jpg" alt="레시피게시판담당"  width="100%" height="100%">
	                        <div id="ment-detail">
	                            남녀노소 누구나 좋아하는 생선 요리
	                        </div>
	                        <div class="dessert-name">갈치조림</div>
                        </a>
                    </div>
                   
                </div>
                
                <!-- ------------------------------ -->
                <div class="recipe-dessert-area">
                    <div>
                    
                        <a href="">
                            <img src="/cookTeacher/resources/img/크림새우.jpg" alt="레시피게시판담당" width="100%" height="100%">
	                        <div id="ment-detail">
                                김치찌개의 영원한 라이벌 구수한 된장찌개	                        
                            </div>
	                        <div class="dessert-name">된장찌개</div>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/mapotofu.jpg" alt="레시피게시판담당" width="100%" height="100%">
	                        <div id="ment-detail">
	                            매콤하고 부드러운 입에서 살살 녹는 
                                <br>매콤 돼지 갈비찜
	                        </div>
	                        <div class="dessert-name">매콤 돼지 갈비찜</div>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img src="/cookTeacher/resources/img/friedrice.jpg" alt="레시피게시판담당"  width="100%" height="100%">
	                        <div id="ment-detail">
	                            남녀노소 누구나 좋아하는 생선 요리
	                        </div>
	                        <div class="dessert-name">갈치조림</div>
                        </a>
                    </div>
                    
                   
                </div>
                    
            </div>
            
			<br><br><br><br>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>