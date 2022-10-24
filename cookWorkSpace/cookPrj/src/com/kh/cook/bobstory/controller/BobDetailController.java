package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.bobstory.vo.BobstoryVo;

@WebServlet(urlPatterns = "/bobstory/detail")
public class BobDetailController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String bno = req.getParameter("bno");
		//데이터 뭉치기
		
		//디비 다녀오기
		BobstoryVo vo = new BobstoryService().selectOne(bno);
		AttachmentVo attachmentVo = new BobstoryService().selectAttachment(bno);
		
		//화면 선택
		req.setAttribute("vo", vo);
		req.setAttribute("attachmentVo", attachmentVo);
		req.getRequestDispatcher("/views/bobstory/detail.jsp").forward(req, resp);
		
	}

	
}
