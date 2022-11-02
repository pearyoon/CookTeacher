package com.kh.cook.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.common.PageVo;
import com.kh.cook.notice.service.NoticeService;
import com.kh.cook.notice.vo.NoticeVo;
@WebServlet(urlPatterns = "/notice/list")
public class NoticeListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new NoticeService().selectCount();
		currentPage = Integer.parseInt(req.getParameter("pno"));
		pageLimit = 2;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pVo = new PageVo();
		pVo.setListCount(listCount);
		pVo.setCurrentPage(currentPage);
		pVo.setPageLimit(pageLimit);
		pVo.setBoardLimit(boardLimit);
		
		pVo.setMaxPage(maxPage);
		pVo.setStartPage(startPage);
		pVo.setEndPage(endPage);
		
		List<NoticeVo> voList = new NoticeService().selectList(pVo);
		
		req.setAttribute("pVo", pVo);
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/notice/list.jsp").forward(req, resp);
		
	}
}
