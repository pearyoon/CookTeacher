<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 공지사항</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/notice/list.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>공지사항</div>
        <div class="list-wrap">
            <div class="list-middle">
                <div id="list-title" class="list-flex">
                    <div>번호</div>
                    <div>제목</div>
                    <div>작성자</div>
                    <div>작성일</div>
                </div>
                <ul>
                    <li>
                    <c:forEach items="${voList}" var="list">
                    	<a href="/cookTeacher/notice/detail?no=${list.no }">
                            <div class="list-flex" id="list-content">
                                <div>${list.no }</div>
                                <div>${list.title }</div>
                                <div>${list.writer }</div>
                                <div>${list.enrollDate }</div>
                            </div>
                        </a>
                    </c:forEach>


                    </li>
                </ul>
            </div>
        </div>
        <div class="btn-wrap">
            <div>
                <button id="left">
                    <i class="bi bi-chevron-left"></i>
                </button>
                <c:if test="${pVo.currentPage == 1}">
                	<script>
                		$('#left').attr("disabled",true);
                	</script>
                </c:if>
                <button id="right">
                    <i class="bi bi-chevron-right"></i>
                </button>
                <c:if test="${pVo.currentPage == pVo.maxPage || pVo.listCount == 0}">
                	<script>
                		$('#right').attr("disabled",true);
                	</script>
                </c:if>
            </div>
        </div>
        <c:if test="${loginMember.adminYn eq 'Y' }">
	       	<div class="detail-btn">
	            <div>
	                <button id="write" type="button">
	                    <span>작성</span>
	                </button>
	            </div>
	
	        </div>
        </c:if>

        <%@include file="/views/common/footer.jsp" %>
    </div>
 
 	<script>
       	$('#left').click(function(){
       		window.location.href="/cookTeacher/notice/list?pno=${pVo.currentPage-1}";
           });
       	
       	$('#right').click(function(){

               window.location.href="/cookTeacher/notice/list?pno=${pVo.currentPage+1}";
       	});
       
        $('#write').click(function(){
            window.location.href="/cookTeacher/admin/notice/write";
        });

	</script>
 
    
</body>
</html>