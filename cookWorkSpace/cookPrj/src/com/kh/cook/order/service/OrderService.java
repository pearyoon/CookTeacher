package com.kh.cook.order.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.cart.vo.CartItemVo;
import com.kh.cook.order.dao.OrderDao;

public class OrderService {
	
	private final OrderDao dao = new OrderDao();

	public void checkCartList() {
		
		Connection conn = getConnection();
		
		dao.checkCartList(conn);
		
	}


}
