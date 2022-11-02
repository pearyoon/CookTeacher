<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 공지사항</title>
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/notice/edit.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
</head>
<body>

    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <div class="edit-wrap">
            <div class="edit-wrap">
                <div class="edit-top">
                    <div>공지사항</div>
                </div>
            </div>
            <div class="edit-middle">
                <form action="/cookTeacher/admin/notice/edit" method="POST" onsubmit="return check();">
                    <div class="flex-box">
                        <input type="hidden" name="no" value="${vo.no}">
                        <div>
                            <label for="title">제목</label>
                        </div>
                        <div>
                            <input id="title" type="text" name="title" value="${vo.title}">
                        </div>
                    </div>
                    <div class="flex-box">
                        <div id="content-top">
                            <label for="content">내용</label>
                        </div>
                        <div>
                            <div id="content-area">
                                <textarea id="content" name="content">${vo.content}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <button onclick="history.back()" type="button">
                            <span>취소</span>
                        </button>
                        <button type="submit">
                            <span>수정</span>
                        </button>
                    </div>

                </form>

            </div>
        </div>


        <%@include file="/views/common/footer.jsp" %>
    </div>
    <script>
        $('#edit').click(function(){
            window.location.href = "/cookTeacher/admin/notice/edit?no=${vo.no}";
        });
    </script>
</body>
</html>