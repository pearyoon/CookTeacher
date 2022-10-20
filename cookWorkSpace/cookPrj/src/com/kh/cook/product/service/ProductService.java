package com.kh.cook.product.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.cook.common.JDBCTemplate.*;

import com.kh.cook.menu.dao.MenuDao;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.product.dao.ProductDao;
import com.kh.cook.product.vo.ProductVo;

public class ProductService  {
	
	private final ProductDao dao = new ProductDao(); //new ProductDao() 대신 dao 로 


	//식재료 목록 조회
	public List<ProductVo> selectProductList() {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectProductList(conn);
		
		close(conn);
		
		
		return voList;
		
		
	}


	//식재료 상세 조회
	public ProductVo selectProductOne(String prodNo) {

		//커넥션 준비
		//SQL (조회수 증가, 상세조회)
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		ProductVo vo = new ProductDao().selectProductOne(conn, prodNo);

		close(conn);
		
		return vo;
		
	}


	//식재료 갯수 조회
	public int selectCount() {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = getConnection();

		int result = dao.selectCount(conn);
		
		close(conn);
		
		return result;
	}
	

}
