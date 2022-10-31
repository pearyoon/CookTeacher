package com.kh.cook.menu.controller;

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
import com.kh.cook.menu.vo.MenuAttachmentVo;
import com.kh.cook.menu.vo.MenuCartVo;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.product.vo.ProductVo;
@WebServlet(urlPatterns = "/menu/detail")
public class MenuDetailController extends HttpServlet{
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	//데이터 보내기
    	String no = req.getParameter("no");
//    	String cntNo = req.getParameter("cntNo");
    	
    	//디비 다녀오기
    	MenuVo vo = new MenuService().selectMenuOne(no);
//    	int result = new MenuService().plusRecommOne(no);
    	List<ProductVo> prodList = new MenuService().selectProdList(no);
//		MenuAttachmentVo menuAttachmentVo = new MenuService().selectMenuAttachment(no);
    	
    	//화면선택
    	req.setAttribute("vo", vo);
    	
    	if(prodList == null) {
    		System.out.println("null");
    	}else {
    		req.setAttribute("no", no);
    		req.setAttribute("prodList", prodList);
    		req.getRequestDispatcher("/views/menu/detail.jsp").forward(req, resp);
    		
    	}

    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession s = req.getSession();
    	
    	HttpSession member = req.getSession();
		MemberVo loginMember = (MemberVo) member.getAttribute("loginMember");
    	
    	//일단 .prodNo 이랑 
    	//넘버를 어떻게:?
    	String prodNo = req.getParameter("prodNo");
    	String prodCnt = req.getParameter("prodCnt");
    	String memberNo = loginMember.getNo();
    	
    	CartVo vo = new CartVo();
    	vo.setProdNo(prodNo);
    	vo.setCnt(prodCnt);
    	vo.setNo(memberNo);
    	
    	
    	
    	int prodCart = new CartService().addCart(vo);
//    	int prodCart = new MenuService().cartInput(mcv);
    	
    	
    	if(prodCart == 1) {
    		s.setAttribute("alertMsg", "장바구니 담기 성공!");
    		req.setAttribute("prodCart", prodCart);
    		resp.sendRedirect("/cookTeacher/cart/list");
    	}else {
    		System.out.println("네 장바구니 담기 실패임다^^");
    	}

    	
    
    }

}
