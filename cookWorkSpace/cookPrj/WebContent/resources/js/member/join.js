
    	
// 아이디 유효성 체크
const memberId = document.querySelector('input[name=memberId]');

memberId.addEventListener("keyup" ,()=>{
    
    const inputId = memberId.value;
    const idReg = /^[a-z]+[a-z0-9]{5,19}$/g;

    if(!idReg.test(inputId)){
        document.querySelector('#hidden-id').innerHTML = '영문 숫자 조합의 6자 이상  20자 이하';
        
        return false;
    
    } else if(inputId == "") {
        document.querySelector('#hidden-id').innerHTML = '아이디를 입력해주세요.';
    
    } else {
        document.querySelector('#hidden-id').innerHTML = '';
        
        return true;
    }

});

// 비밀번호 유효성 체크
const memberPwd1 = document.querySelector('input[name=memberPwd1]');


memberPwd1.addEventListener("keyup",()=>{
    const inputPwd1 = memberPwd1.value;
    const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

    if(!pwdReg.test(inputPwd1)){
        document.querySelector('#hidden-pwd1').innerHTML = '영문 숫자 특수문자 조합의 8자 이상';
        
        return false;
    } else if(inputPwd1.length == 0) {
        document.querySelector('#hidden-pwd1').innerHTML = '비밀번호를 입력해주세요.';
    } else{
        document.querySelector('#hidden-pwd1').innerHTML = '';
        
        return true;
    }
});

// 비밀번호 확인 유효성 체크
const memberPwd2 = document.querySelector('input[name=memberPwd2]');

memberPwd2.addEventListener("keyup", ()=>{
    const inputPwd2 = memberPwd2.value;
    const inputPwd = memberPwd1.value;
   
    if(inputPwd2 == ""){
        document.querySelector('#hidden-pwd2').innerHTML = "비밀번호를 한번 더 입력해주세요.";

        return false;
    } else if(inputPwd2 != inputPwd){
        document.querySelector('#hidden-pwd2').innerHTML = "비밀번호가 불일치합니다.";

        return false;
    } else{
        document.querySelector('#hidden-pwd2').innerHTML = '';

        return true;
    }
});

// 이름 유효성 체크
const memberName = document.querySelector('input[name=memberName]');

memberName.addEventListener("keyup",()=>{
    const inputName = memberName.value

    if(inputName == ""){
        document.querySelector("#hidden-name").innerHTML = "이름을 입력해주세요.";
        return false;
    } else{
        document.querySelector("#hidden-name").innerHTML = '';
        return true;
    }
});

// 닉네임
const memberNick = document.querySelector('input[name=memberNick]');

memberNick.addEventListener("keyup",()=>{
    const inputNick = memberNick.value

    if(inputNick == ""){
        document.querySelector("#hidden-nick").innerHTML = "닉네임을 입력해주세요.";
        return false;
    } else{
        document.querySelector("#hidden-nick").innerHTML = '';
        return true;
    }
});

// 이메일
const email = document.querySelector('input[name=email]');
email.addEventListener('keyup',()=>{
    const inputEmail = email.value;
    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if(!emailReg.test(inputEmail)){
        document.querySelector("#hidden-email").innerHTML = "이메일 형식을 맞춰주세요.";
        return false;
    } else if(inputEmail == ''){
        document.querySelector("#hidden-email").innerHTML = "이메일을 입력해주세요.";
        return false;
    } else{
        document.querySelector("#hidden-email").innerHTML = "";
        return true;
    }

});


// 휴대폰 하이픈 추가
const autoHyphen = (target) => {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

// 휴대폰 정규식
const phone = document.querySelector("input[name=phone]");

phone.addEventListener('keyup',()=>{
    const inputPhone = phone.value;
    const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
    
    if(!phoneReg.test(inputPhone)){
        document.querySelector('#hidden-phone').innerHTML = '휴대폰 번호를 입력해주세요.';
        return false;
    } else if(inputPhone == "") {
        document.querySelector('#hidden-phone').innerHTML = '휴대폰 번호를 입력해주세요.';
        return false;
    } else{
        document.querySelector('#hidden-phone').innerHTML = '';
        return true;
    }
});

const addr = document.querySelector('input[name=addr]');

addr.addEventListener('keyup',()=>{
    const inputAddr = addr.value;            
    
    if(inputAddr == ""){
        document.querySelector('#hidden-addr').innerHTML = '주소를 입력해주세요.';
        return false;
    } else{
        document.querySelector('#hidden-addr').innerHTML = '';
        return true;
    }
});

function check(){
    
}
