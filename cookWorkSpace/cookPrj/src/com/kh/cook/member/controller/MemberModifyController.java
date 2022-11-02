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
@WebServlet(urlPatterns = "/login/mypage/member/modify")
public class MemberModifyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/views/member/mypage/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession ss = req.getSession();
		MemberVo loginMember = (MemberVo)ss.getAttribute("loginMember");
		
		String no = loginMember.getNo();
		String id = req.getParameter("memberId");
		String pwd = req.getParameter("memberPwd1");
		String name = req.getParameter("memberName");
		String nick = req.getParameter("memberNick");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("detailAddr");
		String profile = req.getParameter("profileUrl");
		
		System.out.println(pwd);
		System.out.println(loginMember.getPwd());
		
		if(pwd == "") {
			pwd = loginMember.getPwd();
		}
		
		if(profile == null) {
			profile = "";
		}
		
		
		MemberVo vo = new MemberVo();
		
		vo.setNo(no);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setNick(nick);
		vo.setEmail(email);
		vo.setPhone(phone);
		vo.setAddr(addr+","+detailAddr);
		vo.setProfile(profile);
		
		
		MemberVo updateMember = new MemberService().modify(vo);
		
		if(updateMember != null) {
			ss.setAttribute("alertMsg", "회원정보 수정 완료!");
			ss.setAttribute("loginMember", updateMember);
			resp.sendRedirect("/cookTeacher/login/mypage/member/check");
		} else {
			req.setAttribute("errorMsg", "회원수정실패");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
	}
}
