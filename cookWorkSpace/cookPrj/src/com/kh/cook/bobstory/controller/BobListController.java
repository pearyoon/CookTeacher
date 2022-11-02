package com.kh.cook.bobstory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.PageVo;

@WebServlet(urlPatterns = "/bobstory/list")
public class BobListController extends HttpServlet{

	//게시판 조회
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
		
		 List<BobstoryVo> voList = new BobstoryService().selectList(pv);
		
		req.setAttribute("voList", voList);
		req.setAttribute("pv", pv);
				
		//화면 선택
		req.getRequestDispatcher("/views/bobstory/list.jsp").forward(req, resp);
	}

	
}
