package com.kh.cook.bobstory.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.bobstory.dao.BobCmtDao;
import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.bobstory.vo.PageVo;
import com.kh.cook.common.JDBCTemplate;

public class BobCmtService {

	//댓글 작성
	public int writeCmt(BobCmtVo cmtvo) {
		//커넥션
		//sql
		//트랜잭션, 클로즈
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BobCmtDao().insertCmt(conn, cmtvo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 갯수 조회
	public int selectCount() {
		//커넥션
		//sql
		//트랜잭션, 자원반납
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BobCmtDao().selectCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 수정
	public int edit(BobCmtVo vo) {
		//커넥션
		//sql
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BobCmtDao().updateCmt(conn, vo);
		
		if(result == 1) {
			//수정 성공
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	//댓글 삭제
	public int delete(String cmtNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new BobCmtDao().delete(conn, cmtNo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 리스트 조회
	public List<BobCmtVo> selectBobCmtList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BobCmtVo> list = new BobCmtDao().selectList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}
	
}
