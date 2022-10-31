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
import com.kh.cook.menu.vo.MenuWriteVo;

@WebServlet(urlPatterns = "/menu/newIn")
public class NewInController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	//디비 다녀오기
    	List<MenuWriteVo> writeList = new MenuService().selectNewInList();
    	
    	
    	//회면선택
    	req.setAttribute("writeList", writeList);
    	req.getRequestDispatcher("/views/menu/newIn.jsp").forward(req, resp);
    	
    }

}
