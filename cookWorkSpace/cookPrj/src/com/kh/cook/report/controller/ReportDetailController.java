package com.kh.cook.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobstoryService;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.report.service.ReportService;
import com.kh.cook.report.vo.ReportVo;

@WebServlet(urlPatterns = "/report/detail")
public class ReportDetailController extends HttpServlet{

	//신고글 상세조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 꺼내기
		String no = req.getParameter("no");
		//데이터 뭉칠거 없음
		
		//디비 다녀오기
		ReportVo rvo = new ReportService().selectReportOne(no);
//		BobstoryVo bvo = new BobstoryService().selectBoardOne(no);
		//이거 안만듬 아직
		
		//화면 선택
		req.setAttribute("rvo", rvo);
		req.getRequestDispatcher("/views/report/detail.jsp").forward(req, resp);
	}
}
