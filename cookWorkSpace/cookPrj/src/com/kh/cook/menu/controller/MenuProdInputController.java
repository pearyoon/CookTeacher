package com.kh.cook.menu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cook.menu.service.MenuService;
import com.kh.cook.product.vo.ProductVo;
@WebServlet(urlPatterns = "/menu/prodInput")
public class MenuProdInputController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodInput = req.getParameter("write-prod");
		PrintWriter out = resp.getWriter();
		
		ProductVo changeInput = new MenuService().changeProdNo(prodInput);
		
		HashMap<String, ProductVo> map = new HashMap<>();
		
		map.put("first", changeInput);
		
		Gson gson = new Gson();
		
		String str = gson.toJson(map);
		
		out.write(str);
		
	}
}
