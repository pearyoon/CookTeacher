package com.kh.cook.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.common.PageVo;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/admin/member/list")
public class AdminMemberListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//페이징 처리
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdminService().selectCount();
		currentPage = Integer.parseInt(req.getParameter("pno"));
		pageLimit = 2;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo pvo = new PageVo();
		pvo.setListCount(listCount);
		pvo.setCurrentPage(currentPage);
		pvo.setPageLimit(pageLimit);
		pvo.setBoardLimit(boardLimit);
		
		pvo.setMaxPage(maxPage);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		
		String quitYn = req.getParameter("quitYn");
		List<MemberVo> voList = null;


		
		if("y".equals(quitYn)){
			voList = new AdminService().selectQuitYMember(pvo);
		} else if("n".equals(quitYn)) {
			voList = new AdminService().selectQuitNMember(pvo);
		} else {
			voList = new AdminService().selectList(pvo);
		}
		
		req.setAttribute("quitYn", quitYn);
		req.setAttribute("pvo", pvo);
		req.setAttribute("memberList", voList);
		
		
		req.getRequestDispatcher("/views/member/admin/list.jsp").forward(req, resp);
	}
}

