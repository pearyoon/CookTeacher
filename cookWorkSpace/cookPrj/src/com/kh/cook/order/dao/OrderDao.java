package com.kh.cook.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.order.vo.OrderDetailVo;
import com.kh.cook.order.vo.OrderListVo;
import com.kh.cook.order.vo.OrderVo;
import com.kh.cook.order.vo.PaymentVo;
import com.kh.cook.product.vo.ProductVo;

import static com.kh.cook.common.JDBCTemplate.*;

public class OrderDao {

	// 장바구니 상품 하나 조회하기
	public CartItemVo selectCartOne(Connection conn, String no, String prodNo) {
		
		String sql = "SELECT P.PROD_NO, C.CNT, P.NAME, P.PRICE, P.IMG_PATH FROM CART C JOIN PRODUCT P ON P.PROD_NO = C.PROD_NO WHERE C.PAYMENT_YN = 'N' AND C.NO = ? AND P.PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartItemVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			pstmt.setString(2, prodNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String cnt= rs.getString("CNT");
				String name= rs.getString("NAME");
				String price= rs.getString("PRICE");
				String imgPath = rs.getString("IMG_PATH");
				
				vo = new CartItemVo();
				vo.setProdNo(prodNo);
				vo.setCnt(cnt);
				vo.setName(name);
				vo.setPrice(price);
				vo.setImgPath(imgPath);
						
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}
	
	// 회원 정보 가져오기
	public MemberVo selectMemberByNo(Connection conn, String no) {
		
		String sql ="SELECT NO, GRADE, EMAIL, NAME, PHONE, ADDR, POINT FROM MEMBER WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		MemberVo member = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String grade = rs.getString("GRADE");
				String email = rs.getString("EMAIL");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String dataAddr = rs.getString("ADDR");
				int point = rs.getInt("POINT");
				
				int idx = dataAddr.indexOf(",");
				
				String addr = dataAddr.substring(0, idx);
				String detailAddr = dataAddr.substring(idx+1);
				
				
				member = new MemberVo();
				member.setNo(no);
				member.setGrade(grade);
				member.setEmail(email);
				member.setName(name);
				member.setPhone(phone);
				member.setAddr(addr);
				member.setDetailAddr(detailAddr);
				member.setPoint(point);

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return member;
		
	}

	// 주문 내역 만들기
	public int insertOrder(Connection conn, MemberVo cartMember, String point, int totalPrice, int earn) {

		String sql = "INSERT INTO \"ORDER\" (NO, MEMBER_NO, POINT, USE_POINT, SUM, NAME, ADDR, PHONE) VALUES (SEQ_ORDER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cartMember.getNo());
			pstmt.setString(2, Integer.toString(earn));
			pstmt.setString(3, point);
			pstmt.setString(4, Integer.toString(totalPrice));
			pstmt.setString(5, cartMember.getName());
			pstmt.setString(6, cartMember.getAddr());
			pstmt.setString(7, cartMember.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 주문 번호 가져오기
	public String selectSeq(Connection conn) {
		
		String sql ="SELECT SEQ_ORDER_NO.CURRVAL NUM FROM \"ORDER\"";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String num = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getString("NUM");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return num;
	}

	// 주문내역 넣어주기
	public int insertOrderDetail(Connection conn, String num, CartItemVo item) {

		String sql = "INSERT INTO ORDER_DETAIL (NO, PROD_NO, ORDER_NO ,CNT , PRICE) VALUES (SEQ_ORDER_DETAIL_NO.NEXTVAL, ?, ?, ?, ?)";
		

		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, item.getProdNo());
			pstmt.setString(2, num);
			pstmt.setString(3, item.getCnt());
			pstmt.setString(4, item.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}

	// 결제 정보 넣어주기
	public int insertPayment(Connection conn, String num, String payment) {
		
		String sql = "INSERT INTO PAYMENT (PAY_NO, ORDER_NO, PAYMENT) VALUES (SEQ_PAYMENT_PAY_NO.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.setString(2, payment);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	// 주문 번호 / 결제 금액 가져오기
	public OrderVo selectorderInfo(Connection conn, String no) {
		String sql = "SELECT NO, MEMBER_NO, POINT, USE_POINT, SUM, NAME, ADDR, PHONE FROM \"ORDER\" WHERE MEMBER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String orderNo = rs.getString("NO");
				String memberNo = rs.getString("MEMBER_NO");
				String point = rs.getString("POINT");
				String usePoint = rs.getString("USE_POINT");
				String sum = rs.getString("SUM");
				String name = rs.getString("NAME");
				String addr = rs.getString("ADDR");
				String phone = rs.getString("PHONE");
				
				vo = new OrderVo();
				vo.setNo(orderNo);
				vo.setMemberNo(no);
				vo.setPoint(usePoint);
				vo.setUsePoint(usePoint);
				vo.setSum(sum);
				vo.setName(name);
				vo.setAddr(addr);
				vo.setPhone(phone);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}
	
	// 주문 내역에서 내역번호 / 식재료 번호 / 주문 번호 
	public List<OrderDetailVo> selectOrderDetail(Connection conn, String num) {
		String sql = "SELECT NO, PROD_NO, ORDER_NO, CNT, PRICE FROM ORDER_DETAIL WHERE ORDER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDetailVo> list = new ArrayList<OrderDetailVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String prodNo = rs.getString("PROD_NO");
				String orderNo = rs.getString("ORDER_NO");
				String cnt = rs.getString("CNT");
				String price = rs.getString("PRICE");
				
				OrderDetailVo vo = new OrderDetailVo();
				vo.setNo(no);
				vo.setProdNo(prodNo);
				vo.setOrderNo(num);
				vo.setCnt(cnt);
				vo.setPrice(price);
				
				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 결제에 결제 수단 / 결제 날짜
	public PaymentVo selectPaymentInfo(Connection conn, String num) {
		
		String sql = "SELECT PAYMENT, PAY_DATE FROM PAYMENT WEHRE ORDER_NO = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PaymentVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String payment = rs.getString("PAYMENT");
				String payDate = rs.getString("PAY_DATE");
				String orderNo = rs.getString("ORDER_NO");
				
				vo = new PaymentVo();
				vo.setPayment(payment);
				vo.setPayDate(payDate);
				vo.setOrderNo(num);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return vo;
		
	}//selectPaymentInfo
	
	// 주문하면 장바구니 비우기
	public int updatePaymentYN(Connection conn, MemberVo cartMember, CartItemVo item) {
		
		String sql = "UPDATE CART SET PAYMENT_YN = 'Y' WHERE NO =? AND PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cartMember.getNo());
			pstmt.setString(2, item.getProdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}//updatePaymentYN
	
	public int updateStock(Connection conn, CartItemVo item) {
		
		String sql = "UPDATE PRODUCT SET STOCK = STOCK - ? WHERE PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, item.getCnt());
			pstmt.setString(2, item.getProdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}//updateStock
	
	// 주문 내역 조회하기
	public List<OrderListVo> selectOrderInfoList(Connection conn, String no) {
		String sql = "SELECT O.NO, O.SUM, D.NAME, D.CNT, P.PAYMENT, P.PAY_DATE FROM \"ORDER\" O JOIN PAYMENT P ON O.NO = P.ORDER_NO JOIN ( SELECT MAX(P.NAME) AS NAME, COUNT(*) AS CNT, D.ORDER_NO FROM ORDER_DETAIL D JOIN PRODUCT P ON D.PROD_NO = P.PROD_NO GROUP BY D.ORDER_NO ) D ON D.ORDER_NO = O.NO WHERE O.MEMBER_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderListVo> list = new ArrayList<OrderListVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				String orderNo = rs.getString("NO");
				String sum = rs.getString("SUM");
				String name = rs.getString("NAME");
				String cnt = rs.getString("CNT");
				String payment = rs.getString("PAYMENT");
				String payDate = rs.getString("PAY_DATE");
				
				OrderListVo vo = new OrderListVo();
				vo.setNo(orderNo);
				vo.setSum(sum);
				vo.setName(name);
				vo.setCnt(cnt);
				vo.setPayment(payment);
				vo.setPayDate(payDate);
				
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
		
	}
	
}
