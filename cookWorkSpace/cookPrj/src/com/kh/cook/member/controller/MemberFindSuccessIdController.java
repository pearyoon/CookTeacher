package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/member/find/success/id")
public class MemberFindSuccessIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ss = req.getSession();
		MemberVo findMember = (MemberVo)ss.getAttribute("findMember");
		
		if(findMember==null) {
			req.setAttribute("errorMsg", "로그인 후 이용해주세요.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
			return;
		}
		
		req.getRequestDispatcher("/views/member/find/success/id.jsp").forward(req, resp);
	}
}
