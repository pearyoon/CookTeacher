<%@page import="com.kh.cook.bobstory.vo.AttachmentVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BobstoryVo vo = (BobstoryVo)request.getAttribute("vo");
	AttachmentVo attVo = (AttachmentVo)request.getAttribute("attachmentVo");
	if(attVo == null){
		attVo = new AttachmentVo();
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밥이야기 상세페이지</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
	main{
		width: 60vw;
		height: 60vh;
		border: 1px solid black;
		margin: 0 auto;
		display: grid;
		grid-template-columns: 1fr 5fr 3fr 1fr 3fr;
		grid-template-rows: 30px 300px 100px;
		align-content: center;
	}
	main >div{
		border: 1px solid black;

	}

	#content-box{
		grid-column: span 5;
	}

	#img-box{
		grid-column: span 5;
		display: flex;
		justify-content: center;
	}

</style>
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container"> <!-- 컨테이너 -->
				<main>
					<div><%=vo.getCategory() %></div>
					<div><%=vo.getTitle() %></div>
					<div><%=vo.getWriter() %></div>
					<div><%=vo.getViewCount() %></div>
					<div><%=vo.getEnrollDate() %></div>
					<div id="content-box"><%=vo.getContent() %></div>
					<div id="img-box"><img alt="사진" src="/cookTeacher/<%=attVo.getFilePath() %>/<%=attVo.getChangeName() %>" width="100px" height="100px"></div>
				</main>
	<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
</body>
</html>