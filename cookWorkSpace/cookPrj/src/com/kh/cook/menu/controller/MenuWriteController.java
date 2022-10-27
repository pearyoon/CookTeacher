package com.kh.cook.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;
import com.kh.cook.menu.vo.MenuCateVo;
@WebServlet(urlPatterns = "/menu/write")

@MultipartConfig(
//		location = "/khtmp",
		fileSizeThreshold = 1024 * 1024 ,
		//파일 한 개 자체의 사이즈(기억할 것 1)
		maxFileSize = 1024 * 1024 * 50,
		//리퀘스트 총 크기(기억할 것 2)
		maxRequestSize = 1024 * 1024 * 50 * 5
	)
public class MenuWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<MenuCateVo> cateList = new MenuService().selectMenuCateList();
		String result = new MenuService().menuNum();
		
		req.setAttribute("result", result);
		req.setAttribute("MenuCateList", cateList);
		req.getRequestDispatcher("/views/menu/menuWrite.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}
}
