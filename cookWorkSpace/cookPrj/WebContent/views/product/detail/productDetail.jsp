<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");
	List<ReviewVo> rvoList = (List<ReviewVo>)request.getAttribute("rvoList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 쇼핑</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 수량 버튼 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="./10-11.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/product/productDetail.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.swal2-icon.swal2-question.swal2-icon-show {
    animation: swal2-animate-error-icon .5s;
    border: .25em solid rgba(165,220,134,.3);
}
.swal2-icon.swal2-question.swal2-icon-show .swal2-icon-content {
    animation: swal2-animate-question-mark .8s;
    color: #a4db86;
}
.swal2-styled.swal2-confirm {
    border: 0;
    border-radius: 10px;
    background: initial;
    background-color: #7066e0;
    color: #fff;
    font-size: 1em;
}
</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <form id="cartGogosing" action="/cookTeacher/cart/add" method="post" onsubmit="return addCart();">
            <div id="main-middle">
            <hr><br><br>
                <div id="product-name"></div>
                    <div id="main-menu-area">
                    <input type="hidden" name="prodNo" value="<%=vo.getProdNo() %>">
                        <div id="product-main-img/product">
                            <img/product src="/cookTeacher/upload/img/<%= vo.getImgPath()%>" alt="레시피게시판담당" width="120%" height="100%">
                        </div>
                        <div class="outer">
                            <div class="inner" id="real-name">
                                [&nbsp;<%= vo.getName() %>&nbsp;]
                            </div>
                            <div class="inner">
                            <img src="/cookTeacher/resources/img/checked.png" style="height:20px; width:20px">
                                &nbsp;원산지 :
                            </div>
                            <div class="inner">
                            <img src="/cookTeacher/resources/img/checked.png" style="height:20px; width:20px">
                                &nbsp;중량 :
                            </div>
                            <div class="inner">
                            <img src="/cookTeacher/resources/img/checked.png" style="height:20px; width:20px">
                                &nbsp;가격 :
                            </div>
                            <div class="inner">
                            <img src="/cookTeacher/resources/img/checked.png" style="height:20px; width:20px">
                                &nbsp;재고 :
                            </div>
                            <div class="inner">
                            <img src="/cookTeacher/resources/img/checked.png" style="height:20px; width:20px">
                                &nbsp;구매 수량 :
                            </div>
                            <!-- <div class="inner">
                                합계
                            </div> -->
                            <div class="inner">
                            <!-- 구매하기 버튼 위치 -->
                            
                            </div>

                        </div>
                        <div class="outer2">
                            <div class="inner">
                            
                            </div>
                            <div class="inner">
                                국내산
                            </div>
                            <div class="inner">
                                <%= vo.getWeight() %>
                            </div>
                            <div class="inner">
                                <form name="orderform" id="orderform" method="post" class="orderform" onsubmit="return false;">
                                    <input type="hidden" name="cmd" value="order">
                                        <div class="row data">
                                            <div class="subdiv">
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%= formatter.format(Integer.parseInt(vo.getPrice())) %>"><%= formatter.format(Integer.parseInt(vo.getPrice())) %>원</div>
                                                <div class="num">
                                                
                                                    <!-- <div class="updown">
                                                    <br><br><br>
                                                        <input type="text" name="p_num1" id="p_num1" size="3" maxlength="3" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);">
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <br><br><br>
                                                    </div>  -->
                                                    <br><br><br>
                                                    <div class="inner">
						                                <%= vo.getStock() %>
						                            </div>
                                                   <br><br><br>
                                                    <div class="updown">
                                                    <input type="number" name="cnt" id="p_num1" style="width: 45px;" class="p_num" value="1" min="1" max="1000" onkeyup="javascript:basket.changePNum(1);" style="width: 35px; margin-bottom: 35px ">
                                                    </div>
                                                </div>
                                                <%-- <div class="sum" name="totalSum"><br><%= vo.getPrice() %>원</div> --%>
                                            </div>
                                        </div>
                                </form>
                            </div>
                            <br><br><br><br><br><br><br><br>
                            <div class="inner">
                            	<!-- <form action="/cookTeacher/cart/list" method="get"> -->
                            		<input type="submit" onclick="addCart();" class="cart-button css-1qirdbn e4nu7ef3" radius="3" value="장바구니 담기">
                            	</form>
			                  <script type="text/javascript">
								function addCart(){
									if("${vo.stock}"=="0"){
										Swal.fire('⛔️재고가 없습니다.⛔️')
										return false;
									}
									const cnt = $("#p_num1").val();
									const stock = "${vo.stock}";
									console.log(stock);
									if(stock<cnt){
										Swal.fire('재고수량 이상을 담을 수 없습니다.')
										return false;
									}
					                Swal.fire({
					                  title: '장바구니에 담으시겠습니까?',
					                  icon: 'question',
					                  showCancelButton: true,
					                  confirmButtonColor: '#255D00',
									  cancelButtonColor: '#FFD335',
					                  confirmButtonText: '네',
					                  cancelButtonText: '아니오',
					                  })
					                  .then((result)=>{
					                      console.log(result);
					                      if (result.isConfirmed) {
					                          Swal.fire({
					                                icon: 'success',
					                                text: '장바구니에 담겼습니다!',
					                                confirmButtonColor: '#255D00',
					                              }).then( ()=> {document.querySelector('#cartGogosing').submit();} );
					                      }
					                  });
					                  return false;
					            }//upload end
			                   </script>
                            </div>
                        </div>
                    </div>
            </div>
            <hr>
            <div id="main-bottom">
                <div>
                    <br>
                    <p>
                    <img src="/cookTeacher/resources/img/megaphone.png" style="height:5%; width:5%">
                        <%= vo.getInfo() %>
                        <br>
                    </p>
                    <br>
                    <div id="product-detail-info">
                        <%= vo.getDetail() %>
                    </div><br>
                </div>
                <br><br>
                <hr>
                <div id="main-menu-bar">
                    <div class="main-menu-bar-items">
                        <a href="#tag-detail">상품 설명</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="#tag-detail2">영양 정보</a>
                    </div>
                    <div class="main-menu-bar-items">
                        <a href="#tag-review">리뷰</a>
                    </div>
                </div>
                <!-- 상품 설명 -->
                <a id="tag-detail" >
                    <div class="main-prod-area">
                        <img/product src="/cookTeacher/upload/img/<%= vo.getImgPath() %>" alt="상품 이미지" width="80%" height="130%">
                    </div>
                    <br><br><br><br><br><br><br>
                    <div>
                        *제품 이미지&nbsp;&nbsp;📷
                        <br><br><br><br>
                    </div>
                    <div id="big-name">
                        <%= vo.getName() %>
                    </div>
                    <br>
                    <div>
                     <%= vo.getDetail() %>
                    </div>
                    <br><br><br><br>
                    <hr><br><br>
                </a>
                <!-- 영양 정보 -->
                <a id="tag-detail2" >
                    <br>
                    <div>
                        <img/product src="/cookTeacher/upload/img/<%= vo.getImgPath() %>" alt="상품 이미지" width="80%" height="100%">
                    </div>
                    <div>
                    	<br>
                        *상세 이미지&nbsp;&nbsp;🔍
                        <br><br><br><br>
                    </div>
                </a>
                <hr>
                <!-- 리뷰 -->
                <a id="tag-review">
                    <section class="notice">
                        <div class="page-title">
                            <div class="container">
                                <div class="main-menu-bar-items">
                                    <!-- <a href="#tag-review">리뷰</a> -->
                                    <a href="/cookTeacher/">리뷰</a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- board list area -->
                        
                        <div id="board-list">
                            <div class="container">
                                <table class="board-table">
                                    <thead>
                                        <tr id="table-head">
                                            <th scope="col" class="th-num">번호</th>
                                            <th scope="col" class="th-title">내용</th>
                                            <th scope="col" class="th-title">작성자</th>
                                            <th scope="col" class="th-date">등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<%for(int i = 0; i < rvoList.size(); ++i){%>
					               			<tr>
						               			<td><%= i+1 %></td>
		                                        <th>
		                                            <%= rvoList.get(i).getContent() %>
		                                        </th>
		                                        <td><%= rvoList.get(i).getNick() %></td>
		                                        <td><%= rvoList.get(i).getEnrollDate() %></td>
					                        </tr>
										<%}%>
                                    </tbody>
                                </table>
                                <br>
                                <a href="/cookTeacher/product/detail/ReviewWrite?rno=<%=vo.getProdNo() %>">
                                    <input type="button" value="작성하기" id="write-bttn">
                                </a>
                            </div> 
                        </div>
            </div>
            <br><br>
            <div style="margin-left: 485px; margin-bottom: 20px;">
				<%if(loginMember != null && loginMember.getId().equals("admin01")){%>	
				<button class="delete-btn" onclick="location.href='/cookTeacher/product/admin_delete?no=<%=vo.getProdNo()%>'">삭제하기</button>
				<%}%>
			</div>
        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
                
 	<script>
		<%if(alertMsg != null) {%>
			Swal.fire({
			  text: '<%=alertMsg%>',
			  imageUrl: 'http://appdata.hungryapp.co.kr/data_file/data_img/201712/04/W151239560734116232.gif',
			  imageWidth: 300,
			  imageHeight: 200,
			  imageAlt: 'Custom image',
			  confirmButtonColor: '#FFD335',
			})
		<%} %>
	</script>
    
    <script>
	
    	function count(type)  {
    		  // 결과를 표시할 element
    		  const resultElement = document.getElementById("result");
    		  
    		  // 현재 화면에 표시된 값
    		  let number = resultElement.innerText;
    		  
    		  // 더하기/빼기
    		  if(type === 'plus') {
    		    number = parseInt(number) + 1;
    		  }else if(type === 'minus')  {
    		    number = parseInt(number) - 1;
    		  }
    		  
    		  // 결과 출력
    		  resultElement.innerText = number;
    		}
    	/* 
    	function addCart(){
    		/* alert("장바구니에 담겼습니다."); */
			Swal.fire({
			  text: '장바구니에 담겼습니다.',
			  imageUrl: 'https://static.lotteon.com/p/common/foCommon/assets/img/icon_cart_black.svg',
			  imageWidth: 200,
			  imageHeight: 100,
			  imageAlt: 'Custom image',
			})
    	} */
    	
    	//지우기
    	let basket = {
    		    totalCount: 0, 
    		    totalPrice: 0,
    		    //재계산
    		    reCalc: function(){
    		        this.totalCount = 0;
    		        this.totalPrice = 0;
    		        document.querySelectorAll(".p_num").forEach(function (item) {
    		            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
    		                var count = parseInt(item.getAttribute('value'));
    		                this.totalCount += count;
    		                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
    		                this.totalPrice += count * price;
    		            }
    		        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    		    },
    		    //화면 업데이트
    		    updateUI: function () {
    		        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
    		        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
    		    },
    		    //개별 수량 변경
    		    changePNum: function (pos) {
    		        var item = document.querySelector('input[name=p_num'+pos+']');
    		        var p_num = parseInt(item.getAttribute('value'));
    		        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
    		        
    		        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }
    		        item.setAttribute('value', newval);
    		        item.value = newval;
    		        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
    		        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
    		        //AJAX 업데이트 전송
    		        //전송 처리 결과가 성공이면    
    		        this.reCalc();
    		        this.updateUI();
    		    },
    		    checkItem: function () {
    		        this.reCalc();
    		        this.updateUI();
    		    },
    		    delItem: function () {
    		        event.target.parentElement.parentElement.parentElement.remove();
    		        this.reCalc();
    		        this.updateUI();
    		    }
    		}
    		// 숫자 3자리 콤마찍기
    		Number.prototype.formatNumber = function(){
    		    if(this==0) return 0;
    		    let regex = /(^[+-]?\d+)(\d{3})/;
    		    let nstr = (this + '');
    		    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    		    return nstr;
    		};
    		
	
	</script>
    
    

</body>
</html>