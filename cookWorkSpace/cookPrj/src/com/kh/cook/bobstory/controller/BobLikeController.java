package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;

@WebServlet(urlPatterns = "/bobstory/boblike")
public class BobLikeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 가져오기
		String no = req.getParameter("no");
		
		//디비 다녀오기
		int result = new BobstoryService().plusLikeOne(no);
		
		//화면 선택
		if(result == 1) {
			//좋아요 누르기 성공
			resp.sendRedirect("/cookTeacher/bobstory/detail?bno="+ no);
		}else {
			//좋아요 누르기 실패
			req.setAttribute("msg", "좋아요 누르기 실패");
			req.getRequestDispatcher("/views/common/erroePage.jsp").forward(req, resp);
			
		}
		
	}

}
