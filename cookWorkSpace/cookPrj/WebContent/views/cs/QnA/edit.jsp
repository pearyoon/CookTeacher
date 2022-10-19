<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 문의 수정</title>
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

/* 제목 영역 */
.title-area{
	width: 600px;
	height: 100px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 2fr;
	grid-template-rows: repeat(2, 50px);
	align-content: center;
	text-align: center;
	border-top: 3px solid black;
}
#a{
	grid-column: span 3;
}
#title{
	width: 520px
}
.title-area>div{
	line-height: 50px;
}
.title-area>.write{
	text-align: left;
}
.title-area>#b{
	font-size: small;
}

/* 내용 영역 */
.content-area{
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	text-align: center;
	padding: 10px;
}
/* 등록 버튼 */
#writebtn{
	height: 20px;
	display: flex;
	flex-direction: row-reverse;
	font-size: small;
	margin: 5px;
}
</style>
<body>
<%@include file="/views/common/header.jsp" %>

	
	<div id="container"> <!-- 컨테이너 -->
		<div class="name">
			<!-- 게시판 이름 -->
			<div id="qna">QnA</div>
		</div>

		<div class="title-area">
			<!-- 문의 작성 -->
			<div id="a">
				제목 : <input type="text" id="title" name="title">
			</div>
			<div id="b">작성자 :</div>
			<div class="write" id="b" name="writer">민우볶음</div> <!-- 작성자 코드 받기-->
			<div id="b" name="enrollDate">2022.10.15 16:55</div> <!-- 수정일시 코드 받기-->
		</div>

		<div class="content-area">
		<br>
			<textarea name="content" rows="20" cols="80" style="resize:none;" required>
			<!-- 수정 내용 받기 -->
			</textarea>
		<br><br>
		</div>
		<div id="writebtn"><a href="">수정</a></div>
		
		<%@include file="/views/common/footer.jsp" %>
	</div>
</body>
</html>