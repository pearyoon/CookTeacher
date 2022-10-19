<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="modify-wrap">
    <form action="" method="post">
        <div class="modify-items">
            <div>
                <label for="userId">아이디</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="text" id="userId" name="userId" readonly value="cook1015">
                </div>
                <div></div>
            </div>
            <div></div>
        </div>
        <div class="modify-items">
            <div>
                <label for="newPwd">새 비밀번호</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="password" id="newPwd" name="newPwd" placeholder="비밀번호를 입력해주세요.">
                </div>
                <div>
                    <p>10자 이상 입력</p>
                </div>
            </div>
            <div></div>
        </div>
        <div class="modify-items">
            <div>
                <label for="newPwd2">새 비밀번호 확인</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="password" id="newPwd2" name="newPwd2" placeholder="비밀번호를 한번 더 입력해주세요.">
                </div>
                <div>
                    <p>동일한 비밀번호를 입력해주세요.</p>
                </div>
            </div>
            <div>

            </div>
        </div>
        <div class="modify-items">
            <div>
                <label for="userName">이름</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="text" id="userName" name="userName" readonly value="쿡선생">
                </div>
                <div></div>
            </div>
            <div></div>
        </div>
        <div class="modify-items">
            <div>
                <label for="userNick">닉네임</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="text" id="userNick" name="userNick" placeholder="닉네임을 입력해주세요." value="쿡선생">
                </div>
                <div>
                    <p>닉네임을 입력해주세요.</p>
                </div>
            </div>
            <div>
                <button>
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
                    <input type="text" id="email" name="email" placeholder="닉네임을 입력해주세요." value="쿡선생">
                </div>
                <div>
                    <p>이메일을 입력해주세요.</p>
                </div>
            </div>
            <div>
                <button>
                    <span>중복확인</span>
                </button>
            </div>
        </div>
        <div class="modify-items">
            <div>
                <label for="newPwd">휴대폰</label>
            </div>
            <div class="input-wrap">
                <div>
                    <input type="text" id="phone" name="phone" placeholder="숫자만 입력해주세요." value="01012345678">
                </div>
                <div>
                    <p>번호 11자만 입력해주세요.</p>
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
                    <input type="text" id="addr" name="addr" placeholder="주소를 입력해주세요." value="서울시 강남구 역삼동 테헤란로">
                </div>
                <div>
                    <p>주소를 입력해주세요.</p>
                </div>
            </div>
            <div>
                <button>
                    <span>주소검색</span>
                </button>
            </div>
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