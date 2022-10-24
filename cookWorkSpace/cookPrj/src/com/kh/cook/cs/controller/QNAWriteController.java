package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSVo;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cs/QnA/write")
public class QNAWriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//화면 보여줘도 되는지 검사
		HttpSession s = req.getSession();
		
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		if(req.getSession().getAttribute("loginMember") != null) {
			//관리자일 때
			req.getRequestDispatcher("/views/cs/QnA/write.jsp").forward(req, resp);
		} else {
			//관리자 아닐 때
			req.setAttribute("msg","로그인을 먼저 해주세요.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션
		HttpSession s = req.getSession();
		
		//로그인멤버 가져오기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		//뭉
		CSVo vo = new CSVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(loginMember.getNick());
		vo.setNo(loginMember.getNo());
		System.out.println("데이터뭉치기완료");
		//딥
		int result = new QNAService().write(vo);
		
		//화면
		if(result == 1) {
			//성공 -> 알람, 게시글 목록
			s.setAttribute("alertMsg", "게시글 작성 성공!");
			resp.sendRedirect("/cookTeacher/cs/QnA/list");
		}else {
			//실패 -> 메세지, 에러페이지
			req.setAttribute("msg", "게시글 작성 실패...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
			
			
		}
		
	
	}

}
