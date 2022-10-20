package com.kh.cook.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.product.vo.ProductVo;

public class ProductDao {

	//식재료 목록 조회
	public List<ProductVo> selectProductList(Connection conn) {
		//SQL
		
		//String sql = "SELECT * FROM PRODUCT";
		String sql = "SELECT * FROM PRODUCT WHERE MOD(PROD_NO, 2) = 0";
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				
				voList.add(vo); 
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return voList;

	}

	//식재료 상세 조회
	public ProductVo selectProductOne(Connection conn, String prodNo) {

		//SQL (준비, 완성, 실행 및 결과저장)
		String sql = "SELECT NAME, INFO, PRICE, WEIGHT, IMG_PATH FROM PRODUCT WHERE PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prodNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String imgPath = rs.getString("IMG_PATH");
				
				vo = new ProductVo();
				vo.setName(name);
				vo.setInfo(info);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setImgPath(imgPath);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return vo;
		
	
	}

	//식재료 갯수 조회
	public int selectCount(Connection conn) {

		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); //rs에 담긴 걸 자바에서 사용하기 편하게
			
			if(rs.next()) {
				result = rs.getInt("CNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}



	

}
