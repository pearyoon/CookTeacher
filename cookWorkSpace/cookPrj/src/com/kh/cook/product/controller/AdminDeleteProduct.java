package com.kh.cook.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;

@WebServlet(urlPatterns = "/product/main/admin_deleteProduct")
public class AdminDeleteProduct extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/product/main/admin_deleteProduct.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String cateNo = req.getParameter("cateNo");
		String name = req.getParameter("name");
		
		
		//데이터 뭉치기
		ProductVo vo = new ProductVo();
		vo.setCateNo(cateNo);
		vo.setName(name);
		
		System.out.println(cateNo);
		System.out.println(name);
		
		//디비 다녀오기
		int result = new ProductService().deleteProduct(vo);
		System.out.println(result);
		
		//화면선택
		if(result == 1) {
			//성공 => 알람 , 리스트조회
			req.getSession().setAttribute("alertMsg", "상품 삭제 성공!");
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/views/product/detail/productDetail.jsp").forward(req, resp);
		}else {
			//실패 => 메세지 , 에러페이지
			req.setAttribute("msg", "공지사항 삭제 실패...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
	}
}
