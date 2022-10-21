package com.kh.cook.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.common.PageVo;
import com.kh.cook.cs.service.FAQService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns="/cs/FAQ/list")
public class FAQListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//페이징 처리
		int listCount;		//한 페이지에 보이는 글 갯수에 따라 결정되는 페이지 갯수
		int currentPage; 	//현재페이지
		int pageLimit;		//한 페이지에서 보이는 페이지 갯수
		int boardLimit;		//한 페이지에서 보이는 글 갯수
		
		int maxPage;		//맨마지막최대페이지
		int startPage;		//현재페이지에서 보이는 시작페이지 숫자
		int endPage;		//현재페이지에서 보이는 마지막페이지 숫자
		
		listCount = new FAQService().pageSelectCount();
		currentPage = Integer.parseInt(req.getParameter("pno"));
		System.out.println(currentPage);//출력확인용
		pageLimit = 10;
		boardLimit = 10;
		
		System.out.println(listCount);//출력확인용
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1) / pageLimit* pageLimit + 1;
		endPage = startPage+pageLimit - 1;
		
		if(endPage>maxPage) {
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
		
		System.out.println(pv);//출력확인용
		
		//디비다녀오기
		List<CSVo> FAQList = new FAQService().selectFAQList(pv);
		
		//화면선택
		req.setAttribute("FAQList", FAQList);
		req.setAttribute("pv", pv);
		
		req.getRequestDispatcher("/views/cs/FAQ/list.jsp").forward(req, resp);
	
	
	}

}
