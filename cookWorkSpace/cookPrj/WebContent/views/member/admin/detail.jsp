<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 회원가입</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/admin/detail.css">
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
            

            <div>
                <div>탈퇴 : ${vo.quitYn}</div> 
            </div>

          
            <div id="join-top">
                
                <form action="" method="post" onsubmit="return checkEdit()">
                    <div class="join-items">
                        <div>
                            <label for="enrollDate">가입일</label> 
                        </div>
                        <div class="input-area">
                            <input id="enrollDate" type="text" name="enrollDate" value="${vo.enrollDate}" readonly>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberId">아이디</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberId" type="text" name="memberId" value="${vo.id }" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberName">이름</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberName" class="focus" type="text" name="memberName" value="${vo.name }">
                            </div>
                        </div>

                    </div>
                    <div class="join-items">
                        <div>
                            <label for="memberNick">닉네임</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="memberNick" type="text" name="memberNick" value="${vo.nick }" readonly>
                            </div>

                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="email">이메일</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="email" type="text" name="email" value="${vo.email }" readonly>
                            </div>

                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="point">포인트</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <input id="point" class="focus" type="text" name="point" value="${vo.point }">
                            </div>
                        </div>
                    </div>
                    <div class="join-items">
                        <div>
                            <label for="grade">등급</label>
                        </div>
                        <div>
                            <div class="input-area">
                                <select name="grade" id="grade">
                                    <option value="1" class="option">일반</option>
                                    <option value="2" class="option">화이트</option>
                                    <option value="3" class="option">그린</option>
                                </select>
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
        
        function checkEdit(){
        	const pwd1 = $('#memberPwd1').val();
        	const pwd2 = '${loginMember.pwd}';
        	
        	if(pwd1 != pwd2){
        		return false;
        	}
        	
        	return true;
        }

        const gradeArr = $('.option');
        let grade = '${vo.grade}';

        console.log(gradeArr);
        for(let i = 0; i < gradeArr.length; i++){
            const check = gradeArr[i].value;
            
            if(check == grade){
                gradeArr[i].selected = true;
            }
           
        }
    </script>
  
</body>
</html>