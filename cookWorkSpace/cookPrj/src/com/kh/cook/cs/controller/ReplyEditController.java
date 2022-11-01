package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cs.service.FAQService;
import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSCommentVo;
import com.kh.cook.cs.vo.CSVo;
import com.kh.cook.member.vo.MemberVo;


@WebServlet(urlPatterns="/cs/QnA/editreply")
public class ReplyEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면 보여주기
		
		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		boolean isAdmin = loginMember != null && loginMember.getId().equals("admin01");
		
		if(isAdmin) {
			//관리자일 때
			String Qno = req.getParameter("no");
			
			CSVo QNAvo = new QNAService().selectQNAone(Qno);
			CSCommentVo cvo = new QNAService().selectReplyOne(Qno);
			
			req.setAttribute("QNAvo", QNAvo);
			req.setAttribute("cvo", cvo);
			req.getRequestDispatcher("/views/cs/QnA/editreply.jsp").forward(req, resp);
			
		} else {
			//관리자 아닐 때
			req.setAttribute("msg","권한이 없습니다.");
		}
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String content = req.getParameter("content");
		String Qno = req.getParameter("no");

		CSCommentVo cvo = new CSCommentVo();
		
		cvo.setCmtContent(content);
		cvo.setQpostNo(Qno);
		
		int result = new QNAService().editreply(cvo);
		
		if(result == 1) {
			resp.sendRedirect("/cookTeacher/cs/QnA/detail?no="+ Qno);
		} else {
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}
}
