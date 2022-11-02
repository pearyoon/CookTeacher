package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobCmtService;
import com.kh.cook.bobstory.vo.BobCmtVo;

@WebServlet(urlPatterns = "/bobstory/cmt/edit")
public class BobCmtEditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//인코딩 필터처리
		
		//데이터 꺼내기
		String comment = req.getParameter("comment");
		String cmtNo = req.getParameter("cmtNo");
		String bobNo = req.getParameter("bobNo");
		
		BobCmtVo vo = new BobCmtVo();
		vo.setCmt(comment);
		vo.setCmtNo(cmtNo);
		
		//디비
		int result = new BobCmtService().edit(vo);
		
		//화면
		if(result == 1) {
			//댓글 수정 성공
			req.getSession().setAttribute("alertMsg", "댓글 수정 성공 !!!");
			resp.sendRedirect("/cookTeacher/bobstory/detail?bno=" + bobNo);
			
		}else {
			//댓글 수정 실패
			req.setAttribute("msg", "댓글 수정 실패 !!!");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
		
	}
	
}
