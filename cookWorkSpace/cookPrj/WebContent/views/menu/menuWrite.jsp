<%@page import="com.kh.cook.menu.vo.MenuCateVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.controller.ProductListController"%>
<%@page import="com.kh.cook.menu.vo.MenuVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<MenuCateVo> MenuCateList = (List<MenuCateVo>)request.getAttribute("MenuCateList");
    String menuNum = (String)request.getAttribute("result");
    ProductVo changeInput = (ProductVo)request.getAttribute("changeInput");
%>
    
<!DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>cookTeacher</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" defer src="/cookTeacher/resources/js/menu/detail.js"></script>



<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/menu/menuWrite.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src=""></script>

</head>
<body>

    <%@include file="/views/common/header.jsp" %>

    <div id="container">

        <main>
    		
        <div class="outer">
        <br>
        <h2 align="center">레시피 등록</h2>
        <br>

		<!-- 파일 자체를 보내려면:  enctype="multipart/form-data" 사용 -->
        <form id="enroll-form" action="" method="post" enctype="multipart/form-data">

            <!-- 카테고리, 제목, 내용, 첨부파일 한개 -->
            <table id="write-wrap">
                <tr>
                    <th width="100px">카테고리</th>
                    <td width="500px">
                        <select name="menuCate">
                            <!-- CTEGORY 테이블로부터 조회해오기 -->
                            <%for(int i=0; i<MenuCateList.size(); ++i){%>
		                            <option value="<%= MenuCateList.get(i).getMenuCateNo() %>"><%= MenuCateList.get(i).getMenuType() %></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><div>레시피 번호</div></th>
                    <td><!-- <button onclick="menuNum()">레시피 번호 확인</button> -->
                        <label for="" id="re-num"><input type="text" name="menuNum" value="<%=menuNum %>"></label>
                    </td>


                </tr>
                <tr>
                    <div style="width: 50px;">
                        <th>이름</th>
                        <td ><input type="text" name="re-name" ></td>
                    </div>
                </tr>
                <tr>
                    <th><div>레시피 소개</div></th>
                    <td><input type="text" name="re-info" ></td>
                </tr>
                <tr>
                    <th><div>칼로리</div></th>
                    <td><input type="text" name="cal" ></td>
                </tr>
                <tr>
                    <!-- <th><div id="content">내용</div></th> -->
                    <th>내용</th>
                    <td><textarea name="content" rows="10" style="resize:none;" ></textarea></td>
                </tr>
                 <tr>
                    <th>레시피사진</th>
                    <td ><input type="file" name="f"></td>
                </tr>
                <tr>
                    <th>식재료 등록</th>
                    <td >
                        <%-- <form action="<%=root%>/menu/prodInput" method="get"> --%>
                        <input type="text" name="write-prod" placeholder="식재료를 입력해주세요.(구분자는 , 입니다.)">
                 <!-- <input type="submit" value="식재료를 입력하세요."  style="height: 20px;" onclick=""> -->
                        </form>
                        
                        
                    </td>
                </tr>

            </table>

            <div align="center">
                <br>
                <button type="submit">등록하기</button>
                <button type="reset">취소하기</button>
            </div>

        </form>
        

    </div>
    		
    		
        </main>
            <!-- 인클루드 == 메인보다 밖에 있어야 함, 컨테이너 안에 있어야 함!-->
            <%@include file="/views/common/footer.jsp" %>
    </div>

    

</body>
</html>