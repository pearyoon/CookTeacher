<%@page import="com.kh.cook.bobstory.vo.PageVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BobstoryVo> voList = (List<BobstoryVo>)request.getAttribute("voList");
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
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/myCookStory.css">

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
                                <a href="<%=root %>/login/mypage/member/check">
                                    회원정보
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/order/mypage/orderlist">
                                    주문내역
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/bobstory/mypage/myCookStory">
                                    쿡스토리
                                </a>
                            </li>
                            <li class="non-clcik">
                                <a href="<%=root%>/product/mypage/myReview">
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
                        쿡스토리
                    </h2>
                    <div id="line"></div>
                    <div id="board-container">
						<div id="board-list">
				            <div class="container">
				                <table class="board-table">
				                    <thead>
				                    <tr id="table-head">
				                        <th scope="col" class="th-num">번호</th>
				                        <th scope="col" class="th-title">작성자</th>
				                        <th scope="col" class="th-content">내용</th>
				                        <th scope="col" class="th-date">작성일시</th>
				                    </tr>
				                    </thead>
				                    <tbody>
				                    
								    	<%for(int i = 0; i < voList.size(); ++i){%>
					               			<tr>
		                                        <td><%= voList.get(i).getNo() %></td>
		                                        <td><%= voList.get(i).getWriter() %></td>
		                                        <td><%= voList.get(i).getContent() %></td>
		                                        <td><%= voList.get(i).getEnrollDate() %></td>
						            			
					                        </tr>
										<%}%>
				                    </tbody>
				                </table>
				                <br>
			                	<div id="page-area" style="text-align: center;">
			                		<c:if test="${empty voList}">
			                		<p>작성한 글이 없습니다.</p>
			                		</c:if>
						        	<%if(pv.getStartPage() != 1){%>
							        	<a href="/cookTeacher/bobstory/mypage/myCookStory?pno=<%=pv.getStartPage()-1%>" class="btn"><</a>
						        	<%}%>
						        	
							        <%for(int i = pv.getStartPage(); i <= pv.getEndPage(); i++){%>
								        <a href="/cookTeacher/bobstory/mypage/myCookStory?pno=<%=i%>" class="btn"><%=i%></a>
							        <%}%>
							        
							        <%if(pv.getEndPage() != pv.getMaxPage()){%>
									    <a href="/cookTeacher/bobstory/mypage/myCookstory?pno=<%=pv.getEndPage()+1 %>" class="btn">></a>
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