<%@page import="com.kh.cook.cs.vo.CSVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<CSVo> QNAList = (List<CSVo>)request.getAttribute("QNAList");
    /* 페이징처리 코드 추가하기 */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 600px;
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
	width: 600px;
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

#writebtn{
	height: 20px;
	display: flex;
	flex-direction: row-reverse;
}
#page-area{
	align-content: center;
	text-align: center;
	line-height: 30px;
	height: 30px;
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
			</div>

			<div class="title">
				<!-- 문의 게시판 목록 -->
				<div>글번호</div>
				<div>제목</div>
				<div>작성자</div>
				<div>작성일시</div>
			</div>
			<div class="list">
				<!-- 짜가 목록 나중에 지움 -->
				
				<%for(int i = 0; i<QNAList.size(); i++){ %>
					<div><%= QNAList.get(i).getQnaNo() %></div>
					<div><a href="/cookTeacher/cs/QnA/detail?no=<%= QNAList.get(i).getQnaNo() %>"><%= QNAList.get(i).getTitle() %></a></div>
					<div><%= QNAList.get(i).getWriter() %></div>
					<div><%= QNAList.get(i).getQnaDate() %></div>
				<%} %>

			</div>
			
			<div id="page-area">
				<a href="">이전</a>

				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>

				<a href="">다음</a>
			</div>
			
			<%if(session.getAttribute("loginMember") != null){ %>
				<div id="writebtn"><a href="/cookTeacher/cs/QnA/write">글쓰기</a></div>
			<%} %>

		</main>
		<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
	</div>
</body>
</html>