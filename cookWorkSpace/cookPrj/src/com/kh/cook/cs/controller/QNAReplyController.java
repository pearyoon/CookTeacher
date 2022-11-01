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

@WebServlet(urlPatterns="/cs/QnA/reply")
public class QNAReplyController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면 보여주기
		
		String Qno = req.getParameter("no");
		
		CSVo QNAvo = new QNAService().selectQNAone(Qno);
		
		req.setAttribute("QNAvo", QNAvo);
		req.getRequestDispatcher("/views/cs/QnA/reply.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//세션
		HttpSession s = req.getSession();
		
		//로그인멤버 가져오기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//데이터 꺼내기
		String content = req.getParameter("content");
		String Qno = req.getParameter("no");
		
		//뭉치기
		CSCommentVo cvo = new CSCommentVo();
		cvo.setCmtContent(content);
		cvo.setQpostNo(Qno);
		cvo.setWriterNo(loginMember.getNo());
		
		//디비
		int result = new QNAService().reply(cvo);
		
		//화면선택
		if(result == 1) {
			resp.sendRedirect("/cookTeacher/cs/QnA/detail?no="+ Qno);
		} else {
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}

}
