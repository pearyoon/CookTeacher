<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookTeacher</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<style>
    div{
        --border: 1px solid black;
    }
	#product-name{
		text-align: left;

	}
    #product-main-img{
        width: 100px;
    }
    .inner{
        width: 70%;
        height: 15%;
        display: flex;
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
        display: flex;
        margin: 0 auto;

    }
    #product-detail-info{
        font-size: medium;
    }
    .main-menu-bar-items{
        width: 30%;
        font-weight: 700;
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
  width: 200px;
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
}
#table-head{
    background-color: rgba(211, 211, 211, 0.566);
}
</style>
</head>
<body>
   <%@include file="/views/common/header.jsp" %>
    <div id="container">
        <main>
          
    
    
            <div id="main-middle">
                <div id="product-name"></div>
                <div id="main-menu-area">
                    <div id="product-main-img">
                            <img src="/cookTeacher/resources/img/milk.png" alt="레시피게시판담당" width="100%" height="100%">
                        <!-- <div>우유</div> -->
                    </div>
                    <div class="outer">
                        <div class="inner" id="real-name">
                            [서울우유] 나 100% 우유
                        </div>
                        <div class="inner">
                            가격
                        </div>
                    	<div class="inner">
                    		원산지
                    	</div>
                    	<div class="inner">
                    		중량
                    	</div>
                    	<div class="inner-last">
                    		구매 수량
                    	</div>

                    </div>
                    <div class="outer2">
                        <div class="inner">
                        </div>
                        <div class="inner">
                            4,990원
                        </div>
                        <div class="inner">
                            국내산
                        </div>
                        <div class="inner">
                            1.8L
                        </div>
                        <div class="inner-last">
                           + 1 +     
                        </div>

                    </div>
                    

                </div>
            </div>
            <hr>
            <div id="main-bottom">
                <div>
                    <br>
                    <p>
                        신선하고 고소한 명품우유
                        <br>
                    </p>
                    <br>
                    <div id="product-detail-info">
                        서울우유는 1등급이 2개인 명품우유에요. 건강한 젖소일수록 체세포수가 적게 나오는데, 체세포수가 1등급인 우유입니다. 
                        <br><br>여기에 세균수 1A로 세균수가 적은 신선한 우유랍니다. 영양 가득한 고소한 흰 우유 한 잔 어떠세요.<br><br><br><br>
                    </div>
                </div>
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
                        <img src="/cookTeacher/resources/img/milk_big.jpg" alt="상품 이미지" width="80%" height="100%">
                    </div>
                    <br>
                    <div>
                        *제품 이미지
                        <br><br><br><br>
                    </div>
                    <div id="big-name">
                        서울우유 1.8L
                    </div>
                    <br>
                    <div>
                        우유는 다 거기서 거기일까요. 전혀 아닙니다. 목장에서부터 다른 서울우유를 선택해보세요. <br><br>
                        세균수 1A 등급과 체세포수 1등급인 좋은 우유니까요. 세균수는 오염의 지표이며, 적을수록 신선한 우유입니다. <br><br>
                        체세포수는 건강한 젖소일수록 적게 나오고, 이는 곧 우유의 품질을 나타내요. <br><br>
                        1등급이 2개나 있는 검증된 서울우유는 신선하고 고소한 맛과 향 그리고 먹음직스러운 흰색까지 갖추었어요. <br><br>
                        1.8L 용량으로 온 가족이 즐길 수 있는 넉넉한 양입니다. 시원하게 한 잔 마시는 것도 좋고, 우유와 잘 어울리는 다양한 음식과 함께해도 좋은 서울우유를 즐겨보세요.
                    </div>
                    <br><br><br><br><br>
                    
                    <hr><br><br>
                </a>
                <!-- 영양 정보 -->
                <a id="tag-detail2" >
                    <br>
                    <div>
                        <img src="/cookTeacher/resources/img/milk_info.png" alt="상품 이미지" width="100%" height="100%">
                    </div>
                    <div>
                        *영양 정보
                        <br><br><br><br>
                    </div>
                </a>
                <hr>
                <!-- 리뷰 -->
                <a id="tag-review" >
                    <section class="notice">
                        <div class="page-title">
                            <div class="container">
                                <div class="main-menu-bar-items">
                                    <a href="#tag-review">리뷰</a>
                                </div>
                                <!-- <h3>공지사항</h3> -->
                            </div>
                        </div>
                    
                        <!-- board seach area -->
                        <!-- <div id="board-search">
                            <div class="container">
                                <div class="search-window">
                                    <form action="">
                                        <div class="search-wrap">
                                            <label for="search" class="blind">공지사항 내용 검색</label>
                                            <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                                            <button type="submit" class="btn btn-dark">검색</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> -->
                        
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
                                    <tr>
                                        <td>6</td>
                                        <th>
                                            정말 맛있어요~
                                        </th>
                                        <td>김민우</td>
                                        <td>2022.10.04</td>
                                    </tr>
                    
                                    <tr>
                                        <td>5</td>
                                        <th>늘 이것만 사먹어요 ^..^</th>
                                        <td>문동주</td>
                                        <td>2022.10.04</td>
                                    </tr>
                    
                                    <tr>
                                        <td>4</td>
                                        <th>우유는 역시 서울우유!</th>
                                        <td>박서연</td>
                                        <td>2022.10.04</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <th>
                                            꼭 추천합니다~!
                                        </th>
                                        <td>배윤아</td>
                                        <td>2022.10.04</td>
                                    </tr>
                    
                                    <tr>
                                        <td>2</td>
                                        <th>시리얼에는 역시 서울우유!</th>
                                        <td>안연주</td>
                                        <td>2022.10.04</td>
                                    </tr>
                    
                                    <tr>
                                        <td>1</td>
                                        <th>가격도 착하고 맛도 좋아요~</th>
                                        <td>이소은</td>
                                        <td>2022.10.04</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br>
                                <input type="button" value="작성하기" id="write-bttn">
                            </div>
                        </div>
                    
                    </section>
                 
                  
                    <br><br><br><br><br>
                </a>
                
                
            </div>

        </main>
		<%@include file="/views/common/footer.jsp" %>
    </div>
    
    

</body>
</html>