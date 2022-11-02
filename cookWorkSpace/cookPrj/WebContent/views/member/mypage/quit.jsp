<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 탈퇴</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/mypage/quit.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	
	<c:if test="${alertMsg != null}">
		<script>
	        Swal.fire({
	            icon: 'error',
	            text: '${alertMsg}',
	        });
		</script>
	</c:if>
	
	<div id="container">
		<main>
			<div>회원탈퇴안내</div>
			<div class="middle-wrap">
				<div class="middle-flex">
					<div class="flex-top">
						<div>회원탈퇴안내</div>
					</div>
					<div class="flex-bottom">
						<div>회원 탈퇴 시의 아래 사항을 숙지하시기 바랍니다.</div>
						<ul>
							<li>1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호 정책에 따라 관리 됩니다.</li>
							<li>2. 탈퇴 시 해당 아이디는 재사용이 불가능합니다.</li>
							<li>3. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<form action="/cookTeacher/login/member/mypage/quit" method="post" onsubmit="return quitCheck();">
				<div class="input-area">
					<div>
						<label for="memberPwd">비밀번호 입력</label>
					</div>
					<div>
						<input type="password" id="memberPwd" name="memberPwd" placeholder="현재 비밀번호를 입력해주세요.">
					</div>
				</div>
				<div class="btn-area">
					<button type="button" >
						<span>취소</span>
					</button>
					<button id="fff" type="submit">
						<span>탈퇴</span>
					</button>
				</div>
			</form>
		</main>
		<%@include file="/views/common/footer.jsp" %>
	</div>
	
	<script>
		$('#memberPwd').focus(function(){

			$('#memberPwd').css("border", "1px solid rgb(51, 51, 51)");
		});

		$('#memberPwd').blur(function(){
			$('#memberPwd').css("border", "1px solid rgb(221, 221, 221)");
		});

		function quitCheck(){


			const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			const pwd = $('#memberPwd').val();

			if(!pwdReg.test(pwd)){
				Swal.fire({
					icon: 'error',
					text: '비밀번호를 확인해주세요.',
				});
				return false;
			}

		};
		

		$('button[type="button"]').click(function(){

			window.location.href = "/cookTeacher/login/mypage/member/check";
		});
		
	</script>


</body>
</html>