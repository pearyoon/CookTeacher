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

<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/check.css">

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
                                <a href="${root}/mypage/member/check">
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
							    <form action="" method="post">
							        <div id="check-area">
							            <div class="check-flex">
							                <div>
							                    <label for="userId">아이디</label>
							                </div>
							                <div>
							                    <input type="text" id="userId" name="userId" value="cook1015" readonly>
							                </div>
							                <div></div>
							            </div>
							            <div class="check-flex">
							                <div>
							                    <label for="userPwd">비밀번호</label>
							                </div>
							                <div>
							                    <input type="password" id="userPwd" name="userPwd">
							                </div>
							                <div></div>
							            </div>
							        </div>
							        <div id="check-btn">
							            <button>
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


    </script>
</body>
</html>