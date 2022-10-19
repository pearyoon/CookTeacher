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

@WebServlet(urlPatterns = "/cs/QnA/list")
public class QNAListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 디비 다녀오기
		List<CSVo> QNAList = new QNAService().selectQNAList();
		req.setAttribute("QNAList", QNAList);
		//페이징 처리 추가
		//req.setAttribute("qnapv",qnapv);
		
		//화면선택
		req.getRequestDispatcher("/views/cs/QnA/list.jsp").forward(req, resp);

	}

}
