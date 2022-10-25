package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/product/detail/productDetail")
public class ProductDetailController extends HttpServlet {

	//식재료 상세 조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String no = req.getParameter("no");
		
		//데이터 뭉치기
		
		//디비 다녀오기
		ProductVo vo = new ProductService().selectProductOne(no);
		List<ReviewVo> rvoList = new ProductService().selectReview(no);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("vo", vo);
		req.setAttribute("rvoList", rvoList);
		req.getRequestDispatcher("/views/product/detail/productDetail.jsp").forward(req, resp);
	
	}

}

