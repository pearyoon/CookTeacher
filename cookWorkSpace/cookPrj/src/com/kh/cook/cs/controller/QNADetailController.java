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

@WebServlet(urlPatterns="/cs/QnA/detail")
public class QNADetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		boolean isAdmin = loginMember != null && loginMember.getId().equals("admin01");
		
			//관리자일 때
			String qnaNo = req.getParameter("no");
			
			CSVo QNAvo = new QNAService().selectQNAone(qnaNo);
			CSCommentVo cvo = new QNAService().selectReplyOne(qnaNo);
			
		if(isAdmin || loginMember != null && loginMember.getNo().equals(QNAvo.getNo())) {
			req.setAttribute("QNAvo", QNAvo);
			req.setAttribute("cvo", cvo);
			req.setAttribute("msg","문의 작성자만 열람 가능합니다.");
			req.getRequestDispatcher("/views/cs/QnA/detail.jsp").forward(req, resp);
		} else {
			//관리자 아닐 때
			req.setAttribute("msg","권한이 없습니다.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
		
	
	
	
	}

}
