<%@page import="com.kh.cook.product.vo.PageVo"%>
<%@page import="com.kh.cook.product.vo.ReviewVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ReviewVo> rvoList = (List<ReviewVo>)request.getAttribute("rvoList");
	PageVo pv = (PageVo)request.getAttribute("pv");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 마이페이지</title>

<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/main.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/check.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/mypage/modify.css">

<link rel="stylesheet" href="/cookTeacher/resources/css/product/myReview.css">

<style>
#list-menu>li:nth-child(4)>a{
    background-color: rgb(250, 250, 250);
    color: #255D00;
    font-weight: 600;
}
</style>

</head>
<body>
	<%@include file="/views/common/header.jsp" %>
	<div id="container">
        <div id="mypage-wrap">
            <div id="mypage-area">
                <div id="mypage-left">
                    <h2 id="tit-aticle">마이쿡</h2>
                    <div id="inner">
                        <ul id="list-menu">
                            <li class="non-clcik">
                                <a href="/cookTeacher/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="/cookTeacher/bobstory/mypage/myCookStory">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="/cookTeacher/product/mypage/myReview">
                                    리뷰조회
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="/cookTeacher/login/cs/QnAhistory">
                                    문의내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="/cookTeacher/cs/QnA/write">
                                    문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="mypage-right">
                    <h2 id="head-aticle">
                        리뷰조회
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">
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
				                    
								    	<%for(int i = 0; i < rvoList.size(); ++i){%>
					               			<tr>
		                                        <td>
		                                            <%= rvoList.get(i).getReviewNo() %>
		                                        </td>
		                                        <td><%= rvoList.get(i).getName() %></td>
		                                        <td><%= rvoList.get(i).getContent() %></td>
		                                        <td><%= rvoList.get(i).getEnrollDate() %></td>
						            			
					                        </tr>
										<%}%>
										<%-- <tr>
											<td>${review.content}</td>
											<th>${review.reviewNo}</th>
											<td>${review.reviewNo}</td>
											<td>${review.reviewNo}</td>
										</tr> --%>
				                    </tbody>
				                </table>
				                <br>
			                	<div id="page-area" style="text-align: center;">
						        	<%if(pv.getStartPage() != 1){%>
							        	<a href="/cookTeacher/product/mypage/myReview?pno=<%=pv.getStartPage()-1%>" class="btn">이전</a>
						        	<%}%>
						        	
							        <%for(int i = pv.getStartPage(); i <= pv.getEndPage(); i++){%>
								        <a href="/cookTeacher/product/mypage/myReview?pno=<%=i%>" class="btn"><%=i%></a>
							        <%}%>
							        
							        <%if(pv.getEndPage() != pv.getMaxPage()){%>
									        <a href="/cookTeacher/product/mypage/myReview?pno=<%=pv.getEndPage()+1 %>" class="btn">다음</a>
							        <%}%>
		        				</div>
				            </div>
       					 </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>

</body>
</html>