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
                    	for(int i = 0; i<3; i++){%>
		                    <div>
		                        <a href="">
		                            <img src="/cookTeacher/resources/img/디저트레시피/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="dessert-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
					</div>
					
					<!-- ---------------------------------- -->
					
					<div class="recipe-dessert-area">
                    
                    <%
                    	for(int i = 3; i<6; i++){%>
		                    <div>
		                        <a href="">
		                            <img src="/cookTeacher/resources/img/디저트레시피/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="dessert-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
                    	
					</div>
					
					<!-- -------------------------------------- -->
					
										
					<div class="recipe-dessert-area">
                    
                    <%
                    	for(int i = 6; i<9; i++){%>
		                    <div>
		                        <a href="">
		                            <img src="/cookTeacher/resources/img/디저트레시피/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="dessert-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
                    	
					</div>
					
					<!-- ------------------------------------- -->
					
					<div class="recipe-dessert-area">
                    
                    <%
                    	for(int i = 9; i<10; i++){%>
		                    <div>
		                        <a href="">
		                            <img src="/cookTeacher/resources/img/디저트레시피/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="dessert-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
                    	
					</div>
                    
            </div>
            
			<br><br><br><br>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>