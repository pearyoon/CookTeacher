<%@page import="java.util.List"%>
<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="com.kh.cook.product.vo.ProductVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");
	List<ReviewVo> rvoList = (List<ReviewVo>)request.getAttribute("rvoList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 쇼핑</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<!-- 수량 버튼 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="./10-11.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
div{
    --border: 1px solid black;
}
#product-name{
	text-align: left;
}
#product-main-img/product{
    width: 100px;
}
.inner{
    width: 70%;
    height: 15%;
    --display: flex;
    margin: 0 auto;
    font-size: 20px;
}
.basketprice{
    width: 70%;
    height: 15%;
    --display: flex;
    margin: 0 auto;
    font-size: 20px;
}
.inner-last{
    width: 70%;
    height: 30%;
    line-height: 14rem;
    display: flex;
    margin: 0 auto;
}
.outer{
    font-weight: 800;
    font-size: 20px;
}
#real-name{
    font-size: 24px;
    --display: flex;
    margin: 0 auto;
}
#product-detail-info{
    font-size: medium;
}
.main-menu-bar-items{
    width: 30%;
    font-weight: 700;
    background-color: #255D00;
    box-shadow: 3px 3px #FFD335;
}
.main-menu-bar-items > a{
    color : white;
}
#main{
    width: 60vw;
    height: 60vh;
    display: grid;
    grid-template-rows: repeat(11 , 30px);
    grid-template-columns: 1fr 5fr 3fr 3fr;
    margin: 0 auto;
    border: 1px solid black;
    align-content: center;
    row-gap: 10px;
}
#big-name{
    font-size: 30px;
    font-weight: 500;
}
.review-outer, .review-inner{
    border: 1px solid black;
    box-sizing: border-box;
    height: 30px;
}
#t1{
    display: flex;
    display: grid;
    grid-template-columns: 6fr 1.5fr 1fr;
}
#t1 > div{
    border: 1px solid black;
    --display: grid;
    --grid-template-columns: 5fr 4fr 3fr;
}
/* 리뷰 */
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 20px 0;
}
.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}
#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}
.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
  font-size: 19px;
  font-weight: 500;
}
.board-table .th-num {
  width: 100px;
  text-align: center;
}
.board-table .th-date {
  width: 250px;
}
.board-table th, .board-table td {
  padding: 14px 0;
}
.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
  font-size: 16px;
  font-weight: 400;
}
.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: center;
  font-size: 16px;
  font-weight: 400;
}
.board-table tbody th p{
  display: none;
}
.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}
.btn-dark {
  background: #555;
  color: #fff;
}
.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}
.btn-dark {
  background: #555;
  color: #fff;
}
.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}
/* reset */
* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}
#write-bttn{
    text-align: center;
    width: 100px;
}
#table-head{
    background-color: rgba(211, 211, 211, 0.566);
}
.css-1qirdbn {
    --display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 80%;
    height: 52px;
    border-radius: 10px;
    color: black;
    background-color: #FFD335;
    --border: 0px none;
    border: 2px solid #255D00;
    font-size: medium;
    font-weight: 700;
   	font-size: 17px;
}
.css-1qirdbn:hover {
    background: #255D00;
    border: 2px solid #FFD335;
    color: white;
    
}
button[disabled], input[disabled] {
    cursor: default;
}
.css-1e90glc {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iI0RERCIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
    vertical-align: top;
}
.css-18y6jr4 {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xNiAxMHY0aDR2MmgtNHY0aC0ydi00aC00di0yaDR2LTRoMnoiIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyIvPgo8L3N2Zz4K);
    vertical-align: top;
}
.fa-arrow-alt-circle-up:before {
    content: "\f35b";
}
.fa-arrow-alt-circle-down:before {
    content: "\f358";
}
#main-menu-area{
	height: 550px;
}
#header-search-area>button {
	width: 45px;
	height: 45px;
	background-color: white;
	border-left: white;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

input[type=number]::-webkit-inner-spin-button {
    opacity: 1
}

</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
            <form action="/cookTeacher/product/detail/productDetail" method="post">
            <div id="main-middle">
            <hr><br><br>
                <div id="product-name"></div>
                    <div id="main-menu-area">
                    <input type="hidden" name="prodNo" value="<%=vo.getProdNo() %>">
                        <div id="product-main-img/product">
                            <img/product src="/cookTeacher/upload/img/<%= vo.getImgPath()%>" alt="레시피게시판담당" width="100%" height="100%">
                        </div>
                        <div class="outer">
                            <div class="inner" id="real-name">
                                [&nbsp;<%= vo.getName() %>&nbsp;]
                            </div>
                            <div class="inner">
                                원산지
                            </div>
                            <div class="inner">
                                중량
                            </div>
                            <div class="inner">
                                가격
                            </div>
                            <div class="inner">
                                구매 수량
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
                                                <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%= vo.getPrice() %>"><%= vo.getPrice() %>원</div>
                                                <div class="num">
                                                
                                                    <!-- <div class="updown">
                                                    <br><br><br>
                                                        <input type="text" name="p_num1" id="p_num1" size="3" maxlength="3" class="p_num" value="1" onkeyup="javascript:basket.changePNum(1);">
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                                        <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                                        <br><br><br>
                                                    </div>  -->
                                                    
                                                   <br><br><br>
                                                    <div class="updown">
                                                    <input type="number" name="prodCnt" id="p_num1" size="3" maxlength="3" class="p_num" value="1" min="1" max="20" onkeyup="javascript:basket.changePNum(1);" style="width: 35px; margin-bottom: 35px ">
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
                            		<input type="submit" onclick="" class="cart-button css-1qirdbn e4nu7ef3" radius="3" value="장바구니 담기">
                            		
                            	</form>
                            	
			                   <!-- <script type="text/javascript">
								function addCart(){
									Swal.fire({
										  position: 'top',
										  icon: 'success',
										  title: '장바구니에 담겼습니다.',
										  showConfirmButton: false,
										  timer: 1000000
										})
								}
			                   </script> -->
			                   
			                 
			                            	
                            </div>
                        </div>
                    </div>
            </div>
            <hr>
            <div id="main-bottom">
                <div>
                    <br>
                    <p>
                        <%= vo.getInfo() %>
                        <br>
                    </p>
                    <br>
                    <div id="product-detail-info">
                        <%= vo.getDetail() %>
                    </div>
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
                        <img/product src="/cookTeacher/upload/img/<%= vo.getImgPath() %>" alt="상품 이미지" width="80%" height="100%">
                    </div>
                    <br>
                    <div>
                        *제품 이미지
                        <br><br><br><br>
                    </div>
                    <div id="big-name">
                        <%= vo.getName() %>
                    </div>
                    <br>
                    <div>
                     <%= vo.getDetail() %>
                    </div>
                    <br><br><br><br><br>
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
                        *상세 이미지
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