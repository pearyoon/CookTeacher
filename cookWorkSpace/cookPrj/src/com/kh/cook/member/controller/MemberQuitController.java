package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/login/member/mypage/quit")
public class MemberQuitController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/mypage/quit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ss = req.getSession();
		MemberVo loginMember = (MemberVo)ss.getAttribute("loginMember");
		
		String no = loginMember.getNo();
		String id = loginMember.getId();
		String pwd = req.getParameter("memberPwd");
		
		MemberVo vo = new MemberVo();
		
		vo.setNo(no);
		vo.setPwd(pwd);
		vo.setId(id);
		
		
		
		int result = new MemberService().quit(vo);
		
		if(result == 1) {
			resp.sendRedirect("/cookTeacher/member/logout");
		} else {
			req.setAttribute("alertMsg","비밀번호를 확인해주세요.");
			req.getRequestDispatcher("/views/member/mypage/quit.jsp").forward(req, resp);
		}
	}
}
