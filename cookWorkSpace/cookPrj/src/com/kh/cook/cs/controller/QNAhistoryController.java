package com.kh.cook.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.cs.service.QNAService;
import com.kh.cook.cs.vo.CSVo;

@WebServlet(urlPatterns="/cs/QnAhistory")
public class QNAhistoryController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//디비 다녀오기
		List<CSVo> QNAList = new QNAService().selectMyQNAList();
		
		//화면선택
		req.setAttribute("QNAList", QNAList);
		
		req.getRequestDispatcher("/views/cs/QnAhistory.jsp").forward(req, resp);
		
	}

}
