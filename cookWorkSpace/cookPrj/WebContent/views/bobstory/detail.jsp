<%@page import="java.util.List"%>
<%@page import="com.kh.cook.bobstory.vo.BobCmtVo"%>
<%@page import="com.kh.cook.bobstory.vo.AttachmentVo"%>
<%@page import="com.kh.cook.bobstory.vo.BobstoryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	BobstoryVo vo = (BobstoryVo)request.getAttribute("vo");
	AttachmentVo attVo = (AttachmentVo)request.getAttribute("attachmentVo");
	if(attVo == null){
		attVo = new AttachmentVo();
	}
	List<BobCmtVo> cvo = (List<BobCmtVo>)request.getAttribute("cvo"); 
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥쿡선생 :: 쿡스토리</title>
<!-- 경로 체크 필수 -->
<link rel="stylesheet" href="/cookTeacher/resources/css/header.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/footer.css">
<link rel="stylesheet" href="/cookTeacher/resources/css/bobstory/detail.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function bLike(){
		let cnt = '${vo.cLike}';
		let no = '${vo.no}';
		
		$.ajax({
			url : "/cookTeacher/bobstory/boblike",
			type : "post",
			data : {"no" : no },
			success : function(result){
				if(result != ""){
					cnt + 1
					$('#likeView').text(result);
				}
			},
			error : function(){
				alert('안올라갓지롱');
			}
		});
	}
	
	function delete_b(){
		console.log('${vo.no}');
	    Swal.fire({
	        title: '삭제 하시겠습니까?',
	        text: "삭제하면 돌이킬 수없습니다",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	      }).then((result) => {
	        if (result.isConfirmed) {
	      window.location.href="/cookTeacher/bobstory/delete?no='${vo.no}'";
	          Swal.fire(
	            '삭제 완료 !',
	            '게시글 삭제가 완료되었습니다.',
	            'success'
	          )
	          console.log('${vo.no}');
	        }
	      })
	}
	

	
</script>
</head>
<body>
	<%@include file="/views/common/header.jsp" %> <!-- 헤더부분 가져오기-->
		<!-- 헤더는 컨테이너 밖에 -->
		<div id="container">
			<div id="main-wrap">
				<br>
				<br>
				<p>쿡 스토리</p>
				<br>
				<br>
				<table class="table">
					<thead>
						<tr class="ta-1">
						<td class="t-ti" ><%=vo.getTitle()%></td>
						<td class="t-cl"><p>추천수</p><span id="likeView"><%=vo.getcLike()%></span></td>
						<td class="t-vc"><p>조회수</p><%=vo.getViewCount()%></td>
						</tr>
						<tr class="ta-2">
						<td class="t-wr"><p><%=vo.getWriter()%></p></td>
						<td class="t-no">No.<%=vo.getNo()%></td>
						<td class="t-da"><%=vo.getEnrollDate()%></td>
						</tr>
					</thead>
					<tbody>
						<%if(vo.getNo().equals(attVo.getNo())){%>
							<tr>
								<td id="img-box"><img alt="사진" src="<%=root %>/<%=attVo.getFilePath() %>/<%=attVo.getChangeName() %>"></td>
							</tr>
						<%}else{%>
						<%}%>
						<tr>
							<td><%=vo.getContent()%></td>
						</tr>
					</tbody>
				</table>
				<hr>
				 <div class="vote_btn">
					<button id="like_btn" onclick="bLike();">좋아요</button>
					<button id="report_btn" onclick="location.href='/cookTeacher/bobstory/report?no=<%=vo.getNo()%>'">신고</button>
					<!-- <input type="button" id="like_btn" value="좋아요" onclick="bLike();"> -->
					<!-- <input type="button" id="report_btn" value="신고" onclick="location.hred='/cookTeacher/bobstory/report'"> -->
				</div>
				<%if(loginMember != null && (loginMember.getNick().equals(vo.getWriter()) || loginMember.getNick().equals("관리자"))){%>
				<div id="main-bot">
					<a href="/cookTeacher/bobstory/edit?no=<%=vo.getNo()%>">수정하기</a>
					<!-- <button type="button" onclick="delete_b()">삭제하기</button> -->
					<!-- <input type="submit" class="check-d" onclick="delete_b()" value="삭제하기"> -->
					<a href="/cookTeacher/bobstory/delete?no=<%=vo.getNo()%>" class="check-d"">삭제하기</a>
				</div>
				<%}%>
			<br>
			<div class="cmt_container">
				<div class="form-table">
					<!-- <form action="/cookTeacher/bobstory/cmt" method="get"> -->
						<input type="hidden" value="<%=vo.getNo()%>" name="bobNo">
						<%if(loginMember != null) {%>
							<input type="hidden" value="<%=loginMember.getNick()%>" name="bobNick">
							<input type="hidden" value="<%=loginMember.getNo()%>" name="writerNo">
						<%}%>
						<section class="cmt_inp">
						<div class="cmt_count">&nbsp;댓글&nbsp;<span id="count">0</span></div>
						
						<span class="cmt_w" id="cmtWriter"> 
						<%if(loginMember != null) {%>
							작성자 : <%=loginMember.getNick() %>
						<%}%>
						</span>
							<div class="cmt_txt">
								<textarea name="comment" id="cmt_content" cols="100" rows="4" placeholder="회원 간의 불편함을 주는 댓글은 자제해주시고 따뜻한 댓글 부탁드립니다.
																			게시물에 문제가 있다면 신고 또는 정중하게 이의제기 해주시길 바랍니다."></textarea>
								&nbsp;<button id="cmt_btn"><span>등록</span></button>
							</div>
							
						</section>
					<!-- </form> -->
						<div>
							
						</div>
							
					<script>
						$('#cmt_btn').click(function(){
								//JSON으로 전달할 파라미터 변수 선언
								const bobno = '${vo.no}';
								const cmtWriter = $('input[name=writerNo]').val();
								const cmtContent = $('#cmt_content').val();
	
								console.log(bobno);
								console.log(cmtWriter);
								console.log(cmtContent);
								if(cmtWriter == ""){
									alert('로그인 후 이용해주세요.');
									return;
								}else if(cmtContent == ""){
									alert('내용을 입력해주세요.');
									return;
								}
								// const data = [bobno, cmtWriter, cmtContent];
							
								$.ajax({
									url:"/cookTeacher/bobstory/cmt",
									type:"get",
									data: {
										"bobNo" : bobno ,
										"writerNo" : cmtWriter ,
										"comment" : cmtContent
									},
									success : function(result){
										const objList = JSON.parse(result);
										console.log(objList);
											$('#cmt_wrap').prepend(
													'<div class="cmt_box">'
													+'<div class="cmt2Writer" style="font-size : 14px; height:40px; line-height:30px">' + objList.writer + '</div>'
													+'<div class="cmt2Content" style = "height:70px; borderL:0; line-height:50px" >' + objList.cmt + '</div>'
													+'<span><a href="/cookTeacher/bobstory/cmt/edit">'+ '수정' + '</a></span>'
													+' '
													+'<span><a href="/cookTeacher/bobstory/cmt/delete">'+ '삭제' + '</a></span>'
													+'<div style="border-bottom:1px solid #aaa; width:860px; height:5px;"></div>'
													+'</div>'
													
											);

										Swal.fire('댓글 작성 성공');
									},
									error : function(){
										alert('ajax error');
									}
								});
						});
					</script>
					</div>
				</div><!-- cmt container-->
				<br>
				<div id="cmt_wrap">
				<%if(cvo != null){ %>
					<%for(int i = 0; i < cvo.size(); i++){ %>
							<div class="cmt_box">
							<input type="hidden" value="<%=cvo.get(i).getCmtNo()%>" name="cmtNo">
							<div class="cmt2Writer"><%=cvo.get(i).getWriter() %></div></div>
							<div class="cmt2Content"><%=cvo.get(i).getCmt() %></div>
							&nbsp;<span><a href="/cookTeacher/bobstory/cmt/edit">수정</a></span>
							<span><a href="/cookTeacher/bobstory/cmt/delete">삭제</a></span>
							<div style="border-bottom:1px solid #aaa; width:860px; height:5px;"></div>
					<%} %>
				<%} %>
				</div>
				
			</div>

			<%@include file="/views/common/footer.jsp" %> <!-- 푸터부분 파일 가져오기-->
		</div><!--container-->
		
</body>
</html>