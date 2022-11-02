<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 :: 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/notice/write.css">
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
                <form action="/cookTeacher/admin/notice/write" method="post" onsubmit="return check();">
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
                        <button onclick="history.back()" type="button">
                            <span>취소</span>
                        </button>
                        <button type="submit">
                            <span>등록</span>
                        </button>
                    </div>

                </form>

            </div>
        </div>
		

        <%@include file="/views/common/footer.jsp" %>
    </div>

    <script>
        function check(){
            const title = $('#title').val();
            const content = $('#content').val();
            
            if(title==""){
                Swal.fire({
                    icon: 'error',
                    text: '제목을 작성해주세요.',
                });

            	return false;
            }
            
            if(content == ""){
                Swal.fire({
                    icon: 'error',
                    text: '내용을 작성해주세요.',
                });
            	return false;
            }
        }
    </script>
</body>
</html>