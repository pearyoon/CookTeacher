<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 아이디찾기</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/find/id.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>
    <%@ include file="/views/common/header.jsp" %>   
    <div id="container">
        <main>
            <div>아이디 찾기</div>
            <div id="find-area">
                <div>이메일 인증</div>
                <form method="post">
                    <div class="find-items">
                        <label for="memberName">이름</label>
                        <div>
                            <input id="memberName" type="text" name="memberName" placeholder="이름을 입력해주세요.">
                        </div>
                    </div>
                        <div class="hidden-box">
                            <p id="hidden-name"></p>
                        </div>
                    <div class="find-items">
                        <label for="memberEmail">이메일</label>
                        <div>
                            <input id="memberEmail" type="text" name="memberEmail" placeholder="이메일을 입력해주세요.">
                        </div>
                    </div>
                    <div class="hidden-box">
                        <p id="hidden-email"></p>
                    </div>
                    
                    <div id="find-btn">
                        <button type="button" onclick="findId();">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>
        // 이름
        $('#memberName').keyup(function(){
            const memberName = $('#memberName').val();
           
            if(memberName.length < 2){
                $('#hidden-name').text("가입 시 등록한 이름을 입력해주세요.");
            } else{
                $('#hidden-name').text("");
            }
        });

        // 메일
        $('#memberEmail').keyup(function(){
            const memberEmail = $('#memberEmail').val();
            const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            
            
            if(!emailReg.test(memberEmail)){
                $('#hidden-email').text("가입 시 등록한 이메일을 입력해주세요.");
            } else{
                $('#hidden-email').text("");
            }
        });

        // 확인하기
        function findId(){
            const memberName = $('#memberName').val();
            const memberEmail = $('#memberEmail').val();
            const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            
            console.log(memberName);
            console.log(memberEmail);
            if(emailReg.test(memberEmail) && memberName.length >= 2){
                $.ajax({
                    url : "/cookTeacher/member/find/id",
                    method : "POST",
                    data : {
                        "memberName" : memberName ,
                        "memberEmail" : memberEmail
                    },
                    success : function(data){
                        if(data == "findFail"){
                            Swal.fire({
                                icon: 'error',
                                text: '가입시 입력하신 회원정보가 맞는지 다시 한번 확인해주세요.',
                            });
                        }else{
                           
                           	window.location.href = "/cookTeacher/member/find/success/id"
                           
                        }
                    },

                    error : function(){
                        alert("ajax오류");
                    }
                });

            } else{
                Swal.fire({
                    icon: 'error',
                    text: '이름과 이메일을 확인해주세요.',
                });
            }

        }
        

    </script>
</body>
</html>