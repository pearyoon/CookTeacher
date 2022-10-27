package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;

@WebServlet(urlPatterns = "/bobstory/report")
public class BobReportController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 꺼내기
		String no = req.getParameter("no");
		System.out.println(no);
		//디비 다녀오기
		int result = new BobstoryService().report(no);
		
		//화면 선택
		if(result == 1) {
			//신고 성공
			req.getSession().setAttribute("alertMsg", "신고하였습니다.");
			resp.sendRedirect("/cookTeacher/bobstory/list");
		}else {
			//신고 실패
			req.setAttribute("msg", "신고에 실패하셨습니다.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}

}
