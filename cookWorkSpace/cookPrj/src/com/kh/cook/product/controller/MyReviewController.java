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
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/login/mypage/review")
public class MyReviewController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		String no = loginMember.getNo();
		
		List<ReviewVo> rvoList = new ProductService().selectMyReview(no);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("loginMember", loginMember);
		req.setAttribute("rvoList", rvoList);
		req.getRequestDispatcher("/cookTeacher/views/product/mypage_review/myReview.jsp").forward(req, resp);
		
	}

}
