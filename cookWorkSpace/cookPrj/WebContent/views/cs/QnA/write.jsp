<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 문의 작성</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	width: 600px;
	height: 400px;
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	text-align: center;
	padding: 10px;
	font-size: small;
}

/* 등록, 취소 버튼 */
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
</head>
<body>
<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
	<!-- 헤더는 컨테이너 밖에 -->
	<div id="container"> <!-- 컨테이너 -->
		<div class="name">
			<!-- 게시판 이름 -->
			<div id="qna">QnA</div>
		</div>
		
		<form id="fff" action="/cookTeacher/cs/QnA/write" method="post" onsubmit="return upload();">
			<div class="title-area">
				<!-- 문의 작성 -->
				<div id="a">
					제목 : <input type="text" id="title" name="title">
				</div>
				<div id="b">작성자 :</div>
				<div class="write" id="b" name="writer"><%= loginMember.getNick()%></div>
				<div id="b" class="date" name="enrollDate">
					<script>
					const date = new Date;
					const year = date.getFullYear();
					const month = ('0' + (date.getMonth() +1)).slice(-2);
					const day = ('0' + date.getDate()).slice(-2);
					const dateStr = year + '-' + month + '-' + day;
					
					console.log(dateStr);
					$(".date").text(dateStr);
					</script>
					
				</div>
			</div>
		
			<div class="content-area">
			<br>
				<textarea name="content" rows="22" cols="80" style="resize:none;" required></textarea>
			<br>
			</div>
			
			<div id="writebtn">
				<input type="button" name="" id="" value="취소" onclick="cancel();">
				<input type="submit" value="등록">
			</div>
			
			<!-- upload()함수 -->
			<script>
/* 			function upload(){
				Swal.fire({
                   title: '등록 성공!',
                   icon: 'success',
                });
			} */
			
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
						  
						  
						    Swal.fire(
						      '등록하였습니다!',
					    	  'success'
					  	  ).then( ()=> {document.querySelector('#fff').submit();} );
					  }
				  });
				
				  return false;
			}//upload end

			
			/* function upload(){
				if(confirm("등록하시겠습니까?")){
					return true;
				}else{
					alert("작성을 취소합니다.");
					return false;
				}
			} */
			
			function cancel(){
				Swal.fire({
                    title: '등록 취소',
                    icon: 'info'
                 });
				location.href="/cookTeacher/cs/QnA/list"
			}
			</script>
			
		</form>
		<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
	</div>
</body>
</html>