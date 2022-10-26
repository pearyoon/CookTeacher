package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/product/mypage_review/myReview")
public class MyReviewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 정보
		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//데이터 꺼내기
		String no = loginMember.getNo();
		
		List<ReviewVo> rvoList = new ProductService().selectMyReview(no);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("loginMember", loginMember);
		req.setAttribute("rvoList", rvoList);
		req.getRequestDispatcher("/views/product/mypage_review/myReview.jsp").forward(req, resp);
		

	}

}
