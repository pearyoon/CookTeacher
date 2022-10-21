package com.kh.cook.bobstory.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.bobstory.dao.BobstoryDao;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.CategoryVo;
import com.kh.cook.bobstory.vo.PageVo;
import com.kh.cook.common.JDBCTemplate;

public class BobstoryService {

	//게시글 갯수 조회
	public int selectCount() {
		//커넥션
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BobstoryDao().selectCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

	//게시글 목록 조회
	public List<BobstoryVo> selectList(PageVo pv) {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BobstoryVo> list = new BobstoryDao().selectList(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	//카테고리 목록 조회
	public List<CategoryVo> selectCategoryList() {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<CategoryVo> list = new BobstoryDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//게시글 작성
	public int write(BobstoryVo vo) {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 insert
		int result = new BobstoryDao().insertStory(conn, vo);
		
		if(result == 1) {
			//성공
			JDBCTemplate.commit(conn);
		}else {
			//실패
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}


}
