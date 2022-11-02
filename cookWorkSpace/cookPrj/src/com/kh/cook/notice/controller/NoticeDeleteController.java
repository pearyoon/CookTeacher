package com.kh.cook.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.notice.service.NoticeService;
import com.kh.cook.notice.vo.NoticeVo;
@WebServlet(urlPatterns = "/admin/notice/delete")
public class NoticeDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");

		
		int result = new NoticeService().delete(no);
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "삭제되었습니다.");
			resp.sendRedirect("/cookTeacher/notice/list?pno=1");
		} else {
			req.setAttribute("errorMsg", "삭제실패");
			req.getRequestDispatcher("/views/common/erroPage.jsp").forward(req, resp);
		}
	}
}
