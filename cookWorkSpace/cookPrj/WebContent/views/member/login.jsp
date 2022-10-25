<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 로그인</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/login.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    

    
    <div id="container">
        <div>로그인</div>
        <div id="login-wrap">
			<form action="/cookTeacher/member/login" method="post"  onsubmit="return checkLogin();">
               <div id="login-top">
                   <div>
                       <input id="memberId" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                   </div>
                   <div>
                       <input id="memberPwd" type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요.">
                   </div>
                   <div class="hidden-box">
                        <i class="bi bi-exclamation-circle"></i>
                   		<p>아이디 또는 비밀번호를 잘못 입력했습니다.</p>
                   </div>
               </div>
               <div id="findMem">
                   <a href="/cookTeacher/member/find/id">아이디 찾기 </a>
                   <span> | </span>
                   <a href="/cookTeacher/member/find/pwd"> 비밀번호 찾기</a>
               </div>
               <div id="btn">
                   <div>
                       <button id="login-btn" type="submit">로그인</button> 
                   </div>
                   <div>
                       <button type="button" onclick="joinBtn();">회원가입</button>
                   </div>   
                    
                </div>
          	</form>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    <script>


			
    	function checkLogin(){
    		
    		let memberId = $('#memberId').val();
            let memberPwd = $('#memberPwd').val();
            let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            let pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            
            if(!idReg.test(memberId) && !pwdReg.test(memberPwd)){
                $('.hidden-box').addClass('fail');
                $('.hidden-box').removeClass('hidden-box');
				return false;
            } else{
				return true;
                            
            }
    	};
       		
            
        
        function joinBtn(){
        	window.location.href = "/cookTeacher/member/join";
        };

        <c:if test="${loginFail != null}">
            $('.hidden-box').addClass('fail');
            $('.hidden-box').removeClass('hidden-box');
        </c:if>


    </script>
</body>
</html>