
    	
// 아이디 유효성 체크
const memberId = document.querySelector('input[name=memberId]');
let idck = false;
memberId.addEventListener("keyup" ,()=>{
    idck = false;
    const inputId = memberId.value;
    const idReg = /^[a-z]+[a-z0-9]{5,19}$/g;

    $('#dupId-btn').attr('disabled',false);
    $('#dupId-btn').addClass('non-check');
    $('#dupId-btn').removeClass('check');

    if(!idReg.test(inputId)){
        document.querySelector('#hidden-id').innerHTML = '영문 숫자 조합의 6자 이상  20자 이하';
    
    } else if(inputId == "") {
        document.querySelector('#hidden-id').innerHTML = '아이디를 입력해주세요.';
    
    } else {
        document.querySelector('#hidden-id').innerHTML = '';
    }

});

// 비밀번호 유효성 체크
const memberPwd1 = document.querySelector('input[name=memberPwd1]');
let pwd1ck = false;
memberPwd1.addEventListener("keyup",()=>{
    const inputPwd1 = memberPwd1.value;
    const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

    if(!pwdReg.test(inputPwd1)){
        document.querySelector('#hidden-pwd1').innerHTML = '영문 숫자 특수문자 조합의 8자 이상';
    } else if(inputPwd1.length == 0) {
        document.querySelector('#hidden-pwd1').innerHTML = '비밀번호를 입력해주세요.';
    } else{
        document.querySelector('#hidden-pwd1').innerHTML = '';
        
        pwd1ck = true;
    }
});

// 비밀번호 확인 유효성 체크
const memberPwd2 = document.querySelector('input[name=memberPwd2]');
let pwd2ck = false;
memberPwd2.addEventListener("keyup", ()=>{
    const inputPwd2 = memberPwd2.value;
    const inputPwd = memberPwd1.value;
   
    if(inputPwd2 == ""){
        document.querySelector('#hidden-pwd2').innerHTML = "비밀번호를 한번 더 입력해주세요.";

    } else if(inputPwd2 != inputPwd){
        document.querySelector('#hidden-pwd2').innerHTML = "비밀번호가 불일치합니다.";

    } else{
        document.querySelector('#hidden-pwd2').innerHTML = '';

        pwd2ck = true;
    }
});

// 이름 유효성 체크
const memberName = document.querySelector('input[name=memberName]');
let nameck = false;
memberName.addEventListener("keyup",()=>{

    const inputName = memberName.value


    if(inputName == ""){
        document.querySelector("#hidden-name").innerHTML = "이름을 입력해주세요.";
    } else{
        document.querySelector("#hidden-name").innerHTML = '';
        nameck = true;
    }
});

// 닉네임
let nickck = false;
const memberNick = document.querySelector('input[name=memberNick]');
memberNick.addEventListener("keyup",()=>{

    $('#dupNick-btn').attr('disabled',false);
    $('#dupNick-btn').addClass('non-check');
    $('#dupNick-btn').removeClass('check');
    nickck = false;
    const inputNick = memberNick.value

    if(inputNick == ""){
        document.querySelector("#hidden-nick").innerHTML = "닉네임을 입력해주세요.";
    } else if(inputNick >= 2){
        document.querySelector("#hidden-nick").innerHTML = '닉네임은 2자 이상 입력해주세요.';
    } else{
        document.querySelector("#hidden-nick").innerHTML = '';
    }
});

// 이메일
const email = document.querySelector('input[name=email]');
let emailck = false;
email.addEventListener('keyup',()=>{

    $('#dupEmail-btn').attr('disabled',false);
    $('#dupEmail-btn').addClass('non-check');
    $('#dupEmail-btn').removeClass('check');
    emailck = false;
    const inputEmail = email.value;
    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if(!emailReg.test(inputEmail)){
        document.querySelector("#hidden-email").innerHTML = "이메일 형식을 맞춰주세요.";
    } else if(inputEmail == ''){
        document.querySelector("#hidden-email").innerHTML = "이메일을 입력해주세요.";
    } else{
        document.querySelector("#hidden-email").innerHTML = "";
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
let phoneck = false;
phone.addEventListener('keyup',()=>{
    const inputPhone = phone.value;
    const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;
    
    if(!phoneReg.test(inputPhone)){
        document.querySelector('#hidden-phone').innerHTML = '휴대폰 번호를 입력해주세요.';
    } else if(inputPhone == "") {
        document.querySelector('#hidden-phone').innerHTML = '휴대폰 번호를 입력해주세요.';
    } else{
        document.querySelector('#hidden-phone').innerHTML = '';
        phoneck = true;
    }
});

const addr = document.querySelector('input[name=addr]');
let addrck = false;
addr.addEventListener('keyup',()=>{
    const inputAddr = addr.value;            
    
    if(inputAddr == ""){
        document.querySelector('#hidden-addr').innerHTML = '주소를 입력해주세요.';
    } else{
        document.querySelector('#hidden-addr').innerHTML = '';
        addrck = true;
    }
});

// 중복확인 검사
// 아이디

function checkId(){
    let inputId = $('#memberId').val();

	if(inputId.length >= 6){
		
		    $.ajax({
		        url : "/cookTeacher/member/join/dupCheck/id" ,
		        method : "POST" ,
		        data : {"inputId" : inputId},
		        success : function(result) {
					console.log(result);
		            if(result == 0){
						$('#dupId-btn').addClass('check');
                        $('#dupId-btn').attr('disabled',true);
                        $('#dupId-btn').removeClass('non-check');
		                alert("사용 가능한 아이디입니다.");
		                idck = true;
		            } else{
		                alert("중복 아이디입니다.");
		                $('#memberId').val("");
		            }
		        } ,
		        error : function() {
		            alert('ajax ::: 서버 연결 중 에러');
		        }
		
		    });
	
	}	else{
		alert("영문 숫자 조합의 6자 이상 20자 이하의 아이디를 입력해주세요.");
	}

}



// 닉네임

function checkNick(){
    let inputNick = $('#memberNick').val();
    
    if(inputNick.length >= 2){
        $.ajax({
			url : "/cookTeacher/member/join/dupCheck/nick",
			method : "POST",
			data : {"inputNick" : inputNick},
			success : function(result){
				if(result == 0){
					$('#dupNick-btn').addClass('check');
                    $('#dupNick-btn').attr('disabled',true);
                    $('#dupNick-btn').removeClass('non-check');
					alert("사용 가능한 닉네임입니다.");
					nickck = true;
				} else{
					alert("중복 닉네임입니다.");
					$("#inputNick").val("");
				}
			},
			error : function() {
				alert('ajax ::: 서버 연결 중 에러');
			}
		});

    }else{
        alert("2자 이상의 닉네임을 입력해주세요.");
    }

}

// 이메일


function checkEmail(){
    let inputEmail = $('#email').val();
    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if(emailReg.test(inputEmail)){
        
        $.ajax({
            url : "/cookTeacher/member/join/dupCheck/email",
            method : "POST",
            data : {"inputEmail" : inputEmail},
            success : function(result){
                if(result==0){
                    $('#dupEmail-btn').addClass('check');
                    $('#dupEmail-btn').attr('disabled',true);
                    $('#dupEmail-btn').removeClass('non-check');
					alert("사용 가능한 이메일입니다.");
					emailck = true;

                }else{
					alert("사용 불가능한 이메일입니다.");
					$("#email").val("");
                }
            },
            error : function() {
                alert('ajax ::: 서버 연결 중 에러');
            }
        });
  
    }else{
        alert("이메일 형식을 맞춰주세요.");
    }
}



// 찐 유효성 검사
function checkJoin(){
    if(!idck){
		alert("아이디 중복확인을 해주세요.");
        return false;
    }
    
    if(!pwd1ck){
        alert("비밀번호는 영문 숫자 특수문자 조합의 8자이상입니다.");
		return false;
	}

    if(!pwd2ck){
        alert("비밀번호가 불일치합니다.");
        return false;
    }

    if(!nameck){
        alert("이름을 입력해주세요.");
        return false;
    }

    if(!nickck){
        alert("닉네임 중복확인을 해주세요.");
        return false;
    }

    if(!emailck){
        alert("이메일 중복확인을 해주세요.");
        return false;
    }

    if(!phoneck){
        alert("휴대폰 번호를 입력해주세요.");
        return false;
    }

    if(!addrck){
        alert("주소를 입력해주세요.");
        return false;
    }
    
    return true;
};



