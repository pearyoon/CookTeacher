package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.common.JDBCTemplate;

public class BobCmtDao {

	//댓글 작성하기
	public int insertCmt(Connection conn, BobCmtVo vo) {
		//sql
		
		String sql = "INSERT INTO BOBSTORY_CMT (CMT_NO, POST_NO, WRITER, CMT) VALUES (SEQ_BOBSTORY_CMT_NO.NEXTVAL, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getPostNo());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getCmt());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//댓글 목록 조회
	public List<BobCmtVo> cmtCount(Connection conn, String no) {
		// TODO Auto-generated method stub
		return null;
	}

}
