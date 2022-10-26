package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;

@WebServlet(urlPatterns = "/bobstory/delete")
public class BobDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 꺼내기
		String no = req.getParameter("no");
		
		//디비 다녀오기
		
		int result = new BobstoryService().delete(no);
		
		//화면 선택
		if(result == 1) {
			//삭제 성공
			req.getSession().setAttribute("alertMsg", "게시글 삭제 성공 !!!");
			resp.sendRedirect("/cookTeacher/bobstory/list");
		}else {
			//삭제 실패
			req.setAttribute("msg", "게시글 삭제 실패 ...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
		
	}
	
}
