package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.FAQService;

@WebServlet(urlPatterns="/cs/FAQ/delete")
public class FAQDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Fno = req.getParameter("no");
		
		int result = new FAQService().delete(Fno);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "문의글이 삭제되었습니다.");
			resp.sendRedirect("/cookTeacher/cs/FAQ/list");
		} else {
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	
	}
}
