<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <div class="cmt_container">
			<div class="form-table">
				<form action="" method="get">
					<section class="cmt_inp">
						<div>
							<textarea name="comment" style="display: none;" placeholder="내용을 입력해 주세요."></textarea>
						</div>
						<div style="height: 1px; overflow: hidden;"></div>
						<div class="cmt_cbtn">
							<button type="submit" class="cmt_btn"><span>등록</span></button>
						</div>
					</section>
				</form>
				<%for(int i = 0; i < 댓글수.size() i++){%>
					<section class="cmmt_list">
						<div class="cmmt_header">
							<div class="cmmt_writer">
								<p>
									${댓글vo.name}
									<span>${댓글vo.enrollDate}</span>
								</p>
							</div>
							<div class="cmmt_txt"><p>${댓글vo.content}</p></div>
							<%if(loginMember != null && loginMember.getName().equals(댓글vo.name())){%>
							<div class="cmmt_btn">
								<button type="button">수정</button>
								<button type="button">삭제</button>
							</div>
							<%}%>
						</div>
					</section>
				<%}%>	
			</div>

		</div> -->
</body>
</html>