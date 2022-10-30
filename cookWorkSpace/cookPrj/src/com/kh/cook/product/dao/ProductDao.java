package com.kh.cook.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.product.vo.PageVo;
import com.kh.cook.product.vo.ProductCartVo;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

public class ProductDao {

	//식재료 목록 조회
	public List<ProductVo> selectProductList(Connection conn , PageVo pv) {
		//SQL
		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT)T)WHERE RNUM BETWEEN ? AND ?";
		//String sql = "SELECT * FROM PRODUCT WHERE MOD(PROD_NO, 2) = 0";
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() + 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
		String sql = "SELECT  P.PROD_NO , P.CATE_NO , P.NAME , P.INFO , P.DETAIL , P.PRICE , P.WEIGHT , P.STOCK , P.IMG_PATH , P.IMG_PATH2 , P.IMG_PATH3 , P.IMG_PATH4  FROM PRODUCT P JOIN PRODUCT_REVIEW PR ON P.PROD_NO = PR.PROD_NO JOIN MEMBER M ON PR.NO = M.NO WHERE P.PROD_NO = ?";
		//String sql = "SELECT  PROD_NO , CATE_NO , NAME , INFO , DETAIL , PRICE , WEIGHT , STOCK , IMG_PATH , IMG_PATH2 , IMG_PATH3 , IMG_PATH4  FROM PRODUCT WHERE PROD_NO = ?";
		
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
		
		//System.out.println("dao 쪽 vo : " +vo);
		
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
	
	//과일채소 갯수 조회
	public int selectFruitVegeCount(Connection conn) {

		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 1";
		
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
	
	//해산물 갯수 조회
	public int selectSeafoodCount(Connection conn) {

		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 2";
		
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
	
	//육류계란 갯수 조회
	public int selectEggMeatCount(Connection conn) {
		
		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 3";
		
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
	//육류계란 갯수 조회
	public int selectNoodleBreadCount(Connection conn) {
		
		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 4";
		
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
	//유제품 갯수 조회
	public int selectDairyCount(Connection conn) {
		
		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 5";
		
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
	
	//음료 갯수 조회
	public int selectDrinkCount(Connection conn) {
		
		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 6";
		
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
		
	//기타 갯수 조회
	public int selectEtcCount(Connection conn) {
		
		//SQL
		String sql = "SELECT COUNT(*) AS CNT FROM PRODUCT WHERE CATE_NO = 7";
		
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
		
		String sql = "INSERT INTO PRODUCT_REVIEW(REVIEW_NO, NO, PROD_NO,  CONTENT) VALUES(SEQ_PRODUCT_REVIEW_NO.NEXTVAL, ?, ?,  ?)";
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rvo.getNo());
			pstmt.setString(2, rvo.getProdNo());
			pstmt.setString(3, rvo.getContent());

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
			
			//System.out.println(rs.next());
			
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
		
		//String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 2";
		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 2)T)WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() + 1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
			
			//System.out.println(rs.next());
			
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
			
			//System.out.println(rs.next());
			
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
			
			//System.out.println(rs.next());
			
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

	//음료 목록 조회
	public List<ProductVo> selectDrinkList(Connection conn, PageVo pv) {

		//SQL
		
		String sql = "SELECT PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK, IMG_PATH, IMG_PATH2, IMG_PATH3, IMG_PATH4 FROM PRODUCT WHERE CATE_NO = 6";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> voList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			//System.out.println(rs.next());
			
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

	//리뷰 목록 조회
	public List<ReviewVo> selectReviewList(Connection conn, String no) {


		//SQL
		
		String sql = "SELECT P.PROD_NO  ,P.NAME  , R.CONTENT , M.NICK , R.ENROLL_DATE  FROM PRODUCT_REVIEW R JOIN PRODUCT P ON P.PROD_NO = R.PROD_NO JOIN MEMBER M ON R.NO = M.NO WHERE R.PROD_NO = ? ORDER BY R.ENROLL_DATE ASC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewVo> rvoList = new ArrayList<ReviewVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String name = rs.getString("NAME");
				String content = rs.getString("CONTENT");
				String nick = rs.getString("NICK");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0,10);
				
				ReviewVo rvo = new ReviewVo();
				rvo.setProdNo(prodNo);
				rvo.setName(name);
				rvo.setContent(content);
				rvo.setNick(nick);
				rvo.setEnrollDate(enrollDate);
				
				//System.out.println("rvo :" +rvo);
				rvoList.add(rvo); 
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return rvoList;
	}


	//내가 쓴 리뷰 조회
	public List<ReviewVo> selectMyReviewList(Connection conn, String no, PageVo pv) {


		//SQL
		
		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT R.REVIEW_NO, M.NO, P.NAME  , R.CONTENT , R.ENROLL_DATE  FROM PRODUCT_REVIEW R JOIN PRODUCT P ON P.PROD_NO = R.PROD_NO JOIN MEMBER M ON R.NO = M.NO WHERE M.NO = ? ORDER BY R.REVIEW_NO DESC)T) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewVo> rvoList = new ArrayList<ReviewVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() + 1;
			
			pstmt.setString(1, no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String reviewNo = rs.getString("REVIEW_NO");
				String nno = rs.getString("NO");
				String name = rs.getString("NAME");
				String content = rs.getString("CONTENT");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0,10);
				
				ReviewVo rvo = new ReviewVo();
				rvo.setReviewNo(reviewNo);
				rvo.setNo(nno);
				rvo.setName(name);
				rvo.setContent(content);
				rvo.setEnrollDate(enrollDate);
				
				//System.out.println("rvo :" +rvo);
				rvoList.add(rvo); 
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		//System.out.println("rvoList" + rvoList);
		return rvoList;
	
	}

	//내가 쓴 리뷰 수 조회
	public int selecMyReviewCount(Connection conn, String no) {
				
		//SQL
		String sql = "SELECT COUNT (*) AS CNT FROM PRODUCT_REVIEW WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);

			rs = pstmt.executeQuery();
			
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

	//관리자 식재료 등록
	public int insertProduct(Connection conn, ProductVo vo) {

		//SQL (준비, 완성, 실행)
		String sql = "INSERT INTO PRODUCT (PROD_NO, CATE_NO, NAME, INFO, DETAIL, PRICE, WEIGHT, STOCK , IMG_PATH) VALUES(SEQ_PRODUCT_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?,?)";

		PreparedStatement pstmt = null;
		int result = 0;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCateNo());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getInfo());
			pstmt.setString(4, vo.getDetail());
			pstmt.setString(5, vo.getPrice());
			pstmt.setString(6, vo.getWeight());
			pstmt.setString(7, vo.getStock());
			pstmt.setString(8, vo.getImgPath());
			
			
			System.out.println("vo.getName : " + vo.getName());
			

			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println("DAO 쪽 리뷰 인서트 결과" + result);
		return result;
	}

	//관리자 식재료 첨부파일 등록
	public int insertAttachment(Connection conn, AttachmentVo avo) {
		//SQL
		
		String sql = "INSERT INTO PRODUCTATTACHMENT ( NO ,PRODUCT_NO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_PRODUCTATTACHMENT_NO.NEXTVAL , SEQ_PRODUCT_NO.CURRVAL , ? , ? , ? )";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, avo.getOriginName());
			pstmt.setString(2, avo.getChangeName());
			pstmt.setString(3, avo.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;

	
	}

	//관리자가 추가한 식재료 번호 가져오기
	public int FindProdNo(Connection conn, ProductVo vo) {

		//SQL
		String sql = "SELECT PROD_NO FROM PRODUCT WHERE NAME = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("PROD_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	
	}

	//식재료 장바구니에 담기
	public int addCart(Connection conn, ProductCartVo pvo) {

		String sql = "INSERT INTO CART (NO, PROD_NO, CNT) VALUES (?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getNo());
			pstmt.setString(2, pvo.getProdNo());
			pstmt.setString(3, pvo.getProdCnt());
			
			System.out.println(pvo.getProdNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			
		}
		
		return result;
	
	}

}
