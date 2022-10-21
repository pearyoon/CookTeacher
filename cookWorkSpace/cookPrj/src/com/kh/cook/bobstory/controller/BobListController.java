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
		//페이징 처리
		int listCount;		//총 개시글 갯수
		int currentPage;	//현재 페이지
		int pageLimit;		//페이징 바 최대 갯수
		int boardLimit;		//게시글 최대 갯수
		//위의 4개로 아래 3개 값 구하기
		int maxPage;		//가장 마지막 페이지
		int startPage;		//페이징바 시작 페이지
		int endPage;		//페이징바 종료 페이지
		
		listCount = new BobstoryService().selectCount();
		currentPage = Integer.parseInt(req.getParameter("pno"));
		pageLimit = 5;
		boardLimit = 5;
		//한 화면에서 페이지 최대갯수 5개, 게시글 5개 (페이지 뻥튀기하기)
		
		//Math.ceil??? ㅋㅋㅋㅋㅋ 멀라...
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		//페이징바 시작 페이지 = (현재 페이지 -1) / 페이징바 최대갯수 * 페이징바 최대 갯수 +1
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		 
		//페이징바 종료 페이지
		endPage = startPage + pageLimit -1;
		
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
