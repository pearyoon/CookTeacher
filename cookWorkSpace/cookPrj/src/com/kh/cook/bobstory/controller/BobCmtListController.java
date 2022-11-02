package com.kh.cook.bobstory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobCmtService;
import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.bobstory.vo.PageVo;

@WebServlet(urlPatterns = "/bobstory/cmt/list")
public class BobCmtListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이지번호 가져오기
		String no = req.getParameter("no");
		
		//페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new BobCmtService().selectCount();
		currentPage = Integer.parseInt(req.getParameter("pno"));
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
		List<BobCmtVo> cmtList = new BobCmtService().selectList(pv);
		
		req.setAttribute("cmtList", cmtList);
		req.setAttribute("pv", pv);
		
		//화면 선택
		resp.sendRedirect("/cookTeacher/report/list?no=" + no);
		
		
	}
	
}
