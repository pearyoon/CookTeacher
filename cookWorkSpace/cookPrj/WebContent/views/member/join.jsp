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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" defer src="/cookTeacher/resources/js/member/join.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                
                <form action="/cookTeacher/member/join" method="post" onsubmit="return checkJoin()">
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
                            <button id="dupId-btn" class="non-check" type="button" onclick="checkId();">중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberPwd1">비밀번호</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberPwd1" type="password" name="memberPwd1" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <div>
                                <p id="hidden-pwd1"></p>
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
                            <div>
                                <p id="hidden-pwd2"></p>
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
                            <div>
                                <p id="hidden-name"></p>
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
                            <div>
                                <p id="hidden-nick"></p>
                            </div>

                        </div>
                        <div>
                            <button id="dupNick-btn" class="non-check" type="button" onclick="checkNick();" >중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="email">이메일</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="email" type="text" name="email" placeholder="예 : cook@teacher.com">
                            </div>
                            <div>
                                <p id="hidden-email"></p>
                            </div>

                        </div>
                        <div>
                            <button id="dupEmail-btn" class="non-check" type="button" onclick="checkEmail();">중복확인</button>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="phone">휴대폰</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="phone" type="text" name="phone" placeholder="숫자만 입력해주세요." oninput="autoHyphen(this)" maxlength="13" >
                            </div>
                            <div>
                                <p id="hidden-phone"></p>
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
                                <input id="addr" type="text" type="text" name="addr" placeholder="주소를 입력해주세요." readonly>
                            </div>
                            <div>
                                <p id="hidden-addr"></p>
                            </div>
                        </div>
                        <div>
                            <button id="search-addr" type="button" onclick="searchAddr();">주소 검색</button>
                        </div>
                    </div>
                    <div class="join-items hidden">
                        <div></div>
                        <div>
                            <div class="input-area">
                                <input id="detailAddr" type="text" type="text" name="detailAddr" placeholder="나머지 주소를 입력해주세요.">
                            </div>
                            <div>
                                <p id="hidden-detailAddr"></p>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <div id="join-btn">
                        <div>
                            <button type="submit">가입하기</button>
                        </div>
                    </div>
                </form>
            </div>

    
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    
  
</body>
</html>