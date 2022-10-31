package com.kh.cook.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.common.PageVo;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/admin/member/search")
public class AdminMemberSearchController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.getRequestDispatcher("/views/member/admin/list.jsp").forward(req, resp);
	}
}
