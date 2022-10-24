<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 비밀번호찾기</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/id.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
    <%@ include file="/views/common/header.jsp" %>   
    <div id="container">
        <main>
            <div>비밀번호 찾기</div>
            <div id="find-area">
                <div>휴대폰/이메일 인증</div>
                <form>
                    <div class="find-items">
                        <label for="memberId">아이디</label>
                        <div>
                            <input id="memberId" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                        </div>
                    </div>
                        <div class="hidden-box">
                            <p id="hidden-name"></p>
                        </div>
                    <div class="find-items">
                        <label for="phone">휴대폰</label>
                        <div>
                            <input id="phone" type="text" name="phone" placeholder="번호만 입력해주세요." oninput="autoHyphen(this)" maxlength="13" >
                        </div>
                    </div>
                        <div class="hidden-box">
                            <p id="hidden-phone"></p>
                        </div>    
                    <div class="find-items">
                        <label for="email">이메일</label>
                        <div>
                            <input id="email" type="text" name="email" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div class="hidden-box">
                        <p id="hidden-email"></p>
                    </div>
                    
                    <div id="find-btn">
                        <button type="button" onclick="findPwd();">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>
        // 아이디


        $('#memberId').keyup(function(){

            const memberId = $('#memberId').val();
            const idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
            
            if(!idReg.test(memberId)){
                $('#hidden-name').text("가입시 등록한 아이디를 입력해주세요.");
            } else{
                $('#hidden-name').text("");
            }
        });
        // 휴대폰
        const autoHyphen = (target) => {
            target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        };

        $('#phone').keyup(function(){
            
            const phone = $('#phone').val();
            const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
            
            if(!phoneReg.test(phone)){
                $('#hidden-phone').text("가입시 등록한 휴대폰을 입력해주세요.");
            } else{
                $('#hidden-phone').text("");
            }
        });

        // 이메일


        $('#email').keyup(function(){

            const email = $('#email').val();
            const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

            if(!emailReg.test(email)){
                $('#hidden-email').text("가입시 등록한 이메일을 입력해주세요.");
            } else{
                $('#hidden-email').text("");
            }
        });


    </script>
</body>
</html>