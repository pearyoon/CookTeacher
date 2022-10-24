package com.kh.cook.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.report.service.ReportService;

@WebServlet(urlPatterns = "/report/delete")
public class ReportDeleteController extends HttpServlet{
	
	//신고글 삭제하기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 꺼내기
		String no = req.getParameter("no");
		//데이터 뭉치기
		
		//디비 다녀오기
		int result = new ReportService().delete(no);
		
		//화면 선택
		if(result == 1) {
			//삭제 성공 => 알람, 리스트 조회
			req.getSession().setAttribute("alertMsg", "신고글 삭제 성공 !!!");
			resp.sendRedirect("/cookTeacher/report/list");
		}else {
			//삭제 실패
			req.setAttribute("msg", "신고글 삭제 실패 ㅜㅜ");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}

}
