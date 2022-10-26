package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/member/join")
public class MemberJoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/join.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("memberId");
		String pwd = req.getParameter("memberPwd1");
		String name = req.getParameter("memberName");
		String nick = req.getParameter("memberNick");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("detailAddr");
		
		MemberVo vo = new MemberVo();
		vo.setAddr(addr+","+detailAddr);
		vo.setEmail(email);
		vo.setId(id);
		vo.setName(name);
		vo.setNick(nick);
		vo.setPhone(phone);
		vo.setPwd(pwd);
		
		int result = new MemberService().join(vo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "회원가입 성공!");
			resp.sendRedirect("/cookTeacher/member/login");
		} else {
			req.setAttribute("errorMsg", "회원가입 실패");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}
}
