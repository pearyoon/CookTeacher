package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns="/cs/QnA/edit")
public class QNAEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//화면 보여주기
		
		String Qno = req.getParameter("no");
		
		CSVo QNAvo = new QNAService().selectQNAone(Qno);
		
		req.setAttribute("QNAvo", QNAvo);
		req.getRequestDispatcher("/views/cs/QnA/edit.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String Qno = req.getParameter("no");
		System.out.println(Qno);
		CSVo QNAvo = new CSVo();
		
		QNAvo.setTitle(title);
		QNAvo.setContent(content);
		QNAvo.setQnaNo(Qno);
		System.out.println(Qno);
		
		int result = new QNAService().edit(QNAvo);
		
		if(result == 1) {
			resp.sendRedirect("/cookTeacher/cs/QnA/detail?no="+ Qno);
		} else {
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}
}
