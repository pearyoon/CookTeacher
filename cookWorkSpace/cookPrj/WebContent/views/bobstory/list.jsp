<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BobStory</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<style>
	.bob-main>div>a{
		margin-top: 10px;
		margin-left: 10px;
	}
	.bob-main>div>h1{
		margin-top: 10px;
		margin-left: 10px;
	}
	.bob-main>div>img{
		margin-top: 10px;
		margin-left: 10px;
	}
	click{
		display: flex;
		flex-direction: row-reverse;
	}

	.bob-main{
		display: grid;
		grid-template-columns: 0.3fr 2fr 0.3fr 0.3fr 0.3fr;
	}

	table{
		--border: 2px solid black;

		background-color: #eeee;
		border-spacing: 0;
		border-collapse: collapse;
		width: 1050px;
		height: 500px;
		text-align: center;
	}
	.bob-board-head{
		height: 30px;
		vertical-align: middle;
	}

	.write-btn{
		display: inline-block;
		cursor: pointer;
		padding: 0 10px;
		text-align: center;
		overflow: hidden;
		width: 75px;
		height: 30px;
		background-color: #255D00;
		color: white;
		border: 0px none;
		border-radius: 5px;
		font-size: 16px;
	}
	.write-btn:hover{
		background-color: #255d00cf;
	}
	thead{
		height: 40px;
	}
	tbody{
		--border: 2px solid black;
	}
	tbody>tr>td{
		border-bottom: 1px dashed black;
	}

	div>h1{
		font-size: large;
		font-weight: 900;
	}

	#bob-main>div{
		display: flex;
	}
	.bob-board-head{
		background-color: #999;
	}
	.bob-content{
		box-sizing: border-box;
		margin: 0 auto;
	}

</style>
</head>
<body>
		<!--<%@include file="/views/common/header.jsp" %> --> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		
		<div id="container"> <!-- 컨테이너 -->
			<div id="main">
				<div class="bob-main">
					<div><img src="/cookTeacher/resources/img/bobstory.png" alt="밥책" width="50px" height="40px"></div>
					<div class="bobstory"><h1>밥 스토리</h1></div>
				</div>
				<div class="click">
					<a href="">추천순</a>
					<a href="">조회순</a>
					<a href="">댓글순</a>
				</div>
				<table class="bob-board">
				<thead>
						<tr class="bob-board-head">
							<th scope="col" class="bb-num">번호</th>
							<th scope="col" class="bb-title">제목</th>
							<th scope="col" class="bb-writer">글쓴이</th>
							<th scope="col" class="bb-date">날짜</th>
							<th scope="col" class="bb-like">추천</th>
						</tr>
					</thead>
					<tbody>
						<tr class="bob-content">
							<td>1</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>소은덮밥</td>
							<td>2022-10-12</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>민우덮밥</td>
							<td>2022-10-12</td>
							<td>9</td>
						</tr>
						<tr>
							<td>3</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>윤아덮밥</td>
							<td>2022-10-12</td>
							<td>8</td>
						</tr>
						<tr>
							<td>4</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>동주덮밥</td>
							<td>2022-10-12</td>
							<td>7</td>
						</tr>
						<tr>
							<td>5</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>연주덮밥</td>
							<td>2022-10-12</td>
							<td>6</td>
						</tr>
						<tr>
							<td>6</td>
							<td>기름없이 튀겨먹는 감자튀김</td>
							<td>서연덮밥</td>
							<td>2022-10-12</td>
							<td>5</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="write"> 
					<div class="board-footer">
							<input type="text" name="search-board" id="board-search" placeholder="검색">
							<input type="button" value="글쓰기" class="write-btn" onclick="location.href='/cookTeacher/views/write.jsp'">
					</div>
				</div>
			</div>
			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		<</div>
		
</body>
</html>