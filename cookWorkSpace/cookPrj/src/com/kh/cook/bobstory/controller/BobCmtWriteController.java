package com.kh.cook.bobstory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.bobstory.service.BobCmtService;
import com.kh.cook.bobstory.vo.BobCmtVo;

@WebServlet(urlPatterns = "/bobstory/cmt")
public class BobCmtWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 가져오기
		String bobno = req.getParameter("bobNo");
		String writerNo = req.getParameter("writerNo");
		String comment = req.getParameter("comment");

		
		//데이터 뭉치기
		BobCmtVo vo = new BobCmtVo();
		vo.setPostNo(bobno);
		vo.setWriter(writerNo);
		vo.setCmt(comment);
		
		
		//디비 다녀오기
		int result = new BobCmtService().writeCmt(vo);
		
		//화면 선택
		if(result == 1) {
			//댓글 작성 성공
			req.getSession().setAttribute("alertMsg", "댓글을 성공적으로 작성하였습니다.");
			resp.getWriter().write("성공~");
		}else {
			//댓글 작성 실패
			req.setAttribute("msg", "댓글 작성에 실패했습니다.");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
		
		
	}
}
