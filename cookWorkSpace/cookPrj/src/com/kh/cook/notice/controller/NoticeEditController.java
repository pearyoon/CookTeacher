package com.kh.cook.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.notice.service.NoticeService;
import com.kh.cook.notice.vo.NoticeVo;
@WebServlet(urlPatterns = "/admin/notice/edit")
public class NoticeEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		NoticeVo vo = new NoticeService().selectOne(no);
		
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/views/notice/edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		NoticeVo vo = new NoticeVo();
		vo.setContent(content);
		vo.setNo(no);
		vo.setTitle(title);
		
		NoticeVo nVo = new NoticeService().edit(vo);
		
		req.getSession().setAttribute("alertMsg", "수정완료");
	
		resp.sendRedirect("/cookTeacher/notice/detail?no="+vo.getNo());
	}
	
}
