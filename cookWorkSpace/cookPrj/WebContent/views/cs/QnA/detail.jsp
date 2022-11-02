<%@page import="com.kh.cook.cs.vo.CSCommentVo"%>
<%@page import="com.kh.cook.cs.vo.CSVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    CSVo QNAvo = (CSVo)request.getAttribute("QNAvo");
    CSCommentVo cvo = (CSCommentVo)request.getAttribute("cvo");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 고객센터</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
#container>div{
	box-sizing: border-box;
}

#container{
    position: absolute;
    padding-bottom: 50px;
    top: 280px;
    left: 50%;
    transform: translate(-50%);

}
/* 타이틀 글자 */
.name{
/*position: absolute;*/
display: flex;

font-family: 'Inter';
font-style: normal;
font-weight: 600;
font-size: 30px;
line-height: 50px;
text-align: center;
color: #000000;
}

/* 제목 영역 */
.title-area{
	width: 600px;
	height: 100px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr;
	grid-template-rows: repeat(2, 50px);
	align-content: center;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	padding-left: 10px;
	padding-right: 10px;
}
#a{
	grid-column: span 3;
}
.title-area>div{
	line-height: 50px;
	text-align: left;
}
.title-area>.write{
	text-align: left;
}
.title-area>#writer,#date{
	font-size: small;
}
.title-area>#date{
text-align: right;
}
/* 내용 영역 */
.content-area{
	width: 600px;
	height: 200px;
	border-bottom: 3px solid black;
	padding: 10px;
	font-size: small;
	line-height: 20px;
}


/* 등록, 취소 버튼 */
#writebtn>button{
	height: 30px;
	width: 70px;
	background: #255D00;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: small;
	margin: 5px;
}

#writebtn{
	text-align: center;
	display: flex;
	flex-direction: row-reverse;
}

#writebtn>button:hover{
    border: 10px yellow;
    background-color: #326e0b;
}

</style>
</head>
<body>
<%@include file="/views/common/header.jsp" %>

	
	<div id="container"> <!-- 컨테이너 -->
	
		<div class="name">
			<!-- 게시판 이름 -->
			<div id="qna">QnA</div>
		</div>

		<!-- 문의글 상세 제목 및 내용 -->
		<div class="title-area">
			<div id="a">
				제목 : 
				<%=QNAvo.getTitle() %>
			</div>
			<div id="writer">작성자 :</div>
			<div class="write" id="writer" name="writer"><%=QNAvo.getWriter() %></div>
			<div id="date" name="enrollDate"><%=QNAvo.getQnaDate() %></div>
		</div>

		<div class="content-area">
			<br>
			<%= QNAvo.getContent() %>
			<br><br>
		</div>
		
		
		<div id=writebtn>
			<!-- 수정 / 삭제 버튼 -->
			<%	if(loginMember != null && loginMember.getNo().equals(QNAvo.getNo())){ %>
				<button type="button" onclick="location.href='/cookTeacher/cs/QnA/edit?no=<%= QNAvo.getQnaNo() %>';">수정</button>
				<button type="button" onclick="location.href='/cookTeacher/cs/QnA/delete?no=<%= QNAvo.getQnaNo() %>';">삭제</button>
			<% } %>
			
			<!-- 문의 답변 버튼 -->
			<%if(cvo == null) {%>
				<%	if(loginMember != null && loginMember.getId().equals("admin01")){ %>
					<button type="button" onclick="location.href='/cookTeacher/cs/QnA/reply?no=<%= QNAvo.getQnaNo() %>';">답변</button>
				<% } %>
			<%} %>
			<br>
		</div>		
		
		<%if(cvo != null) {%>
		<!-- 답변 영역 -->
		<div class="cmtlist">
			<!-- 문의글 상세 제목 및 내용 -->
			<div class="title-area">
				<div id="a">
					제목 : RE)<%=QNAvo.getTitle() %>
				</div>
				<div id="writer">작성자 :</div>
				<div class="write" id="writer" name="writer">관리자</div>
				<div id="date" name="enrollDate"><%=cvo.getCmtDate() %></div>
			</div>
	
			<div class="content-area">
				<br>
				<%=cvo.getCmtContent() %>
				<br><br>
			</div>
		</div>
		
		<div id=writebtn>
			<!-- 수정 / 삭제 버튼 -->
				<%	if(loginMember != null && loginMember.getId().equals("admin01")){ %>
					<button type="button" onclick="location.href='/cookTeacher/cs/QnA/editreply?no=<%= QNAvo.getQnaNo() %>';">답변수정</button>
					<button type="button" onclick="location.href='/cookTeacher/cs/QnA/deletereply?no=<%= QNAvo.getQnaNo() %>';">답변삭제</button>
				<% } %>
			<br>
		</div>		
		<%} %>
		
		<%@include file="/views/common/footer.jsp" %>
	</div>
</body>
</html>