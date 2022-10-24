<%@page import="com.kh.cook.bobstory.vo.CategoryVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CategoryVo> cateList =  (List<CategoryVo>)request.getAttribute("cateList");
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥이야기 글쓰기</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>


.outer{
    color: black;
    width: 60%;
    height: 550px;
    margin: auto;
    padding-top: 50px;
 }

 #enroll-form table{border: 1px solid black; margin:auto;}

 #enroll-form input, #enroll-form textarea{
    width: 100%;
    box-sizing: border-box;
 }

</style>
</head>
<body>
    <%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
    <!-- 헤더는 컨테이너 밖에 -->
    <div id="container"> <!-- 컨테이너 -->
  		<div id="main">
		      <div class="outer">
		        <br>
		        <h2 align="center">밥이야기 작성하기</h2>
		        <br>
		        <form id="enroll-form" action="" method="post" enctype="multipart/form-data">
		            <!-- 카테고리, 제목, 내용, 첨부파일 한개 -->
		            <table>
		                <tr>
		                    <th width="70px">카테고리</th>
		                    <td width="500px">
		                        <select name="category">
		                            <!-- CATEGORY 테이블로부터 조회해오기 -->
		                            <%for(int i = 0; i < cateList.size(); i++) {%>
		                            	<option value="<%=cateList.get(i).getMenu_cate_no()%>"><%=cateList.get(i).getMenu_type() %></option>
		                            <%} %>
		                        </select>
		                    </td>
		                </tr>
		                <tr>
		                    <th>제목</th>
		                    <td><input type="text" name="title" required></td>
		                </tr>
		                <tr>
							<th></th>
		                    <td><textarea name="content" rows="20" cols="70" style="resize:none;" required></textarea></td>
		                </tr>
		                <tr>
		                    <th>첨부파일</th>
		                    <td><input type="file" name="file" id="file"></td>
		                </tr>
		            </table>
					<br>
		            <div align="center">
		                <button type="submit">레시피 쓰기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <button type="reset">취소하기</button>
		            </div>
		        </form>
		    </div>
   		</div>
    <%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
    </div>
</body>
</html>