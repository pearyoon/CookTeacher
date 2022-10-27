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
import com.kh.cook.product.vo.ProductVo;
@WebServlet(urlPatterns = "/menu/detail")
public class MenuDetailController extends HttpServlet{
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//데이터 보내기
    	String no = req.getParameter("no");
//    	String cntNo = req.getParameter("cntNo");
    	
    	//디비 다녀오기
    	MenuVo vo = new MenuService().selectMenuOne(no);
//    	int result = new MenuService().plusRecommOne(no);
    	List<ProductVo> prodList = new MenuService().selectProdList(no);
    	
    	//화면선택
    	req.setAttribute("vo", vo);
    	
    	if(prodList == null) {
    		System.out.println("null");
    	}else {
    		req.setAttribute("no", no);
    		req.setAttribute("prodList", prodList);
    		req.getRequestDispatcher("/views/menu/detail.jsp").forward(req, resp);
    		
    	}
    	
//    	if(result == 1) {
//    		resp.sendRedirect("/cookTeacher/menu/detail?no="+ no +"cntNo=" + cntNo);
//    	}else {
//    		System.out.println("카운팅 실 패 !!");
//    	}
    	
    }
    
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    	
//    	//일단 .prodNo 이랑 
//    	String prodNo[] = req.getParameterValues("prodNo");
//    	String prodCnt[] = req.getParameterValues("prodCnt");
//
//    	
//    
//    }

}
