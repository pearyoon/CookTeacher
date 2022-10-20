package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/member/find/id")
public class MemberFindIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/find/id.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("memberName");
		String email = req.getParameter("memberEmail");
		
		MemberVo vo = new MemberVo();
		
		vo.setName(name);
		vo.setEmail(email);
		
		String findId = new MemberService().findId(vo);
		
		if(findId != null) {
			
			req.getSession().setAttribute("alertMsg", "찾으시는 아이디는 "+findId+"입니다.");
			resp.sendRedirect("/cookTeacher/member/login");
		} else {
			req.setAttribute("errorMsg", "아이디찾기 실패");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}
}
