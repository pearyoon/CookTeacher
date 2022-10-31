package com.kh.cook.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.common.PageVo;
import com.kh.cook.common.Paging;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/admin/member/list")
public class AdminMemberListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("search");
		String quitYn = req.getParameter("quitYn");
		String all = req.getParameter("member");
		
		MemberVo vo = new MemberVo();
		
		vo.setNo(all);
		vo.setId(id);
		vo.setQuitYn(quitYn);
		
		
		
		//페이징 처리
		
		PageVo pvo = new Paging().paging(Integer.parseInt(req.getParameter("pno")),vo);
		
		
		List<MemberVo> voList = null;

		if(quitYn != null) {
			voList = new AdminService().selectListByQuit(pvo,quitYn);
		} else if(id != null) {
			voList = new AdminService().selectListById(pvo, id);
		} else {
			voList = new AdminService().selectList(pvo);
		}
		

		req.setAttribute("search", id);
		req.setAttribute("quitYn", quitYn);
		req.setAttribute("pvo", pvo);
		req.setAttribute("memberList", voList);
		
		
		req.getRequestDispatcher("/views/member/admin/list.jsp").forward(req, resp);
	}
}

