<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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