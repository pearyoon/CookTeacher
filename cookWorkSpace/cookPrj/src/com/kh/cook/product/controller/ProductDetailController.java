package com.kh.cook.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;

@WebServlet(urlPatterns = "/product/main/productDetail")
public class ProductDetailController extends HttpServlet {

	//식재료 상세 조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String prodNo = req.getParameter("prodNo");
		
		//데이터 뭉치기
		
		//디비 다녀오기
		ProductVo vo = new ProductService().selectProductOne(prodNo);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/views/product/main/productDetail.jsp").forward(req, resp);
	
	}

}

