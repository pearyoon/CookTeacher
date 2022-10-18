<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    div{
        --border: 1px solid black;
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

.container {
  width: 820px;
  margin: 0 auto;
}

#table-head{
    background-color: rgba(211, 211, 211, 0.566);
}
</style>

</head>
<body>

                        <div id="board-list">
                            <div class="container">
                                <table class="board-table">
                                    <thead>
                                    <tr id="table-head">
                                        <th scope="col" class="th-num">번호</th>
                                        <th scope="col" class="th-title">제품명</th>
                                        <th scope="col" class="th-title">내용</th>
                                        <th scope="col" class="th-date">등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>5</td>
                                        <th>
                                            뉴질랜드 골드키위 1.1kg
                                        </th>
                                        <td>뉴질랜드에 가보진 않았지만..</td>
                                        <td>2022.10.19</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <th>
                                            스테비아 토마토 1.2kg
                                        </th>
                                        <td>토마토에 꿀 바른 것처럼 달아요 ~</td>
                                        <td>2022.10.18</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <th>
                                            유기농 당근
                                        </th>
                                        <td>정말 싱싱했어요 ~ 배송도 빠르구요!</td>
                                        <td>2022.09.12</td>
                                    </tr>
                    
                                    <tr>
                                        <td>2</td>
                                        <th>배추김치 1kg</th>
                                        <td>김치가 똑 떨어져서 급하게 샀는데.. 맛있어요!</td>
                                        <td>2022.07.25</td>
                                    </tr>
                    
                                    <tr>
                                        <td>1</td>
                                        <th>서울우유 1L</th>
                                        <td>우유는 역시 서울우유!</td>
                                        <td>2022.05.20</td>
                                    </tr>

                                    </tbody>
                                </table>
                                <br>
                            </div>
                        </div>

</body>
</html>