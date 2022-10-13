<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 제목 영역 */
.title-area{
	width: 60vw;
	height: 5vh;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 5fr 3fr;
	align-content: center;
	text-align: center;
	border-top: 3px solid black;
}
#title{
	grid-column: span 2;
}
.title-area>.write{
	text-align: left;
}
.title-area>#a{
}

/* 내용 영역 */
.content-area{
	border-top: 3px solid black;
	border-bottom: 3px solid black;
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
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
	<!-- 헤더는 컨테이너 밖에 -->
	<div id="container"> <!-- 컨테이너 -->
		<main>
			<div class="name">
				<!-- 게시판 이름 -->
				<div id="faq">FAQ</div>
			</div>

			<div class="title-area">
				<!-- 문의 작성 -->
				<div id="a">제목</div>
				<div class="write" id="title" name="title">자주묻는질문남기나요?</div> <!-- 제목 코드 작성-->
			</div>

			<div class="content-area">
				<table>
					<tr>
							<th>내용</th>
							<td><textarea name="content" rows="10" style="resize:none;" required></textarea></td>
					</tr>
				</table>
			</div>
			<div id="writebtn"><a href="">등록</a></div>
		</main>
		<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
	</div>
</body>
</html>