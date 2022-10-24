package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.FAQService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns = "/cs/FAQ/detail")
public class FAQDetailController  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//꺼내기
		String no = req.getParameter("no");
		
		//뭉치기
		
		//디비
		CSVo FAQvo = new FAQService().selectFAQOne(no);
		
		//화면
		req.setAttribute("FAQvo", FAQvo);
		req.getRequestDispatcher("/views/notice/detail.jsp").forward(req, resp);
	
	}

}
