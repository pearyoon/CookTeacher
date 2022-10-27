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

@WebServlet(urlPatterns = "/product/detail/ReviewWrite")
public class ReviewWriteController extends HttpServlet {
	
	//리뷰 작성 화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 꺼내기
		HttpSession s = req.getSession();
		
		//로그인 멤버 꺼내기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		if(loginMember == null) {
			req.getRequestDispatcher("/member/login").forward(req, resp);
		}else {
			String reviewNo = req.getParameter("rno");
			req.setAttribute("reviewNo", reviewNo);
			
			req.getRequestDispatcher("/views/product/detail/ReviewWrite.jsp").forward(req, resp);
			
		}

	}
	
	//리뷰 작성하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션 꺼내기
		HttpSession s = req.getSession();
		
		//로그인 멤버 꺼내기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//데이터 꺼내기
		String prodNo = req.getParameter("prodNo");
		String content = req.getParameter("content");
		
		
		System.out.println(prodNo);
		System.out.println(content);
		
		//데이터 뭉치기
		ReviewVo rvo = new ReviewVo();
		rvo.setNo(loginMember.getNo());
		rvo.setContent(content);
		rvo.setProdNo(prodNo);
		
		//디비 다녀오기
		int result = new ProductService().write(rvo);
		
		//화면 선택
		if(result == 1) {
			//작성 성공 => 알람 메세지, 리스트 화면으로 리다이렉트
			s.setAttribute("alertMsg", "리뷰 작성 완료 !");
			req.setAttribute("rvo", rvo);
			resp.sendRedirect("/cookTeacher/product/detail/productDetail?no="+ prodNo);
		}else {
			//작성 실패 => 메세지, 에러 페이지 포워딩
			req.setAttribute("msg", "리뷰 작성 실패 ...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}

	
	}

}