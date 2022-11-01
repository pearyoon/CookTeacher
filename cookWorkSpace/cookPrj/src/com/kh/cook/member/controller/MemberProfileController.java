package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.cook.common.AttachmentVo;
import com.kh.cook.common.FileUploader;
@WebServlet(urlPatterns = "/login/member/profile/upload")

//멀티파트 설정
@MultipartConfig(
			//location = "/khtmp" ,
			fileSizeThreshold = 1024 * 1024 * 50,
			maxFileSize = 1024 * 1024 *50,           // 파일 한 개 당 크기
			maxRequestSize = 1024 * 1024 * 50 * 5 	 // 파일 총 크기
		)

public class MemberProfileController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/mypage/upload.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part f = req.getPart("f");
		AttachmentVo attVo = null;
		
		String rootPath =  req.getServletContext().getRealPath("/");
		if(f.getSubmittedFileName().length() > 0) {
			attVo = FileUploader.uploadFile(f, rootPath);
		}
		
		req.getSession().setAttribute("attVo", attVo);
		resp.sendRedirect("/cookTeacher/login/member/profile/upload");
		

	}
}
