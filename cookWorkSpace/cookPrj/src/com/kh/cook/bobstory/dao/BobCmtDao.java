package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.common.JDBCTemplate;

public class BobCmtDao {

	//댓글 작성하기
	public int insertCmt(Connection conn, BobCmtVo vo) {
		//sql
		
		String sql = "INSERT INTO BOBSTORY_CMT (CMT_NO, POST_NO, WRITER, CMT) VALUES (SEQ_BOBSTORY_CMT_NO.NEXTVAL, SEQ_BOBSTORY_NO.CURRVAL, ?, ?);";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getCmt());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
