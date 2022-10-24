package com.kh.cook.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.product.vo.PageVo;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

public class ProductDao {

	//식재료 목록 조회
	public List<ProductVo> selectProductList(Connection conn , PageVo pv) {
		//SQL
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT";
		//String sql = "SELECT * FROM PRODUCT WHERE MOD(PROD_NO, 2) = 0";
		
		
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
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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
	public ProductVo selectProductOne(Connection conn, String no) {

		//SQL (준비, 완성, 실행 및 결과저장)
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE PROD_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("dao 쪽 vo : " +vo);
		
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

	//식재료 리뷰 작성
	public int insertReview(Connection conn, ReviewVo rvo) {

		//SQL (준비, 완성, 실행)
		
		String sql = "INSERT INTO PRODUCT_REVIEW(REVIEW_NO, NO, PROD_NO, ENROLL_DATE, MODIFY_DATE, DELETE_YN, CONTENT) VALUES(SEQ_PRODUCT_REVIEW_NO.NEXTVAL, 1, 1, SYSDATE, SYSDATE, 'N', ?)";
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setString(1, rvo.getNo());
//			pstmt.setString(2, rvo.getProdNo());
//			pstmt.setString(3, rvo.getEnrollDate());
//			pstmt.setString(4, rvo.getModifyDate());
//			pstmt.setString(5, rvo.getDeleteYn());
//			pstmt.setString(6, rvo.getContent());
			
			//pstmt.setString(1, rvo.getNo());
			//pstmt.setString(2, rvo.getContent());
			
			pstmt.setString(1, rvo.getContent());


			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("DAO 쪽 리뷰 인서트 결과" + result);
		return result;
		
	}

	//과일채소 목록 조회
	public List<ProductVo> selectFruitVegeList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 1";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	//해산물 목록 조회
	public List<ProductVo> selectSeafoodList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 2";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	//기타 목록 조회
	public List<ProductVo> selectEtcList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 7";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	//육류계란 목록 조회
	public List<ProductVo> selectMeatEggList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 3";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	//면류빵류 목록 조회
	public List<ProductVo> selectNoodleBreadList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 4";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	//유제품 목록 조회
	public List<ProductVo> selectDairyList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 5";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	public List<ProductVo> selectDrinkList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 6";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(rs.next());
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cateNo = rs.getString("CATE_NO");
				String name = rs.getString("NAME");
				String info = rs.getString("INFO");
				String detail = rs.getString("DETAIL");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String stock = rs.getString("STOCK");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath4 = rs.getString("IMG_PATH4");
				
				ProductVo vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setCateNo(cateNo);
				vo.setName(name);
				vo.setInfo(info);
				vo.setDetail(detail);
				vo.setPrice(price);
				vo.setWeight(weight);
				vo.setStock(stock);
				vo.setImgPath(imgPath);
				vo.setImgPath2(imgPath2);
				vo.setImgPath3(imgPath3);
				vo.setImgPath4(imgPath4);
				
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

	

}
