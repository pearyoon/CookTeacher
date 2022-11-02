package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.QNAService;

@WebServlet(urlPatterns="/cs/QnA/deletereply")
public class ReplyDeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Qno = req.getParameter("no");
		
		int result = new QNAService().deletereply(Qno);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "답변이 삭제되었습니다.");
			resp.sendRedirect("/cookTeacher/cs/QnA/detail?no="+Qno);
		} else {
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}

}
