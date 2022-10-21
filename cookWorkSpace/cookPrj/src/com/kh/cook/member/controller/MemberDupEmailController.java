package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
@WebServlet(urlPatterns = "/member/join/dupCheck/email")
public class MemberDupEmailController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("inputEmail");
		
		int result = new MemberService().dupCheckEmail(email);
		
		resp.getWriter().write(result + "");
	}
}
