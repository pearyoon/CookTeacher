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
@WebServlet(urlPatterns = "/login/mypage/member/check")
public class MemberCheckPwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/mypage/check.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ss = req.getSession();
		MemberVo loginMember = (MemberVo)ss.getAttribute("loginMember");
		
		String id = loginMember.getId();
		String pwd = req.getParameter("memberPwd");
		
		
		MemberVo vo = new MemberVo();
		vo.setId(id);
		vo.setPwd(pwd);
		
		MemberVo loginCheck = new MemberService().selectOne(vo);
	
		if(loginCheck != null) {
			ss.setAttribute("loginMember", loginCheck);
			resp.sendRedirect("/cookTeacher/login/mypage/member/modify");
		} else {
			req.setAttribute("loginFail", "loginFail");
			req.getRequestDispatcher("/views/member/mypage/check.jsp").forward(req, resp);
		}
	}
}
