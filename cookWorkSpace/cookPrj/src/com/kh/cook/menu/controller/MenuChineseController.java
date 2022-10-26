package com.kh.cook.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;
import com.kh.cook.menu.vo.MenuVo;

@WebServlet(urlPatterns = "/menu/chinese")
public class MenuChineseController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	//디비 다녀오기
    	List<MenuVo> voList = new MenuService().selectChineseList();
    	
    	//회면선택
    	req.setAttribute("voList", voList);
    	req.getRequestDispatcher("/views/menu/chinese.jsp").forward(req, resp);
    	
    }

}
