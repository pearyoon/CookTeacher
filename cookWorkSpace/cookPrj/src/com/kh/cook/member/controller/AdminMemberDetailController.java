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
@WebServlet(urlPatterns = "/admin/member/detail")
public class AdminMemberDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		MemberVo vo = new MemberService().selectOneByNo(no);
		
//		req.getSession().setAttribute("userVo", vo);
		
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/views/member/admin/detail.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String id = req.getParameter("memberId");
		String name = req.getParameter("memberName");
		int point = Integer.parseInt(req.getParameter("point"));
		String grade = req.getParameter("grade");

		
		MemberVo vo = new MemberVo();
		
		vo.setNo(no);
		vo.setId(id);
		vo.setName(name);
		vo.setPoint(point);
		vo.setGrade(grade);
		
		
		
		int result = new AdminService().updateMember(vo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "수정 완료");
			resp.sendRedirect("/cookTeacher/admin/member/detail?no="+vo.getNo());
		} else {
			req.getSession().setAttribute("alertMsg", "수정 실패");
			resp.sendRedirect("/cookTeacher/admin/member/detail?no="+vo.getNo());
		}
		
	}
}
