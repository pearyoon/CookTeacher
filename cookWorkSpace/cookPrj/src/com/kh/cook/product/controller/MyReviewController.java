package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.product.vo.PageVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/product/mypage/myReview")
public class MyReviewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//로그인 정보
		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//데이터 꺼내기
		String no = loginMember.getNo();
		
		//페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new ProductService().selectMyReviewCount(no);
		
		String pno = req.getParameter("pno");
		
		if(pno == null) {
			pno = "1";
		}
		currentPage = Integer.parseInt(pno);
		
		pageLimit  = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int n = (currentPage - 1) / pageLimit;
		startPage = n * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pv = new PageVo();
		pv.setListCount(listCount);
		pv.setCurrentPage(currentPage);
		pv.setPageLimit(pageLimit);
		pv.setBoardLimit(boardLimit);
		pv.setMaxPage(maxPage);
		pv.setStartPage(startPage);
		pv.setEndPage(endPage);
		
		
		List<ReviewVo> rvoList = new ProductService().selectMyReview(no, pv);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("loginMember", loginMember);
		req.setAttribute("rvoList", rvoList);
		req.setAttribute("pv", pv);
		req.getRequestDispatcher("/views/product/mypage/myReview.jsp").forward(req, resp);
		

	}

}
