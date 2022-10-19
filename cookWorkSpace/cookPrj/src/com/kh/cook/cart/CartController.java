package com.kh.cook.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.member.vo.MemberVo;

@WebServlet(urlPatterns = "/cookTeacher/cart")
public class CartController extends HttpServlet{

	// 장바구니 담기 작성(화면)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
		
		if(loginMember != null) {
			// 회원일 경우
			req.getRequestDispatcher("/views/cart/list.jsp").forward(req, resp);
		}else{
			// 회원이 아닐 경우
			req.setAttribute("loginMsg", "로그인을 해주세요");
			req.getRequestDispatcher("/views/member/login.jsp").forward(req, resp);
		}
		
	}// doGet
	
	// 장바구니 담기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인코딩
		req.setCharacterEncoding("UTF-8");
		
		// 회원 불러오기
		HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMemebr");
		
		// 데이터 꺼내오기
		
		
		// 데이터 뭉치고
		
		// 디비 다녀오기
		
		// 화면 선택하기
		
		
	}
	
}//class

/* 상품 선택, 전체 선택, 상품 삭제, 전체 삭제, 선택된 상품 삭제
 * 
 * 1. 회원이 먼저 로그인을 한다
 * (로그인한 회원번호 가져오기)
 * 2. 상품 리스트 혹은 레시피를 보면서 원하는 상품을 장바구니에 담는다
 */
