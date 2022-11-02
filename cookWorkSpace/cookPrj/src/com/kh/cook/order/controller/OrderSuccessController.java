package com.kh.cook.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.service.OrderService;

@WebServlet(urlPatterns = "/order/success")
public class OrderSuccessController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		// 회원 불러오기(session)
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		
		// 장바구니 목록 가져오기
		String[] check = req.getParameterValues("check");
		String usePoint = req.getParameter("usePoint");
		String payment = req.getParameter("payment");

		// 디비 다녀오기
		MemberVo cartMember = new OrderService().checkCartMember(no, check);
		List<CartItemVo> cartList = new OrderService().selectCartList(no, check);
		int totalPrice = new OrderService().insertOrder(cartMember, cartList, usePoint, payment);
		
		if(totalPrice != -1) {
			req.setAttribute("totalPrice", totalPrice);
			req.getRequestDispatcher("/views/order/orderSuccess.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
	}
	
}
