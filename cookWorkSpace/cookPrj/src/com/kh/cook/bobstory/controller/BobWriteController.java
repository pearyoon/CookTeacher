package com.kh.cook.bobstory.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.CategoryVo;
import com.kh.cook.bobstory.controller.FileUploader;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/bobstory/write")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, //한번에 핸들링 할 수 있는 최대 사이즈
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 50 * 5
		)
public class BobWriteController extends HttpServlet{

	//글쓰기 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면 보여줘도 되는지 검사
		
		if(req.getSession().getAttribute("loginMember") == null) {
			req.setAttribute("msg", "로그인 후 이용해주세요");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
			return;
		}
		
		//디비 다녀오기
		 List<CategoryVo> cateList = new BobstoryService().selectCategoryList();
		 
		 req.setAttribute("cateList", cateList);
		 
		 //화면 선택
		req.getRequestDispatcher("/views/bobstory/write.jsp").forward(req, resp);
	}
	
	//글쓰기 + 파일
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 가져오기
		HttpSession s = req.getSession();
		
		//로그인 멤버 가져오기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//데이터 꺼내기
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Part file = req.getPart("file");
		
		AttachmentVo avo = null;
		//----------------파일 업로드 start ----------------------
		
		String rootPath = req.getServletContext().getRealPath("/");
		//파일 정보 디비에 저장(파일 있을때)
		if(file.getSubmittedFileName().length() > 0) {
			avo = FileUploader.uploadFile(file, rootPath);
		}
		//----------------파일 업로드 end ------------------------
		
		//데이터 뭉치기
		BobstoryVo vo = new BobstoryVo();
		vo.setCategory(category);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(loginMember.getNo());
		
		//디비 다녀오기
		int result = new BobstoryService().write(vo, avo);
		
		//화면 선택
		if(result == 1) {
			//게시글 작성 성공
			s.setAttribute("alertMsg", "게시글 작성 성공 !!!");
			resp.sendRedirect("/cookTeacher/bobstory/list?pno=1");
		}else {
			//게시글 작성 실패
			if(avo != null) {
				String savePath = rootPath + avo.getFilePath() + "/" + avo.getChangeName();
				new File(savePath).delete();
			}
			req.setAttribute("msg", "게시글 작성 실패...ㅠㅠ");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
	}
}
