package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cook.cart.service.CartService;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.menu.service.MenuService;
import com.kh.cook.menu.vo.MenuCartVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductCartVo;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/product/detail/productDetail")
public class ProductDetailController extends HttpServlet {

	//식재료 상세 조회
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String no = req.getParameter("no");
		
		//데이터 뭉치기
		
		//디비 다녀오기
		ProductVo vo = new ProductService().selectProductOne(no);
		List<ReviewVo> rvoList = new ProductService().selectReview(no);
		
		//화면선택 (데이터 담아서)
		req.setAttribute("vo", vo);
		req.setAttribute("rvoList", rvoList);
		req.getRequestDispatcher("/views/product/detail/productDetail.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession s = req.getSession();
    	
    	HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
    	
    	String prodNo = req.getParameter("prodNo");
    	String prodCnt = req.getParameter("prodCnt");
    	String memberNo = loginMember.getNo();
    	
    	CartVo cvo = new CartVo();
    	cvo.setProdNo(prodNo);
    	cvo.setCnt(prodCnt);
    	cvo.setNo(memberNo);
    	
    	System.out.println(cvo.getProdNo());
    	
    	int prodCart = new CartService().addCart(cvo);
    	
    	
    	if(prodCart == 1) {
    		s.setAttribute("alertMsg", "장바구니 담기 성공!");
    		req.setAttribute("prodCart", prodCart);
    		resp.sendRedirect("/cookTeacher/cart/list");
    	}else {
    		System.out.println("장바구니 담기 실패..");
    	}
	
	}

}

