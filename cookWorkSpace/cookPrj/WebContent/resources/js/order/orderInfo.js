// 주소api
function searchAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            $('#addr').val(data.address);
            $('#detailAddr').val("");
            $('#detailAddr').attr('readonly', false);
        }
    }).open();
}

function clickPoint(){
  const usedPoint = document.querySelector('input[name=save-point]').value
    if(usedPoint <= point){
        document.querySelector('.price>.usePoint').innerHTML = usedPoint + 'P'
        document.querySelector('input[name=usePoint]').value = usedPoint
    
        document.querySelector('label[for=point]').innerHTML = '포인트 ' + (point - parseInt(usedPoint)) + 'P';
        document.querySelector('.sum-amt>strong').innerHTML = (totalPrice + deliveryFee - parseInt(usedPoint)).toLocaleString();
    }
}

// 결제하기
// function checkOut() {
//   const cartList = document.querySelectorAll('input[name=prodNo]');
//   const prodNoList = [];

//   for(let i = 0; i < cartList.length; i++){
//     prodNoList.push(cartList[i].value);
//   }
  
//   const point = document.querySelector('input[name=save-point]').value

//   $.ajax({
//     method: "POST",
//     url:"/cookTeacher/order/success",
//     traditional: true,
//     data: {
//       check : prodNoList,
//       point : point
//     },

//   })

// }

var IMP = window.IMP; // 생략 가능
IMP.init("imp06204768"); // 예: imp00000000


    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              url: "/order/success"
          } else {
             alert("에러");
          }
      });
    }

    IMP.request_pay({
        /* ...중략... */
      }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
          // jQuery로 HTTP 요청
          jQuery.ajax({
              url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
              method: "POST",
              headers: { "Content-Type": "application/json" },
              data: {
                  imp_uid: rsp.imp_uid,
                  merchant_uid: rsp.merchant_uid
              }
          }).done(function (data) {
            // 가맹점 서버 결제 API 성공시 로직
          })
        } else {
          alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
      });

  