<%@page import="com.kh.cook.menu.vo.MenuAttachmentVo"%>
<%@page import="com.kh.cook.menu.vo.MenuWriteVo"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MenuWriteVo> writeList = (List<MenuWriteVo>)request.getAttribute("writeList");
	MenuAttachmentVo attVo =  (MenuAttachmentVo)request.getAttribute("attachmentVo");
	if(attVo == null){
		attVo = new MenuAttachmentVo();
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/newIn.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
    <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
    
            <div id="recipe-newIn">
                <div id="resipe" >|&nbsp;&nbsp; NEW RECIPE !  &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                <div id="ment"><label for="">새로운 레시피는 여기서! 도저히 그 페이지에 안나옵니다~~</label></div>
                    
			       <div id="gap"></div>
                    <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                
                 <div class="recipe-newIn-area">
                    
                      <%
                    	for(int i = 0; i<3; i++){%>
		                    <div>
		                        <a href="/cookTeacher/menu/newDetail?Nno=<%=writeList.get(i).getNo()%>"> 
		                        <div id="img-box"><img width="100px" height="100px" alt="사진" src="<%= root %>/<%=attVo.getFilePath() %>/<%=attVo.getChangeName()%>"></div>   
			                        <div id="ment-detail">
			                            <%=writeList.get(i).getMenuInfo()%>
					                    <div><%=writeList.get(i).getCal() %></div>
			                        </div>
			                        <div class="newIn-name"><%=writeList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %> 
					</div>
					
					<!-- ---------------------------------- -->
					
<%-- 					<div class="recipe-newIn-area">
                    
                    <%
                    	for(int i = 3; i<6; i++){%>
		                    <div>
		                        <a href="/cookTeacher/menu/detail?no=<%=voList.get(i).getNo() %>">
		                            <img src="/cookTeacher/resources/img/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="newIn-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
                    	
					</div>
					
					<!-- -------------------------------------- -->
					
										
					<div class="recipe-newIn-area">
                    
                    <%
                    	for(int i = 6; i<9; i++){%>
		                    <div>
		                        <a href="/cookTeacher/menu/detail?no=<%=voList.get(i).getNo() %>">
		                            <img src="/cookTeacher/resources/img/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="newIn-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %>
                    	
					</div>
					
					<!-- ------------------------------------- -->
					
					<div class="recipe-newIn-area">
                    
                    <%
                    	for(int i = 9; i<10; i++){%>
		                    <div>
		                        <a href="/cookTeacher/menu/detail?no=<%=voList.get(i).getNo() %>">
		                            <img src="/cookTeacher/resources/img/<%=voList.get(i).getImgPath() %>"  alt="레시피게시판담당" width="100%" height="100%">
			                        <div id="ment-detail">
			                            <%=voList.get(i).getMenuInfo() %>
			                        </div>
			                        <div class="newIn-name"><%=voList.get(i).getMenuName() %></div>
		                        </a>
		                    </div>
                    		
                    	<%} %> --%>
                    	
					</div>
                    
            </div>
            
			<br><br><br><br>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>