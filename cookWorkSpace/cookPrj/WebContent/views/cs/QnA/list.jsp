<%@page import="com.kh.cook.common.PageVo"%>
<%@page import="com.kh.cook.cs.vo.CSVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<CSVo> QNAList = (List<CSVo>)request.getAttribute("QNAList");
    /* 페이징처리 코드 추가하기 */
    PageVo pv = (PageVo)request.getAttribute("pv");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 고객센터</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
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

/* 문의 리스트 */
.title{
	width: 700px;
	height: 35px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr 2fr;
	align-content: center;
	text-align: center;
	border-top: 3px solid black;
	font-size: larger;
	font-weight: bold;
}
.list{
	width: 700px;
	height: 350px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr 2fr;
	grid-template-rows: repeat(10,10%);
	align-content: center;
	align-items: center;
	text-align: center;
	font-size: large;

	border-top: 3px solid black;
	border-bottom: 3px solid black;
}
main>.list>div{
	align-content: center;
	border-bottom: 1px dashed gray;
	line-height: 35px
}

#page-area{
	align-content: center;
	text-align: center;
	line-height: 30px;
	height: 30px;
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

<body>
<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
	<!-- 헤더는 컨테이너 밖에 -->
	<div id="container"> <!-- 컨테이너 -->
		<main>
			<div class="name">
				<!-- 게시판 이름 -->
				<div id="qna">QnA</div>
			</div><br><br><br><br>

			<div class="title">
				<!-- 문의 게시판 목록 -->
				<div>글번호</div>
				<div>제목</div>
				<div>작성자</div>
				<div>작성일시</div>
			</div>
			<div class="list">
				
				<%for(int i = 0; i<QNAList.size(); i++){ %>
					<div><%= QNAList.get(i).getQnaNo() %></div>
					<div><a href="/cookTeacher/cs/QnA/detail?no=<%= QNAList.get(i).getQnaNo() %>"><%= QNAList.get(i).getTitle() %></a></div>
					<div><%= QNAList.get(i).getWriter() %></div>
					<div><%= QNAList.get(i).getQnaDate() %></div>
				<%} %>

			</div>
			
			<div id="page-area">
				<% if(pv.getStartPage() != 1){ %>
		            <a href="/cookTeacher/cs/QnA/list?pno=<%=pv.getStartPage()-1 %>">이전</a>
		        <%} %>
		        
		        <%for(int i = pv.getStartPage(); i<=pv.getEndPage(); ++i){ %>
		            <a href="/cookTeacher/cs/QnA/list?pno=<%=i %>"><%=i %></a>     
		        <%} %>
		        
		        <% if(pv.getEndPage() != pv.getMaxPage()){ %>
		            <a href="/cookTeacher/cs/QnA/list?pno=<%=pv.getEndPage()+1 %>">다음</a>
		        <%} %>
			</div>
			
			<%if(session.getAttribute("loginMember") != null){ %>
				<div id="writebtn">
					<button type="button" onclick="location.href='/cookTeacher/cs/QnA/write';">글쓰기</button>
				</div>
			<%} %>
			

		</main>
		<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
	</div>
</body>
</html>