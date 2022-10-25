package com.kh.cook.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns="/cs/QnA/detail")
public class QNADetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String qnaNo = req.getParameter("no");
	System.out.println(qnaNo);
	
	CSVo QNAvo = new QNAService().selectQNAone(qnaNo);
	
	req.setAttribute("QNAvo", QNAvo);
	req.getRequestDispatcher("/views/cs/QnA/detail.jsp").forward(req, resp);
	
	}

}
