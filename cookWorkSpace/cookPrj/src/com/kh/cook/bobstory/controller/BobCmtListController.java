package com.kh.cook.bobstory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobCmtService;
import com.kh.cook.bobstory.vo.BobCmtVo;

@WebServlet(urlPatterns = "/bobstory/cmtlist")
public class BobCmtListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기 (게시글 번호 )
		String no = req.getParameter("no");
		
		//데이터 뭉치기 할게없음
		
		//디비 다녀오기
		List<BobCmtVo> cmtList = new BobCmtService().selectList(no);
		
	}
	
}
