package com.kh.cook.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;
import com.kh.cook.product.vo.ProductVo;
@WebServlet(urlPatterns = "/menu/prodInput")
public class MenuProdInputController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodInput = req.getParameter("write-prod");
		
		ProductVo changeInput = new MenuService().changeProdNo(prodInput);
		
		req.setAttribute("changeInput", changeInput);
		req.getRequestDispatcher("/views/menu/menuWrite.jsp").forward(req, resp);		
		
	}
}
