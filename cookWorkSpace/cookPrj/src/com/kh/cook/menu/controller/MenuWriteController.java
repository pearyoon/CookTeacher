package com.kh.cook.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.cook.menu.service.MenuService;
import com.kh.cook.menu.vo.MenuCateVo;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.product.vo.ProductVo;
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
		
//		String prodInput = req.getParameter("write-prod");
		
//		ProductVo changeInput = new MenuService().changeProdNo(prodInput);
		
		

		
		//새로운 메뉴 넘버
		req.setAttribute("result", result);
		//메뉴 카테고리
		req.setAttribute("MenuCateList", cateList);
		//넘버로 바꿔서 입력
//		req.setAttribute("changeInput", changeInput);
		
		req.getRequestDispatcher("/views/menu/menuWrite.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String menuCate = req.getParameter("menuCate");
		String reName = req.getParameter("re-name");
		String reInfo = req.getParameter("re-info");
		String cal = req.getParameter("cal");
		String content = req.getParameter("content");
		Part f = req.getPart("f");
		String writeProd = req.getParameter("write-prod");
		
		MenuVo menuVo = null;
		
		String rootPath = req.getServletContext().getRealPath("/");
		if(f.getSubmittedFileName().length() > 0) {
			// req.getServletContext().getRealPath("/") <- 최상단 경로
			menuVo = MenuFileUplaoder.uploadFile(f, rootPath);
			
		}
	
	}
}
