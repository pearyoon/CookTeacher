<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 비밀번호 변경</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/success/pwd.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	    <div id="container">
        <main>
            <div>비밀번호 변경</div>
            <div class="modify-wrap">
                <div>새로운 비밀번호를 입력해주세요.</div>
                <form action="/cookTeacher/member/find/modify/pwd" method="post" onsubmit="return checkPwd();">
                    <div class="modify-items">
                        <label for="memberPwd1">새 비밀번호</label>
                        <div>
                            <input id="memberPwd1" class="focus" type="password" name="memberPwd1" placeholder="비밀번호을 입력해주세요.">
                        </div>
                    </div>
                        <div class="hidden-box">
                            <p id="hidden-pwd1"></p>
                        </div>
                    <div class="modify-items">
                        <label for="memberPwd2">새 비밀번호 확인</label>
                        <div>
                            <input id="memberPwd2" class="focus" type="password" name="memberPwd2" placeholder="비밀번호를 한번 더 입력해주세요.">
                        </div>
                    </div>
                    <div class="hidden-box">
                        <p id="hidden-pwd2"></p>
                    </div>
                    
                    <div class="modify-btn">
                        <button type="submit">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>
	<script>
        let inputArr = $('.focus');
        for(let i = 0; i < inputArr.length; i++){
            inputArr[i].addEventListener('focus',()=>{
                inputArr[i].style.border="1px solid rgb(51, 51, 51)";
            });
        }


        for(let i = 0; i < inputArr.length; i++){
            inputArr[i].addEventListener('blur',()=>{
                inputArr[i].style.border="1px solid rgb(221, 221, 221)";
            });
        }


        let pwd1ck = false
        $('#memberPwd1').keyup(function(){
            const memberPwd1 = $('#memberPwd1').val();
            const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

            if(!pwdReg.test(memberPwd1)){
                $('#hidden-pwd1').text('영문 숫자 특수문자 조합의 8자 이상');
            } else{
                $('#hidden-pwd1').text('');
                pwd1ck = true;
            }
        });

        let pwd2ck = false;
        $('#memberPwd2').keyup(function(){
            const memberPwd1 = $('#memberPwd1').val();
            const memberPwd2 = $('#memberPwd2').val();

            if(memberPwd1 != memberPwd2){
                $('#hidden-pwd2').text('동일한 비밀번호를 입력해주세요.');
                } else{
                    $('#hidden-pwd2').text('');
                    pwd2ck = true;
                }
        });

        function checkPwd(){
            if(!pwd1ck){
                Swal.fire({
                    icon: 'error',
                    text: '비밀번호는 영문 숫자 특수문자 조합의 8자 이상입니다.',
                });
                
                return false;
            }

            if(!pwd2ck){
                Swal.fire({
                    icon: 'error',
                    text: '비밀번호가 일치하지 않습니다.',
                });

                return false;
            }

            return true;

        };

    </script>
</body>
</html>