package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.member.service.MemberService;
@WebServlet(urlPatterns = "/member/dupCheck/id")
public class MemberDupCheckIdController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setContentType("text/plain; charset=UTF-8;");
		
		String id = req.getParameter("inputId");
		System.out.println(id);
		
		String result = new MemberService().dupCheckId(id);
		
		resp.getWriter().write(result);
	}
}
