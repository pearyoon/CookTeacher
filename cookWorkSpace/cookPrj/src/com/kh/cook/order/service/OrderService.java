package com.kh.cook.order.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.cook.cart.dao.CartDao;
import com.kh.cook.order.dao.OrderDao;

public class OrderService {

	public int orderInfo(String no) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().orderInfo();
		
		new CartDao().selectList(conn, no);
		
	
		
	}

}
