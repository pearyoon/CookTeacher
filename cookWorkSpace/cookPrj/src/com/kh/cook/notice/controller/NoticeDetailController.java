package com.kh.cook.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.notice.service.NoticeService;
import com.kh.cook.notice.vo.NoticeVo;
@WebServlet(urlPatterns = "/notice/detail")
public class NoticeDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		NoticeVo vo = new NoticeService().selectOne(no);
		
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/views/notice/detail.jsp").forward(req, resp);
	}
}
