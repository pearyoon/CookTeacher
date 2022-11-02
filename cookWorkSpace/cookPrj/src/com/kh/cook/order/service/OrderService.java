package com.kh.cook.order.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.dao.OrderDao;
import com.kh.cook.order.vo.OrderDetailVo;
import com.kh.cook.order.vo.OrderListVo;
import com.kh.cook.order.vo.OrderVo;
import com.kh.cook.order.vo.PaymentVo;

public class OrderService {
	
	private final OrderDao dao = new OrderDao();

	// 회원 장바구니 가져오기
	public MemberVo checkCartMember(String no, String[] check) {

		Connection conn = getConnection();
		
		MemberVo vo = dao.selectMemberByNo(conn, no);
		
		close(conn);
		
		return vo;
		
	}

	// 장바구니 상품 하나 조회하기
	public List<CartItemVo> selectCartList(String no, String[] check) {
		
		Connection conn = getConnection();
		

		List<CartItemVo> productList = new ArrayList<CartItemVo>();
		
		for(int i = 0; i < check.length; i++) {
			CartItemVo cartItem = dao.selectCartOne(conn, no, check[i]);
			productList.add(cartItem);
		}
		
		
		close(conn);
		
		return productList;
		
	}

	// 주문 내역 만들기
	public int insertOrder(MemberVo cartMember, List<CartItemVo> cartList, String point, String payment) {

		//전체 가격
		int totalPrice = 0;
		
		for(int i = 0; i < cartList.size(); i++) {
			CartItemVo item = cartList.get(i);
			// 전체 가격 계산
			int sum = Integer.parseInt(item.getPrice()) * Integer.parseInt(item.getCnt());
			totalPrice += sum;
		}
		if(totalPrice < 30000) {
			totalPrice += 2500;
		}
		// 포인트
		if(point != null && !point.equals("")) {
			totalPrice -= Integer.parseInt(point);
		}
		
		
		double rate = 0;
		
		// 회원 등급에 따른 적립 포인트
		switch(cartMember.getGrade()) {
		
		case "1": 
			rate = 0.01;
			break;
			
		case "2":
			rate = 0.03;
			break;
			
		case "3":
			rate = 0.05;
			break;
		
		}
		
		int earn = (int)(totalPrice * rate);
		int totalPoint = earn - Integer.parseInt(point);
	
		Connection conn = getConnection();
		
		int resultPoint = dao.subtractPoint(conn, cartMember, totalPoint);
		int result = dao.insertOrder(conn, cartMember, point, totalPrice, earn);
		String num = dao.selectSeq(conn);
		int paymentResult = dao.insertPayment(conn, num, payment);

		boolean isSuccess = true;
		
		// 주문 내역 만들기
		for(int i = 0; i < cartList.size(); i++) {
			CartItemVo item = cartList.get(i);
			
			int detailResult = dao.insertOrderDetail(conn, num, item);
			int updateResult = dao.updatePaymentYN(conn, cartMember, item);
			int updateStock = dao.updateStock(conn, item);
			
			// 실패하면 롤백해줌 (커밋하지 않기 위해서)
			if(detailResult == 0) {
				result = 0;
				isSuccess = false;
				break;
			}
		}
		
		// 성공하면 커밋 해줌
		if(isSuccess == true && paymentResult == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		if(result == 1) {
			return totalPrice;
		}else {
			return -1;
		}
		
	}
 
	// 주문 내역 가져오기
	public List<OrderDetailVo> selectOrderList(String no, String num) {
		

		// 커넥션 가져오기
		Connection conn =  getConnection();
		
		List<OrderDetailVo> orderDetailList = dao.selectOrderDetail(conn, num);
		
		close(conn);
		
		return orderDetailList;
	
	}
	
	// 주문 정보 가져오기
	public OrderVo selectOrderInfo(String num) {
		
		// 커넥션 가져오기
		Connection conn = getConnection();
		
		OrderVo orderInfo = dao.selectorderInfo(conn, num);
		
		close(conn);
		
		return orderInfo;
		
	}
	
	// 결제 정보 가져오기
	public PaymentVo selectPaymentInfo(String num) {
		
		// 커넥션 가져오기
		Connection conn = getConnection();
		
		PaymentVo paymentInfo = dao.selectPaymentInfo(conn, num);
		
		close(conn);
		
		return paymentInfo;
		
	}
	
	// 주문 내역 조회하기
	public List<OrderListVo> selectOrderInfoList(String no) {
		
		Connection conn = getConnection();
		
		List<OrderListVo> orderList = dao.selectOrderInfoList(conn, no);
		
		close(conn);
		
		return orderList;
		
	}

	public int deleteOrder(String orderNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteOrder(conn, orderNo);
		
		close(conn);
		
		return result;
		
	}

}

/* 주문에 주문번호 / 결제 금액
 * 주문내역에 내역번호 / 식재료 번호 / 주문 번호 
 * 결제에 결제 수단 / 결제 날짜
 * 
 * 셀렉트 하려면 식재료 이름 / 주문 번호 / 결제 방법 / 결제 금액
 */

/* 결제 완료된 상품 하나 조회하기
 * 
 */