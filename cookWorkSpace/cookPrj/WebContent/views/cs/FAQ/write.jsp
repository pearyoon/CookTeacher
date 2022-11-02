<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 고객센터</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script><!-- 알람 -->
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
color: black;
}

/* 제목 영역 */
.title-area{
	width: 600px;
	height: 50px;
	margin: 0px auto;
	border-top: 3px solid black;
	text-align: center;
	line-height: 50px;
}
#title{
	width: 500px
}

/* 내용 영역 */
.content-area{
	width: 600px;
	height: 400px;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	text-align: center;
	padding: 10px;

}
/* 등록 취소 버튼 */
#writebtn input{
	height: 30px;
	width: 50px;
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

#writebtn input:hover{
    border: 10px yellow;
    background-color: #326e0b;
}
</style>

<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
	<!-- 헤더는 컨테이너 밖에 -->
	
	
	<!-- 관리자만 가능한 기능 -->
	
	
	<div id="container"> <!-- 컨테이너 -->
		<div class="name">
			<!-- 게시판 이름 -->
			<div id="qna">FAQ 자주묻는질문</div>
		</div>
		
		<form id="fff" action="/cookTeacher/cs/FAQ/write" method="post" onsubmit="return upload();">
			<div class="title-area">
				<!-- 문의 작성 -->
					제목 : <input type="text" id="title" name="title">
			</div>
	
			<div class="content-area">
			<br>
				<textarea name="content" rows="22" cols="80" style="resize:none;" required></textarea>
			<br><br>
			</div>
			
			<div id="writebtn">
				<input type="button" name="" id="" value="취소" onclick="cancel();">
				<input type="submit" value="등록">
			</div>
			
			<!-- upload()함수 -->
			<script>
				function upload(){
					Swal.fire({
                       title: '등록 성공!',
                       icon: 'success',
                    });
				}
				
				function upload(){
					
					Swal.fire({
					  title: '등록하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonText: '확인',
					  cancelButtonText: '취소',
					  })
					  .then((result)=>{
						  console.log(result);
						  if (result.isConfirmed) {
							  
							  
							  Swal.fire({
		                            icon: 'success',
		                            text: '등록되었습니다.',
		                      }).then( ()=> {document.querySelector('#fff').submit();} );
						  }
					  });
					
					  return false;
				}//upload end

				
				function cancel(){
					Swal.fire({
                       title: '등록 취소',
                       icon: 'info',
                    });
					location.href="/cookTeacher/cs/FAQ/list"
				}
			</script>
		</form>
		<%@include file="/views/common/footer.jsp" %>
	</div>
</body>
</html>