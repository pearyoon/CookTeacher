package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
@WebServlet(urlPatterns = "/member/join/dupCheck/id")
public class MemberDupIdController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("inputId");
		
		int result = new MemberService().dupCheckId(id);
		
		String idCheck = result + "";
		
		resp.getWriter().write(idCheck);
	}
}
