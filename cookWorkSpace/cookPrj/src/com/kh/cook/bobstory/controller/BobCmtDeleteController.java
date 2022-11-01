package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobCmtService;

@WebServlet(urlPatterns = "/bobstory/cmt/delete")
public class BobCmtDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String cmtNo = req.getParameter("cmtNo");
		
		int result = new BobCmtService().delete(cmtNo);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "댓글 삭제 성공!");
			resp.sendRedirect("/cookTeacher/bobstory/list");
		} else{
			req.setAttribute("msg", "댓글 삭제 실패 ...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
		
	}
}
