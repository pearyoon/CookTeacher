package com.kh.cook.product.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.cook.common.JDBCTemplate.*;

import com.kh.cook.product.dao.ProductDao;
import com.kh.cook.product.vo.PageVo;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

public class ProductService  {
	
	private final ProductDao dao = new ProductDao(); //new ProductDao() 대신 dao 로 


	//식재료 목록 조회
	public List<ProductVo> selectProductList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectProductList(conn , pv);
		
		close(conn);
		
		
		return voList;
		
		
	}


	//식재료 상세 조회
	public ProductVo selectProductOne(String no) {

		//커넥션 준비
		//SQL (조회수 증가, 상세조회)
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		ProductVo vo = new ProductDao().selectProductOne(conn, no);

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


	//식재료 리뷰 작성
	public int write(ReviewVo rvo) {

		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = getConnection(); 
		
		int result = dao.insertReview(conn, rvo);
		
		if(result ==1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	//과일채소 목록 조회
	public List<ProductVo> selectFruitVegeList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectFruitVegeList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	
	}

	
	//해산물 목록 조회
	public List<ProductVo> selectseafoodList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectSeafoodList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	}


	//기타 목록 조회
	public List<ProductVo> selectEtcList(PageVo pv) {
		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectEtcList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
			
	}

	//육류계란 목록 조회
	public List<ProductVo> selectMeatEggList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectMeatEggList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	}


	//면류빵류 목록 조회
	public List<ProductVo> selectNoodleBreadList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectNoodleBreadList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	}


	//유제품 목록 조회
	public List<ProductVo> selectDairyList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectDairyList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	}

	//음료 목록 조회
	public List<ProductVo> selectDrinkList(PageVo pv) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ProductVo> voList = dao.selectDrinkList(conn , pv);
		
		close(conn);
		
		System.out.println(voList);
		return voList;
	}

	
	//리뷰 조회
	public List<ReviewVo> selectReview(String no) {

		//커넥션 준비
		//SQL
		//트랜잭션 처리, 자원반납
		
		Connection conn = getConnection();
		
		List<ReviewVo> rvoList = dao.selectReviewList(conn, no);
		
		close(conn);
		
		System.out.println(rvoList);
		return rvoList;
	}
	

}
