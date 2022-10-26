package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.BobstoryVo;

@WebServlet(urlPatterns = "/bobstory/edit")
public class BobEditController extends HttpServlet{

	//수정 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 꺼내기
		String no = req.getParameter("no");
		
		//디비 다녀오기
		BobstoryVo vo = new BobstoryService().selectOne(no);
		
		//화면 선택
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/views/bobstory/edit.jsp").forward(req, resp);
	}
	
	//수정
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인코딩 필터 처리해씀
		
		//데이터 꺼내기
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String no = req.getParameter("no");
		
		//데이터 뭉치기
		BobstoryVo vo = new BobstoryVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setNo(no);
		
		//디비 다녀오기
		int result = new BobstoryService().edit(vo);
		
		//화면 선택
		if(result == 1) {
			//수정 성공
			req.getSession().setAttribute("alertMsg", "게시글 수정 성공 !!!");
			resp.sendRedirect("/cookTeacher/bobstory/detail?bno=" + no);
		}else {
			//수정 실패
			req.setAttribute("msg", "게시글 수정 실패 ...");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
			
		}
		
		
	}
}
