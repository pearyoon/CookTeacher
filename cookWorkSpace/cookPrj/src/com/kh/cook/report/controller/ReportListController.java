package com.kh.cook.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.report.service.ReportService;
import com.kh.cook.report.vo.ReportVo;

@WebServlet(urlPatterns = "/report/list")
public class ReportListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//디비 다녀오기
		
		List<ReportVo> voList = new ReportService().selectReportList();
		
		//화면 데이터 담아서 선택
		req.setAttribute("voList", voList);
		req.getRequestDispatcher("/views/report/list.jsp").forward(req, resp);
	}
}
