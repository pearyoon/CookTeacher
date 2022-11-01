package com.kh.cook.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;
@WebServlet(urlPatterns = "/login/mypage/member")

public class MemberMypageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/common/mypage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/plain; charset=UTF-8;");
		
		HttpSession ss = req.getSession();
		MemberVo loginMember = (MemberVo)ss.getAttribute("loginMember");
		
		int point = loginMember.getPoint();
		String no = loginMember.getNo();
		
		MemberVo vo = new MemberVo();
		vo.setNo(no);
		
		if(point >= 10000) {
			vo.setGrade("3");
		} else if(point >= 5000) {
			vo.setGrade("2");
		} else {
			vo.setGrade("1");
		}
		
		MemberVo checkGrade = new MemberService().gradeCheck(vo);
		
		String grade = checkGrade.getGrade();
		
		if("1".equals(grade)) {
			checkGrade.setGrade("일반");
		} else if("2".equals(grade)) {
			checkGrade.setGrade("화이트");	
		} else {
			checkGrade.setGrade("그린");
		}
			
		
		Gson gson = new Gson();
		String result = gson.toJson(checkGrade);
		
		resp.getWriter().write(result);
	}
}
