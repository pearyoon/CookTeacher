package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.bobstory.vo.PageVo;
import com.kh.cook.common.JDBCTemplate;

public class BobCmtDao {

	//댓글 작성하기
	public int insertCmt(Connection conn, BobCmtVo cmtvo) {
		//sql
		
		String sql = "INSERT INTO BOBSTORY_CMT (CMT_NO, POST_NO, WRITER, CMT) VALUES (SEQ_BOBSTORY_CMT_NO.NEXTVAL, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cmtvo.getPostNo());
			pstmt.setString(2, cmtvo.getWriter());
			pstmt.setString(3, cmtvo.getCmt());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//댓글 목록 조회
	public List<BobCmtVo> selectList(Connection conn) {
		//sql
		
		String sql = "SELECT BC.CMT_NO ,BC.POST_NO ,M.NICK AS WRITER ,BC.CMT FROM BOBSTORY_CMT BC JOIN MEMBER M ON M.NO = BC.WRITER";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BobCmtVo> cmtList = new ArrayList<BobCmtVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//rs -> vo
				String cmtNo = rs.getString("CMT_NO");
				String postNo = rs.getString("POST_NO");
				String writer = rs.getString("WRITER");
				String cmt = rs.getString("CMT");
				
				//vo -> list
				BobCmtVo vo = new BobCmtVo();
				vo.setCmtNo(cmtNo);
				vo.setPostNo(postNo);
				vo.setWriter(writer);
				vo.setCmt(cmt);

				
				cmtList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return cmtList;
	}

	//댓글 갯수 조회
	public int selectCount(Connection conn) {
		//sql
		
		String sql = "SELECT COUNT (*) AS CNT FROM BOBSTORY_CMT WHERE DELETE_YN = 'N'";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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

	//댓글 수정
	public int updateCmt(Connection conn, BobCmtVo vo) {
		//sql
		
		String sql = "UPDATE BOBSTORY_CMT SET CMT = ? WHERE CMT_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCmt());
			pstmt.setString(2, vo.getCmtNo());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		 return result;
		
		
	}
	
	//댓글 삭제
	public int delete(Connection conn, String cmtNo) {
		//sql
		
		String sql = "UPDATE BOBSTORY_CMT SET DELETE_YN = 'Y' WHERE CMT_NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cmtNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//댓글 셀렉트
	public List<BobCmtVo> selectBobCmt(Connection conn) {
		
		String sql = "SELECT BC.CMT_NO ,BC.POST_NO ,M.NICK AS WRITER ,BC.CMT FROM BOBSTORY_CMT BC JOIN MEMBER M ON M.NO = BC.WRITER JOIN BOBSTORY B ON B.NO = BC.POST_NO WHERE B.NO = BC.POST_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BobCmtVo> cmtList = new ArrayList<BobCmtVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				String cmtNo = rs.getString("CMT_NO");
				String postNo = rs.getString("POST_NO");
				String writer = rs.getString("WRITER");
				String cmt = rs.getString("CMT");
				
				BobCmtVo vo = new BobCmtVo();
				vo.setCmtNo(cmtNo);
				vo.setPostNo(postNo);
				vo.setWriter(writer);
				vo.setCmt(cmt);
				
				cmtList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return cmtList;
		
	}


}
