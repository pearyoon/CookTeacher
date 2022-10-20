package com.kh.cook.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.FAQService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns="/cs/FAQ/list")
public class FAQListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<CSVo> FAQList = new FAQService().selectFAQList();
		
		req.setAttribute("FAQList", FAQList);
		
		req.getRequestDispatcher("/views/cs/FAQ/list.jsp").forward(req, resp);
	
	
	}

}
