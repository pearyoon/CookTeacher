<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                <form action="">
                    <div class="flex-box">
                        <div>
                            <label for="title">제목</label>
                        </div>
                        <div>
                            <input id="title" type="text" name="title">
                        </div>
                    </div>
                    <div class="flex-box">
                        <div>
                            <label for="content">내용</label>
                        </div>
                        <div>
                            <div id="content-area">
                                <textarea id="content" name="content"></textarea>

                            </div>
                        </div>
                    </div>
                    <div class="btn-area">
                        <button>
                            <span>취소</span>
                        </button>
                        <button>
                            <span>수정</span>
                        </button>
                    </div>

                </form>

            </div>
        </div>


        <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>