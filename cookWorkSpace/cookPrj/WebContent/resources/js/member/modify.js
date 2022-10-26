let nick = $('#memberNick').val();
let email = $('#email').val();

// 아래 경고문
// 비밀번호
let pwd1ck = true;
$('#memberPwd1').keyup(function(){
    const pwdReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    const memberPwd1 = $('#memberPwd1').val();


    if(!pwdReg.test(memberPwd1)){
        $('#hidden-pwd1').text('영문 숫자 특수문자 조합의 8자 이상');
        pwd1ck = false;

    } else{
        $('#hidden-pwd1').text('');
        pwd1ck = true;
    }

});


// 비밀번호 확인
let pwd2ck = true;
$('#memberPwd2').keyup(function(){
    const memberPwd1 = $('#memberPwd1').val();
    const memberPwd2 = $('#memberPwd2').val();
  
    if(memberPwd1 != memberPwd2){
        $('#hidden-pwd2').text('동일한 비밀번호를 입력해주세요.');
        pwd2ck = false;
    } else{
        $('#hidden-pwd2').text('');
        pwd2ck = true;
    }
});

// 닉네임
let nickck = true;
$('#memberNick').keyup(function(){
    const memberNick = $('#memberNick').val();

    if(memberNick.length < 2){
        $('#hidden-nick').text('닉네임을 입력해주세요.');
        nickck = false;
    } else {
        $('#hidden-nick').text('');
    }


});

// 이메일
let emailck = true;
$('#email').keyup(function(){
    const memberEmail = $('#email').val();
    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;


    if(!emailReg.test(memberEmail)){
        $('#hidden-email').text('이메일의 형식을 맞춰주세요.');
        emailck = false;
    } else if(memberEmail == ""){
        $('#hidden-email').text('이메일을 입력해주세요.');
        emailck = false;
    } else{
        $('#hidden-email').text('');
    }
});

// 휴대폰
const autoHyphen = (target) => {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
};

let phoneck = true;
$('#phone').keyup(function(){
    const phone = $('#phone').val();
    const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/;

    if(!phoneReg.test(phone)){
        $('#hidden-phone').text('휴대폰 번호를 입력해주세요.');
        phoneck = false;
    } else{
        $('#hidden-phone').text('');
        phoneck = true;
    }
});


// 버튼 효과
// 닉네임
$('#memberNick').keyup(function(){
    const memberNick = $('#memberNick').val();

    if(nick == memberNick){
        $('#dupNick-btn').removeClass('check');
        $('#dupNick-btn').attr('disabled',true);
        $('#dupNick-btn').addClass('non-check');
        nickck = true;
    } else{
        $('#dupNick-btn').addClass('check');
        $('#dupNick-btn').attr('disabled',false);
        $('#dupNick-btn').removeClass('non-check');
        nickck = false;
    }
});  
// 이메일
$('#email').keyup(function(){
    const memberEmail = $('#email').val();

    if(email == memberEmail){
        $('#dupEmail-btn').removeClass('check');
        $('#dupEmail-btn').attr('disabled',true);
        $('#dupEmail-btn').addClass('non-check');
        emailck = true;
    } else{
        $('#dupEmail-btn').addClass('check');
        $('#dupEmail-btn').attr('disabled',false);
        $('#dupEmail-btn').removeClass('non-check');
        emailck = false;
    }
});  

// 중복확인

function checkNick(){
    let inputNick = $('#memberNick').val();
    
    if(inputNick.length >= 2){
        $.ajax({
			url : "/cookTeacher/member/join/dupCheck/nick",
			method : "POST",
			data : {"inputNick" : inputNick},
			success : function(result){
				if(result == 0){

                    $('#dupNick-btn').removeClass('check');
                    $('#dupNick-btn').attr('disabled',true);
                    $('#dupNick-btn').addClass('non-check');
            
                    Swal.fire({
                        icon: 'success',
                        text: '사용 가능한 닉네임입니다.',
                      });
					nickck = true;
				} else{
                    Swal.fire({
                        icon: 'error',
                        text: '중복 닉네임입니다.',
                      });
					$("#inputNick").val("");
                    nickck = false;
				}
			},
			error : function() {
				alert('ajax ::: 서버 연결 중 에러');
                nickck = false;
			}
		});

    }else{
        Swal.fire({
            icon: 'error',
            text: '2자 이상의 닉네임을 입력해주세요.',
          });
        nickck = false;
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

                    $('#dupEmail-btn').removeClass('check');
                    $('#dupEmail-btn').attr('disabled',true);
                    $('#dupEmail-btn').addClass('non-check');
                    
                    Swal.fire({
                        icon: 'success',
                        text: '사용 가능한 이메일입니다.',
                      });
					emailck = true;

                }else{
                    Swal.fire({
                        icon: 'error',
                        text: '사용 불가능한 이메일입니다.',
                      });
					$("#email").val("");
                    emailck = false;
                }
            },
            error : function() {
                alert('ajax ::: 서버 연결 중 에러');
                emailck = false;
            }
        });
  
    }else{
        Swal.fire({
            icon: 'error',
            text: '이메일의 형식을 맞춰주세요.',
          });
        emailck = false;
    }
}

let addrck = true;
// 주소api
function searchAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            $('#addr').val(data.address);
            $('#detailAddr').val("");
            $('#detailAddr').attr('readonly', false);
            addrck = false;
        }
    }).open();
}


$('#detailAddr').keyup(function(){
    const detailAddr = $('#detailAddr').val();
    if(detailAddr.length < 2){
        $('#hidden-detailAddr').text('상세주소를 입력해주세요.');
        addrck = false;
        
    } else{
        $('#hidden-detailAddr').text('');
        addrck = true;
    }
});


function checkModify(){
    if(!pwd1ck){
        Swal.fire({
            icon: 'error',
            text: '비밀번호는 영문 숫자 특수문자 조합의 8자 이상입니다.',
          });
		return false;
	}

    if(!pwd2ck){
        Swal.fire({
            icon: 'error',
            text: '비밀번호가 불일치합니다.',
          });
        return false;
    }
    
    if(!nickck){
        Swal.fire({
            icon: 'error',
            text: '닉네임을 입력해주세요.',
          });
        return false;
    }

    if(!emailck){
        Swal.fire({
            icon: 'error',
            text: '이메일 중복확인을 해주세요.',
          });
        return false;
    }

    if(!phoneck){
        Swal.fire({
            icon: 'error',
            text: '휴대폰 번호를 입력해주세요.',
          });
        return false;
    }

    if(!addrck){
        Swal.fire({
            icon: 'error',
            text: '주소를 입력해주세요.',
          });
        return false;
    }
    

    return true;
}
