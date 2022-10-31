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
<title>집밥쿡선생 :: 쿡스토리</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/write.css">
<script type="text/javascript" src="/cookTeacher/resources/js/bobstory/write.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

    <%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
    <!-- 헤더는 컨테이너 밖에 -->
    <div id="container"> <!-- 컨테이너 -->
		<main>
			<br>
			<br>
			<p align="center" class="cookstory">쿡 스토리</p>
			<br>
			<form class="write" action="" method="post" enctype="multipart/form-data" onsubmit="return up_ok();">
				<div id="cate">
					카테고리&nbsp;<select name="category">
						<!-- CATEGORY 테이블로부터 조회해오기 -->
						<%for(int i = 0; i < cateList.size(); ++i){%>
							 <option value="<%= cateList.get(i).getMenu_cate_no() %>"><%= cateList.get(i).getMenu_type() %></option>
						<%}%>
					</select>
				</div>
				<input type="text" name="title" placeholder="제목을 입력해주세요." required>
				<hr>
				<textarea name="content" id="text" cols="10" rows="20" style="width: 676px; height: 270;" placeholder="내용을 입력해주세요" required resize="none"></textarea>
				<div class="select_img"><img src="" /> </div>
				<div class="upfile">
					<input type="file" name="file" id="bobImg">
				</div>
				<div class="upload">
					<input type="submit" id="btn-1" value="글쓰기">
					&nbsp;
					&nbsp;
					<input type="reset" name="" id="btn-1" value="취소" onclick="history.back(-1)">
				</div>
				<br>
			</form>
		</main>
	
		<footer>
			<div>
				<p>Copyright &copy; <a href="">집밥Cook선생</a>  all rights reserved</p>
			</div>
			<br>
		</footer>
    <%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
    </div>
</body>
</html>