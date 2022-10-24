package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cs.service.FAQService;
import com.kh.cook.cs.vo.CSVo;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns="/cs/FAQ/write")
public class FAQWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		boolean isAdmin = loginMember != null && loginMember.getId().equals("admin");
		
		if(isAdmin) {
			//관리자일 때
			req.getRequestDispatcher("/views/cs/FAQ/write.jsp").forward(req, resp);
		} else {
			//관리자 아닐 때
			req.setAttribute("msg","권한이 없습니다.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션
		HttpSession s  = req.getSession();
		//로그인멤버
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//꺼
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//뭉
		CSVo vo = new CSVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(loginMember.getNo());
		
		//디비
		int result = new FAQService().write(vo);
		
		//화면
		if(result == 1) {
			resp.sendRedirect("/cookTeacher/cs/FAQ/list");
		} else {
			// 작성 실패 메세지, 에러페이지 포워딩
			req.setAttribute("alertMsg", "FAQ 작성 실패!");
			req.getRequestDispatcher("views/common/errorPage.jsp").forward(req, resp);
		}
	
	}
}
