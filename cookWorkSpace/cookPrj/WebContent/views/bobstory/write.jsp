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
<title>쿡스토리</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>

    <%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
    <!-- 헤더는 컨테이너 밖에 -->
    <div id="container"> <!-- 컨테이너 -->
		<!-- <table class="cook-write">
			<thead>
				<th>카테고리</th>
				<td>
					<select name="category">
						<%for(int i = 0; i < cateList.size(); i++) {%>
							<option value="<%=cateList.get(i).getMenu_cate_no()%>"><%=cateList.get(i).getMenu_type() %></option>
						<%} %>
					</select>
				</td>
			</thead>
		</table>
		 -->
		<div class="outer">
			<br>
			<h1 align="center">쿡스토리 글쓰기</h1>
			<br>
			<form id="enroll-form" action="" method="post" enctype="multipart/form-data">
				<table class="table">
					<thead>
						<th width="70px">카테고리</th>
						<td width="500px">
							<select name="category">
								CATEGORY 테이블로부터 조회해오기
								<%for(int i = 0; i < cateList.size(); i++) {%>
									<option value="<%=cateList.get(i).getMenu_cate_no()%>"><%=cateList.get(i).getMenu_type() %></option>
								<%} %>
							</select>
						</td>
					</thead>
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
    <%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
    </div>
</body>
</html>