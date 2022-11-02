<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 공지사항</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/notice/detail.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div class="detail-wrap">
            <div class="detail-top">
                <div>공지사항</div>
            </div>
        </div>
        <div class="detail-middle">
            <input type="hidden" value="${vo.no}" name="no">
            <div class="flex-box">
                <div>제목</div>
                <div>${vo.title}</div>
            </div>
            <div class="flex-box">
                <div>작성자</div>
                <div>${vo.writer }</div>
            </div>
            <div class="flex-box">
                <div>작성일</div>
                <div>${vo.enrollDate }</div>
            </div>
            <div class="content-area">
                <div>
                    ${vo.content }
                </div>
            </div>
            <div class="detail-btn">
                <div>
                    <button id="back" type="button" onclick="history.back()">
                        <span>목록</span>
                    </button>
                </div>
                <div class="update-btn">
                    <button id="edit" type="button">
                        <span>수정</span>
                    </button>
                    <button id="delete" type="button">
                        <span>삭제</span>
                    </button>
                </div>


            </div>
        </div>

        <%@include file="/views/common/footer.jsp" %>
    </div>
    <script>
        $('#edit').click(function(){
            window.location.href = "/cookTeacher/admin/notice/edit?no=${vo.no}";
        });

        $('#delete').click(function(){

            Swal.fire({
                title: '현재 게시글 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소' 
                }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "/cookTeacher/admin/notice/delete?no=${vo.no}";
                }
            })


           
        });
    </script>
</body>
</html>