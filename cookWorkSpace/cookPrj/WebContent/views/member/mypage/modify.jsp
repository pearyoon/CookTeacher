<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/mypage/modify.css">

<script type="text/javascript" defer src="/cookTeacher/resources/js/member/modify.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

							
						<div id="modify-wrap">
						    <form action="<%=root %>/login/mypage/member/modify" method="post" onsubmit="return checkModify()">
						        <div class="modify-items">
						            <div>
						                <label for="memberId">아이디</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="memberId" name="memberId" readonly value="${loginMember.id}">
						                </div>
						                <div></div>
						            </div>
						            <div></div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="memberPwd">새 비밀번호</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="password" id="memberPwd1" class="focus" name="memberPwd1" placeholder="비밀번호를 입력해주세요.">
						                </div>
						                <div>
						                    <p id="hidden-pwd1"></p>
						                </div>
						            </div>
						            <div></div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="memberPwd2">새 비밀번호 확인</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="password" id="memberPwd2" class="focus" name="memberPwd2" placeholder="비밀번호를 한번 더 입력해주세요.">
						                </div>
						                <div>
						                    <p id="hidden-pwd2"></p>
						                </div>
						            </div>
						            <div>
						
						            </div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="memberName">이름</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="memberName" name="memberName" readonly value="${loginMember.name}">
						                </div>
						                <div></div>
						            </div>
						            <div></div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="memberNick">닉네임</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="memberNick" class="focus" name="memberNick" placeholder="닉네임을 입력해주세요." value="${loginMember.nick}">
						                </div>
						                <div>
						                    <p id="hidden-nick"></p>
						                </div>
						            </div>
						            <div>
										<button id="dupNick-btn" class="non-check" type="button" onclick="checkNick();" disabled>
											<span>중복확인</span>
										</button>
						            </div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="email">이메일</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="email" class="focus" name="email" placeholder="메일을 입력해주세요." value="${loginMember.email}">
						                </div>
						                <div>
						                    <p id="hidden-email"></p>
						                </div>
						            </div>
						            <div>
										<button id="dupEmail-btn" class="non-check" type="button" onclick="checkEmail();" disabled>
											<span>중복확인</span>
										</button>
						            </div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="phone">휴대폰</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="phone" class="focus" name="phone" placeholder="숫자만 입력해주세요." oninput="autoHyphen(this)"  value="${loginMember.phone}" maxlength="13" >
						                </div>
						                <div>
						                    <p id="hidden-phone"></p>
						                </div>
						            </div>
						            <div></div>
						        </div>
						        <div class="modify-items">
						            <div>
						                <label for="addr">주소</label>
						            </div>
						            <div class="input-wrap">
						                <div>
						                    <input type="text" id="addr" class="focus" name="addr" placeholder="주소를 입력해주세요." value="${loginMember.addr}" readonly>
						                </div>
						                <div>
						                    <p id="hidden-addr"></p>
						                </div>
						            </div>
						            <div>
										<button id="searchAddr-btn" type="button" onclick="searchAddr();">
											<span>주소검색</span>
										</button>
						            </div>
						        </div>
								<div class="modify-items">
									<div></div>
									<div class="input-wrap">
										<div>
											<input type="text" id="detailAddr" class="focus" name="detailAddr" placeholder="나머지 주소를 입력해주세요." value="${loginMember.detailAddr}" readonly>
										</div>
										<div>
											<p id="hidden-detailAddr"></p>
										</div>
									</div>
									<div></div>
								</div>
						        <div id="btn">
						            <button id="quit" type="button">
						                <span>탈퇴하기</span>
						            </button>
						            <button id="edit" type="submit">
						                <span>회원정보수정</span>
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
</body>
</html> 
    
