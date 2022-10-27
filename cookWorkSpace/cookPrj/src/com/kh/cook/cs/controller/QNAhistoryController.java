package com.kh.cook.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSVo;
import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns="/login/cs/QnAhistory")
public class QNAhistoryController extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면
		HttpSession s = req.getSession();
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
	
		String no = loginMember.getNo();
		
		//디비 다녀오기
		List<CSVo>  myQNAList = new QNAService().selectMyQNAList(no);
		
		//화면선택
		req.setAttribute("loginMember", loginMember);
		req.setAttribute("myQNAList", myQNAList);
		
		req.getRequestDispatcher("/views/cs/QnAhistory.jsp").forward(req, resp);
	
	}//
	

}
