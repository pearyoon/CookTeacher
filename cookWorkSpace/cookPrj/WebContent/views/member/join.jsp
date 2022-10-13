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
                <form action="" method="post">
                    <div class="join-items">
                        <div>
                            <label for="member_id">아이디</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_id" type="text" name="memberId" placeholder="아이디를 입력해주세요.">
                            </div>
                            <div id="hidden-id">
                                <p>6자 이상 16자 이하의 영문 혹은 영문과 숫자 조합</p>
                            </div>
                        </div>
                        <div>
                            <button>중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="member_pwd1">비밀번호</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_pwd1" type="password" name="memberPwd1" placeholder="비밀번호를 한번 더 입력해주세요.">
                            </div>
                            <div id="hidden-pwd1">
                                <p>최소 8자 이상</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="member_pwd2">비밀번호 확인</label>
                        </div> 
                        <div>
                            <div class="input-area">
                                <input id="member_pwd2" type="password" name="memberPwd2" placeholder="비밀번호를 한번 더 입력해주세요.">
                            </div>
                            <div id="hidden-pwd2">
                                <p>비밀번호를 한번 더 입력해주세요.</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="member_name">이름</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_name" type="text" name="memberName" placeholder="이름을 입력해주세요.">
                            </div>
                            <div id="hidden-name">
                                <p>이름을 입력해주세요.</p>
                            </div>

                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="member_nick">닉네임</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_nick" type="text" name="memberNick" placeholder="닉네임을 입력해주세요.">
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
                            <label for="member_email">이메일</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_email" type="text" name="email" placeholder="이메일을 입력해주세요.">
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
                            <label for="member_phone">휴대폰</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="member_phone" type="text" name="phone" placeholder="숫자만입력해주세요.">
                            </div>
                            <div id="hidden-phone">
                                <p>휴대폰 번호를 입력해주세요.</p>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label>주소</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input type="text" type="text" name="addr" placeholder="주소를 입력해주세요.">
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
</body>
</html>