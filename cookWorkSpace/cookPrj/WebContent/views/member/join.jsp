<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 회원가입</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/join.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>회원가입</div>
        <div id="join-wrap">
            
            <div>
                <div>모두 필수입력사항</div>
            </div>
          
            <div id="join-top">
                <form action="/cookTeacher/member/join" method="post" onsubmit="return check();">
                    <div class="join-items">
                        <div>
                            <label for="memberId">아이디</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberId" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                            </div>
                            <div>
                                <p id="hidden-id"></p>
                            </div>
                        </div>
                        <div>
                            <button>중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberPwd1">비밀번호</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberPwd1" type="password" name="memberPwd1" placeholder="비밀번호를 한번 더 입력해주세요.">
                            </div>
                            <div id="hidden-pwd1">
                                <p>최소 8자 이상</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberPwd2">비밀번호 확인</label>
                        </div> 
                        <div>
                            <div class="input-area">
                                <input id="memberPwd2" type="password" name="memberPwd2" placeholder="비밀번호를 한번 더 입력해주세요.">
                            </div>
                            <div id="hidden-pwd2">
                                <p>비밀번호를 한번 더 입력해주세요.</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberName">이름</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberName" type="text" name="memberName" placeholder="이름을 입력해주세요.">
                            </div>
                            <div id="hidden-name">
                                <p>이름을 입력해주세요.</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberNick">닉네임</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberNick" type="text" name="memberNick" placeholder="닉네임을 입력해주세요.">
                            </div>
                            <div id="hidden-nick">
                                <p>닉네임을 입력해주세요.</p>
                            </div>

                        </div>
                        <div>
                            <button>중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="email">이메일</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="email" type="text" name="email" placeholder="이메일을 입력해주세요.">
                            </div>
                            <div id="hidden-email">
                                <p>이메일 형식을 맞춰주세요.</p>
                            </div>

                        </div>
                        <div>
                            <button>중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="phone">휴대폰</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="phone" type="text" name="phone" placeholder="숫자만입력해주세요.">
                            </div>
                            <div id="hidden-phone">
                                <p>휴대폰 번호를 입력해주세요.</p>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="addr">주소</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="addr" type="text" type="text" name="addr" placeholder="주소를 입력해주세요.">
                            </div>
                            <div id="hidden-addr">
                                <p>주소를 입력해주세요.</p>
                            </div>
                        </div>
                        <div>
                            <button>주소 검색</button>
                        </div>
                    </div>
                    <div id="join-btn">
                        <div>
                            <input type="submit" value="가입하기">
                        </div>
                    </div>
                </form>
            </div>
    
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    
    <script>
    	// 아이디 유효성 체크
        const memberId = document.querySelector('input[name=memberId]');
        console.log(memberId);
    	memberId.addEventListener("blur" ,()=>{
    		
            const inputId = memberId.value;
            const regExp = /^[a-z]+[a-z0-9]{5,19}$/g;

    		if(inputId == ""){
    			document.querySelector('#hidden-id').innerHTML = '아이디를 입력해주세요.';
    		} else if(!regExp.test(inputId)){
                document.querySelector('#hidden-id').innerHTML = '영문 숫자 조합의 6자 이상  20자 이하';
            } else {
                document.querySelector('#hidden-id').innerHTML = '';
            }
    	});
        
        // 비밀번호 유효성 체크
        const memberPwd1 = document.querySelector('input[name=memberPwd1]');
        const memberPwd2 = document.querySelector('input[name=memberPwd2]');
        
    </script>
</body>
</html>