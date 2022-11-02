<%@page import="com.kh.cook.menu.vo.MenuAttachmentVo"%>
<%@page import="com.kh.cook.menu.vo.MenuWriteVo"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<title>집밥쿡선생 :: New In!</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/newIn.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
    <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
			<!-- ------------------------- -->
			
			<!-- ------------------------- -->
    
            <div id="recipe-newIn">
                <div id="resipe" >|&nbsp;&nbsp; NEW RECIPE !  &nbsp;&nbsp;|</div>
                <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                <div id="ment"><label for="">쿡선생과 함께 새로운 레시피로 함께해요!</label></div>
                    
			       <div id="gap"></div>
                    <hr width="60%" style="margin-bottom: 10px; margin-top: 10px;">
                
                 <div class="recipe-newIn-area">

					
				<%for(int i=0; i < writeList.size(); ++i ){ %>
				<div id="new-recipe">
						<div class="new-div">
						<!-- 수정 -->
							<a href="/cookTeacher/menu/newDetail?no=<%=writeList.get(i).getNo()%>">
							<div><img class="new-img" src="/cookTeacher/<%=writeList.get(i).getFilePath()%>/<%=writeList.get(i).getChangeName() %>"  alt="qksksk"></div>
							<div id="menu_info"><%=writeList.get(i).getMenuInfo()%></div>
							<div id="menu_name"><%=writeList.get(i).getMenuName() %></div>
							</a>
						</div>
				</div>
				<%} %>
                    
            </div>
            
			<br><br><br><br>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    

</body>
</html>