<%@page import="com.kh.cook.cs.vo.CSVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<CSVo> myQNAList = (List<CSVo>)request.getAttribute("myQNAList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/check.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/modify.css">
<style>
#board-container>.title{
	width: 820px;
	height: 35px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr 2fr;
	align-content: center;
	text-align: center;
	
	font-size: middle;
	font-weight: bold;
}
#board-container>.list{
	width: 820px;
	height: 350px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr 2fr;
	grid-template-rows: repeat(10,10%);
	align-content: center;
	align-items: center;
	text-align: center;
	font-size: small;

	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
#board-container>.list>div{
	align-content: center;
	border-bottom: 1px dotted lightgray;
	line-height: 35px
}
</style>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="mypage-area">
                <div id="mypage-left">
                    <h2 id="tit-aticle">마이쿡</h2>
                    <div id="inner">
                        <ul id="list-menu">
                            <li class="non-clcik">
                                <a href="">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="/cookTeacher/views/cs/QnAhistory">
                                <a href="">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <h2 id="head-aticle">
                        문의내역
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">
                    	<!-- *****************************여기 작성하면 댐!**************************** -->
                    	
                    	<div class="title">
							<!-- 문의 게시판 목록 -->
							<div>글번호</div>
							<div>제목</div>
							<div>작성일시</div>
							<div>답변여부</div>
						</div>
						
						<div class="list">
							
							<div>1</div>
							<div>제목</div>
							<div>작성일시</div>
							<div>답변여부</div>
							
							<%for(int i = 0; i<myQNAList.size(); i++){ %>
								<div><%= myQNAList.get(i).getQnaNo() %></div>
								<div><a href="/cookTeacher/cs/QnA/detail?no=<%= myQNAList.get(i).getQnaNo() %>"><%= myQNAList.get(i).getTitle() %></a></div>
								<div><%= myQNAList.get(i).getQnaDate() %></div>
								<div><!-- 댓글 갯수 혹은 Y/N으로 표현 -->Y</div>
							<%} %> 
			
						</div>
                    	
                    	
                    	<!-- *****************************여기까지!**************************** -->
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>


    </script>
</body>
</html>