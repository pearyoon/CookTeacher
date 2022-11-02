package com.kh.cook.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cook.menu.service.MenuService;
@WebServlet(urlPatterns = "/detail/delete")
public class MenuDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		//뭉치기
		//데이터 하나이므로 뭉칠것 없읍
		//디비 다녀녀오기;
		int result = new MenuService().delete(no);
		//화면선택
		if(result == 1) {
			//성공 => 알람, 리스트 조회 화면으로 보내기
			req.getSession().setAttribute("alertMsg", "레시피 삭제 성공!");
			resp.sendRedirect("/cookTeacher/views/menu/recipe_cate.jsp");
		}else {
			//실패 => 실패 메세지, 에러 페이지로 보내기
			req.setAttribute("msg", "공지사항 삭제 실패!");
			req.getRequestDispatcher("/views/common/errorPage.jsp").forward(req, resp);
		}
	}
}
