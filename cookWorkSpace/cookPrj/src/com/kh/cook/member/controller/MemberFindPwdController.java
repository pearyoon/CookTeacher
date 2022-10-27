package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/member/find/pwd")
public class MemberFindPwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/find/pwd.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("memberId");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		MemberVo vo = new MemberVo();
		
		vo.setId(id);
		vo.setPhone(phone);
		vo.setEmail(email);
		
		String no = new MemberService().findPwd(vo);
		
		if(no != null) {
			// 찾기 성공 1
			req.getSession().setAttribute("no", no);
			resp.getWriter().write(no);
		} else {
			// 찾기 실패 0
			resp.getWriter().write("findFail");
		}
	}
}
