<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 회원가입</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/admin/edit.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>회원 정보</div>
        <div id="join-wrap">
            

            <div></div>

          
            <div id="join-top">
                
                <form action="/cookTeacher/admin/member/edit" method="post" onsubmit="return checkEdit()">
                    <div class="join-items">
                        <div>
                            <label for="memberId">아이디</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberId" type="text" name="memberId" value="" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberName">이름</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberName" class="focus" type="text" name="memberName" value="">
                            </div>
                        </div>

                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberNick">닉네임</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberNick" type="text" name="memberNick" value="" readonly>
                            </div>

                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="email">이메일</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="email" type="text" name="email" value="" readonly>
                            </div>

                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="phone">포인트</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="phone" class="focus" type="text" name="phone" value="">
                            </div>
                        </div>
                    </div>
                    <div id="line"></div>
                    <div class="join-bottom">
                        <input class="focus" id="memberPwd1" type="password" name="memberPwd1" placeholder="관리자님의 비밀번호를 입력해주세요.">

                    </div>
                    <div class="join-bottom">
                        <button type="submit">수정하기</button>
                    </div>
                </form>
            </div>

    
        </div>
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
    </script>
  
</body>
</html>