package com.kh.cook.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;
import com.kh.cook.menu.vo.MenuVo;
@WebServlet(urlPatterns = "/menu/detail")
public class MenuDetailController extends HttpServlet{
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//데이터 보내기
    	String no = req.getParameter("no");
    	//디비 다녀오기
    	MenuVo vo = new MenuService().selectMenuOne(no);
    	
    	//화면선택
    	req.setAttribute("vo", vo);
    	req.getRequestDispatcher("/views/menu/detail.jsp").forward(req, resp);
    }
    


}
