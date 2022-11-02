package com.kh.cook.report.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.report.vo.ReportVo;

public class ReportDao {

	//신고게시글 조회
	public List<ReportVo> selectReportList(Connection conn) {
		//SQL
		
		String sql = "SELECT B.NO , M.NICK AS WRITER , MC.MENU_TYPE AS TYPE , B.TITLE , B.CONTENT , B.ENROLL_DATE , B.DELETE_YN , B.C_LIKE , B.MODIFY_DATE , B.VIEW_COUNT , B.REPORT_YN FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO JOIN MENU_CATE MC ON MC.MENU_CATE_NO = B.CATEGORY WHERE B.REPORT_YN = 'Y' ORDER BY NO DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReportVo> voList = new ArrayList<ReportVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO"); 
				String type = rs.getString("TYPE"); 
				String writer = rs.getString("WRITER"); 
				
				
				ReportVo vo = new ReportVo();
				vo.setNo(no);
				vo.setType(type);
				vo.setWriter(writer);
				
				
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

	//신고글 조회수 증가
	public int increaseHit(Connection conn, String no) {
		//sql
		
		String sql = "UPDATE REPORT SET HIT = HIT + 1 WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//신고글 상세조회
	public ReportVo selectReportOne(Connection conn, String no) {
		//sql
		
		String sql = "SELECT R.NO , R.TYPE , R.WRITER , R.HIT , R.REPORT_TIME , R.STATUS , M.NICK AS WRITER FROM REPORT R JOIN MEMBER M ON R.WRITER = M.NO WHERE R.NO = ? AND R.STATUS = 'O'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReportVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String type = rs.getString("TYPE");
				String writer = rs.getString("WRITER");
				String hit = rs.getString("HIT");
				String reportTime = rs.getString("REPORT_TIME");
				
				vo = new ReportVo();
				vo.setType(type);
				vo.setWriter(writer);
				vo.setHit(hit);
				vo.setReportTime(reportTime);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return vo;
		
	}

	//신고글 삭제
	public int delete(Connection conn, String no) {
		//sql
		
		String sql = "UPDATE REPORT SET STATUS = 'X' WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
		
	}

}
