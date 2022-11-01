package com.kh.cook.bobstory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.PageVo;

@WebServlet(urlPatterns = "/bobstory/mypage/myCookStory")
public class BobMypageController extends HttpServlet{


	//마이페이지
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//회원정보
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
		
		listCount = new BobstoryService().countBobstory(no);
		String pno = req.getParameter("pno");
		if(pno == null) {
			pno = "1";
		}
		currentPage = Integer.parseInt(pno);
		
		pageLimit  = 3;
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
		
		
		List<BobstoryVo> voList = new BobstoryService().selectBobstory(no, pv);
		
		//화면선택
		req.setAttribute("loginMember", loginMember);
		req.setAttribute("voList", voList);
		req.setAttribute("pv", pv);
		req.getRequestDispatcher("/views/bobstory/mypage/myCookStory.jsp").forward(req, resp);
		
	}
}
