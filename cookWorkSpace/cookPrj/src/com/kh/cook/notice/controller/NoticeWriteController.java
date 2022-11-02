package com.kh.cook.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.notice.service.NoticeService;
import com.kh.cook.notice.vo.NoticeVo;
@WebServlet(urlPatterns = "/admin/notice/write")
public class NoticeWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/notice/write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession ss = req.getSession();
		MemberVo loginMem = (MemberVo)ss.getAttribute("loginMember");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		NoticeVo vo = new NoticeVo();
		
		vo.setWriter(loginMem.getNo());
		vo.setContent(content);
		vo.setTitle(title);
		
		
		int result = new NoticeService().write(vo);
		
		if(result == 1) {
			ss.setAttribute("alertMsg", "작성 완료!");
			resp.sendRedirect("/cookTeacher/notice/list?pno=1");
		} else {
			req.setAttribute("errorMsg", "작성실패...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}
}
