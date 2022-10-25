<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="/cookTeacher/resources/css/member/mypage/check.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="mypage-area">
                <div id="mypage-left">
                    <h2 id="tit-aticle">마이쿡</h2>
                    <div id="inner">
                        <ul id="list-menu">
                            <li class="non-clcik">
                                <a href="<%=root%>/login/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <h2 id="head-aticle">
                        회원정보
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">


							<div id="check-wrap">
							    <h4>비밀번호 재확인</h4>
							    <p>회원님의 정보를 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
							    <form action="/cookTeacher/login/mypage/member/check" method="post" onsubmit="return checkLogin();">
							        <div id="check-area">
							            <div class="check-flex">
							                <div>
							                    <label for="memberId">아이디</label>
							                </div>
							                <div>
							                    <input type="text" id="memberId" name="memberId" value="${loginMember.id}" readonly>
							                </div>
							                <div></div>
							            </div>
							            <div class="check-flex">
							                <div>
							                    <label for="memberPwd">비밀번호</label>
							                </div>
							                <div>
							                    <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요.">
							                </div>
							                <div></div>
							            </div>
							        </div>
							        <div id="check-btn">
                                        <button type="button" onclick="loginCheck();">
                                            <span>확인</span> 
                                        </button> 
							        </div>
							    </form>
							</div>



                      </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
	<script>
      function checkLogin(){
    	  const memberPwd = $().val();
      };

    </script>
</body>
</html>