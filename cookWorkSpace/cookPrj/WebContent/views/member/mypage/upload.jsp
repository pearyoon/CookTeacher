<%@page import="com.kh.cook.common.AttachmentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	AttachmentVo attVo = (AttachmentVo)session.getAttribute("attVo");
	session.removeAttribute("attVo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 프로필등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
	#upload-wrap{
		width: 180px;
		height: 180px;
		text-align: center;

	}
	#upload-wrap div:first-child{
		padding: 10px
	}
	#upload-wrap div:last-child{
		padding: 30px 0px;
	}

</style>
</head>
<body>
	
	<%if(attVo != null){ %>
		<script>

			const filePath = '<%=attVo.getFilePath()%>';
			const changeName = '<%=attVo.getChangeName()%>';
			const url = "/cookTeacher/"+ filePath + "/" + changeName;
			
			console.log(url);
			
			$(opener.document).find('#profile-img').attr('src', url);
			$(opener.document).find('#profile-url').val(url);
			
			
			window.close();
		</script>
	<%} %>

	<div id="upload-wrap">
		<h1>이미지 첨부</h1>
		<form action="" method="POST" enctype="multipart/form-data">
			<div>
				<input type="file" name="f" id="upload">
			</div>
			<div>
				<button type="button">취소</button>
				<button type="submit">확인</button>
			</div>
		</form>
	</div>
	
	<script>
		$('button[type="button"]').click(function(){
			window.close();
		});
		}
	</script>

	
</body>
</html>