<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BobStory</title>
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
	
	#search-story{
		display: flex;
		flex-direction: row-reverse;	
	}
	.t1-list{
		position: relative;
	}
	.blind{
		overflow: hidden;
		position: absolute;
		top: 0;
		left: 0;
		width: 0;
		height: 0;
		padding: 0;
		font-size: 0;
		line-height: 0;
	}
    
</style>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
		<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container"> <!-- 컨테이너 -->
				<main>
					<div id="bob-table">
						<div id="bob-t1">
							<img src="/cookTeacher/resources/img/bobstory.png" alt="밥책" width="50px" height="40px">
							<a href="" id="bob=name">밥 스토리</a>
							<ul class="t1-list" style="overflow:visible;">
								<li><a href="">조회순</a></li>
								<li><a href="">추천순</a></li>
								<li><a href="">댓글순</a></li>
							</ul>
						</div>
						<table class="bob-board">
							<caption class="blind">글 목록</caption>
							<thead class="bob-board-head">
								<tr>
									<th scope="col" class="board-num"><span>번호</span></th>
									<th scope="col" class="board-title"><span>제목</span></th>
									<th scope="col" class="board-writer"><span>글쓴이</span></th>
									<th scope="col" class="board-enroll"><span>날짜</span></th>
									<th scope="col" class="board-like"><span>추천</span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
							<div class="board-footer">
								<div class="search">
									<span class="search-img">
										<label for="">검색</label>
										<input type="text" name="search-board" id="board-search">
									</span>
									<div class="write"> 
										<a href="" class="write-btn">글쓰기</a>
									</div>
								</div>
							</div>

						</table>
					
					</div>
			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
				</main>
		</div>
		
</body>
</html>