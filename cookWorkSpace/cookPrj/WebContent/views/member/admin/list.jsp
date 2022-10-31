<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 회원조회</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/member/admin/list.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div>회원정보조회</div>
        <div class="list-wrap">
            <div class="list-top">
            	<a href="/cookTeacher/admin/member/list?member=all&pno=1">전체</a>
            	<span>|</span>
                <a href="/cookTeacher/admin/member/list?pno=1&quitYn=N">유지회원</a>
                <span>|</span>
                <a href="/cookTeacher/admin/member/list?pno=1&quitYn=Y">탈퇴회원</a>
            </div>
            <div class="list-middle">
                <div id="list-title" class="list-flex">
                    <div>번호</div>
                    <div>아이디</div>
                    <div>이름</div>
                    <div>가입일</div>
                    <div>등급</div>
                    <div>탈퇴</div>
                </div>
                <ul>
                    <li>
                    <c:forEach items="${memberList}" var="memberList">
                    	<c:if test="${empty memberList}">
                    	
                    		<div>
                    			<p>
                    			회원이 없습니다.                    			
                    			</p>
                    		</div>
                    	</c:if>
                    	<a href="/cookTeacher/admin/member/detail?no=${memberList.no}">
                    	
                            <div class="list-flex" id="list-content">
                                <div>${memberList.no}</div>
                                <div>${memberList.id}</div>
                                <div>${memberList.name}</div>
                                <div>${memberList.enrollDate}</div>
                                <div>${memberList.grade}</div>
                                <div>${memberList.quitYn}</div>
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
                <c:if test="${pvo.currentPage == 1}">
                	<script>
                		$('#left').attr("disabled",true);
                	</script>
                </c:if>
                <button id="right">
                    <i class="bi bi-chevron-right"></i>
                </button>
                <c:if test="${pvo.currentPage == pvo.maxPage || pvo.listCount == 0}">
                	<script>
                		$('#right').attr("disabled",true);
                	</script>
                </c:if>
            </div>
        </div>
        <div class="search-wrap">
	        <form action="/cookTeacher/admin/member/list" method="get">
	        	<div class="flex-box">
	                <div id="input-area">
	                    <input type="text" name="search" placeholder="찾고 싶은 아이디를 입력해주세요.">
	                    <input type="hidden" name="pno" value="1">
	                </div>
	                <div id="btn-area">
	                    <button type="submit" id="search-btn">
	                        <span>찾기</span>
	                        <i class="bi bi-search-heart"></i>
	                    </button>
	                </div>
	            </div>
	        </form>

        </div>
        <%@include file="/views/common/footer.jsp" %>
    </div>
    	<c:if test="${quitYn eq 'Y'}">
    		<script>
	        	$('#left').click(function(){
	        		window.location.href="/cookTeacher/admin/member/list?pno=${pvo.currentPage-1}&quitYn=Y";
	            });
	        	
	        	$('#right').click(function(){

	                window.location.href="/cookTeacher/admin/member/list?pno=${pvo.currentPage+1}&quitYn=Y";
	        	});
	        
    		</script>
    	</c:if>
    	<c:if test="${quitYn eq 'N'}">
    		<script>
	        	$('#left').click(function(){
	        		window.location.href="/cookTeacher/admin/member/list?pno=${pvo.currentPage-1}&quitYn=N";
	            });
	        	
	        	$('#right').click(function(){

	                window.location.href="/cookTeacher/admin/member/list?pno=${pvo.currentPage+1}&quitYn=N";
	        	});
	        
    		</script>
    	</c:if>
    	<c:if test="${empty quitYn}">
    		<script>
		       	$('#left').click(function(){
		       		window.location.href="/cookTeacher/admin/member/list?member=all&pno=${pvo.currentPage-1}";
		           });
		       	
		       	$('#right').click(function(){
		
		               window.location.href="/cookTeacher/admin/member/list?member=all&pno=${pvo.currentPage+1}";
		       	});
	        
    		</script>
    	</c:if>
    	<c:if test="${search != null}">
    		<script>
		       	$('#left').click(function(){
		       		window.location.href="/cookTeacher/admin/member/list?search=${search}&pno=${pvo.currentPage-1}";
		           });
		       	
		       	$('#right').click(function(){
		
		               window.location.href="/cookTeacher/admin/member/list?search=${search}&pno=${pvo.currentPage+1}";
		       	});
	        
    		</script>
    	</c:if>
    
    <script>
    
    
        $('input[name="memberId"]').focus(function(){
            $('input[name="memberId"]').css("border", "1px solid rgb(51, 51, 51)");
        });

        $('input[name="memberId"]').blur(function(){
            $('input[name="memberId"]').css("border", "1px solid rgb(221, 221, 221)");
        });

    </script>
</body>
</html>