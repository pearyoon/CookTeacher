package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.PageVo;
import com.kh.cook.product.vo.ProductVo;

@WebServlet(urlPatterns = "/product/main/noodleBreadList")
public class NoodleBreadListController extends HttpServlet {

	//화면 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new BobstoryService().selectCount();
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
		
		//디비 다녀오기
		List<ProductVo> voList = new ProductService().selectNoodleBreadList(pv);
		
		//화면선택
		req.setAttribute("voList", voList);
		req.setAttribute("pv", pv);

		req.getRequestDispatcher("/views/product/main/noodleBreadList.jsp").forward(req, resp);
		
	}
}
