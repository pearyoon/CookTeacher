package com.kh.cook.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cart/add")
public class AddCartController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
		
		// 회원이 아니면 로그인 페이지로 이동
		if(loginMember == null) {
			resp.sendRedirect("/cookTeacher/member/login");
			return;
		}
		
		// 입력된 식재료를 가져오기
		String prodNo[] = req.getParameterValues("prodNo");
    	String cnt[]  = req.getParameterValues("cnt");
		String memberNo = loginMember.getNo();
		
		// 데이터 뭉치기
		List<CartVo> list = new ArrayList<CartVo>();

    	for(int i=0; i< prodNo.length; i++) {
    		CartVo vo = new CartVo();
    		vo.setProdNo(prodNo[i]);
    		vo.setCnt(cnt[i]);
    		vo.setNo(memberNo);
    		
    		list.add(vo);
    		
    	}

		// 서비스 다녀오기
		int result = new CartService().addCart(list);

		// 화면 보여주기
		if(result == 1) {
			req.setAttribute("cartMsg", true);
			resp.sendRedirect("/cookTeacher/cart/list");
		}else {
			req.setAttribute("errorMsg", "잠시 후 다시 이용해주세요");
			req.getRequestDispatcher("/views/member/login.jsp").forward(req, resp);
		}

	}
	
}
