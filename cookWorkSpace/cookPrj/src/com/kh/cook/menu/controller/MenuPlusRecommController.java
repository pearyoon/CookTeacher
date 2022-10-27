package com.kh.cook.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;

@WebServlet(urlPatterns = "/menu/plusRecomm")
public class MenuPlusRecommController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		String result = new MenuService().plusRecommOne(no);
		
		resp.getWriter().write(result);
	
	}
}
