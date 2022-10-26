package com.kh.cook.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;

@WebServlet(urlPatterns = "/product/detail/productCart")
public class ProductCartController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String num = req.getParameter("p_num1");
		
		CartVo vo = new CartVo();
		vo.setCnt(num);
		
		//디비 다녀오기
		int cvo = new CartService().addCart(vo);
		
		req.setAttribute("vo", vo);
		
		req.getRequestDispatcher("/views/product/detail/productCart.jsp").forward(req, resp);
	}
}
