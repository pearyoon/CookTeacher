<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:if test="${attVo != null}">
		<script>
//			const name = '${}';
		
//			window.opener.$().attr(src,);
			window.close();
		</script>
	</c:if>

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