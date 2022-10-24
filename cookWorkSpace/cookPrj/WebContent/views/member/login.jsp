<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 로그인</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/login.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    
    <div id="container">
        <div>로그인</div>
        <div id="login-wrap">
            <form method="post">
                <div id="login-top">
                    <div>
                        <input id="memberId" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                    </div>
                    <div>
                        <input id="memberPwd" type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요.">
                    </div>
                </div>
                <div id="findMem">
                    <a href="/cookTeacher/member/find/id">아이디 찾기 </a>
                    <span> | </span>
                    <a href="/cookTeacher/member/find/pwd"> 비밀번호 찾기</a>
                </div>
                <div id="btn">
                    <div>
                        <button id="login-btn" type="button" onclick="loginCheck();">로그인</button> 
                    </div>
                    <div>
                        <button>회원가입</button>
                    </div>   
                    
                </div>
            </form>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    <script>

        function loginCheck() {

            let memberId = $('#memberId').val();
            let memberPwd = $('#memberPwd').val();
            let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            let pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            
            if(idReg.test(memberId) && pwdReg.test(memberPwd)){

                $.ajax({
                    url : "/cookTeacher/member/login",
                    method : "POST",
                    data : {
                        "memberId" : memberId ,
                        "memberPwd" : memberPwd
                    },
                    success : function(data){
                        if(data == "loginFail"){
                            alert("아이디와 비밀번호를 확인해주세요.");
                            
      
                        } else{ 
                            window.location.href = "/cookTeacher";
                        }
                    },
                    error : function(){
                        alert("통신에러");
                    }
                });

            } else{
                alert('아이디와 비밀번호를 확인해주세요.');
            }
        }

    </script>
</body>
</html>