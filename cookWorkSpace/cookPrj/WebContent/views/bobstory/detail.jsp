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
<title>쿡스토리</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/detail.css">
<script type="text/javascript" defer src="/cookTeacher/resources/js/bobstory/detail.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container">
			<br>
			<br>
			<p>쿡 스토리</p>
			<br>
			<br>
			<table class="table">
				<thead>
					<tr class="ta-1">
					<td class="t-ti" ><%=vo.getTitle()%></td>
					<td class="t-cl"><p>추천수</p><br><%=vo.getcLike()%></td>
					<td class="t-vc"><p>조회수</p><br><%=vo.getViewCount()%></td>
					</tr>
					<tr class="ta-2">
					<td class="t-wr"><p><%=vo.getWriter()%></p></td>
					<td class="t-no">No.<%=vo.getNo()%></td>
					<td class="t-da"><%=vo.getEnrollDate()%></td>
					</tr>
				</thead>
				<tbody>
					<%if(attVo != null){%>
						<tr>
							<td id="img-box"><img alt="사진" src="<%=root %>/<%=attVo.getFilePath() %>/<%=attVo.getChangeName() %>"></td>
						</tr>
					<%}%>
					<tr>
						<td><%=vo.getContent()%></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="vote_btn">
				<button id="like_btn" onclick="bLike();">좋아요</button>
				<button id="report_btn" onclick="location.href='/cookTeacher/bobstory/report'">신고</button>
				<!-- <input type="button" id="like_btn" value="좋아요" onclick="bLike();"> -->
				<!-- <input type="button" id="report_btn" value="신고" onclick="location.hred='/cookTeacher/bobstory/report'"> -->
			</div>
			<%if(loginMember != null && loginMember.getNick().equals(vo.getWriter())){%>
			<div id="main-bot">
				<a href="/cookTeacher/bobstory/edit?no=<%=vo.getNo()%>">수정하기</a>
				<a href="/cookTeacher/bobstory/delete?no=<%=vo.getNo()%>" class="check-d" onclick="delete_b();">삭제하기</a>
			<%}%>
		</div>
		<div class="bob_cmt">
			
		</div>
	<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div>
		
</body>
</html>