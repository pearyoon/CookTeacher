package com.kh.cook.member.controller;

import static com.kh.cook.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.PageVo;
import com.kh.cook.member.vo.MemberVo;

public class AdminDao {

	public int selectCount(Connection conn) {
		String sql = "SELECT COUNT(*) AS CNT FROM MEMBER";
		
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
			close(pstmt);
			close(rs);
		}
		return result;
	}

	public List<MemberVo> selectList(Connection conn, PageVo pvo) {
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM (   SELECT M.NO, G.NAME AS GRADE, M.ID, M.NAME, M.ENROLL_DATE, M.QUIT_YN FROM MEMBER M JOIN GRADE G ON M.GRADE = G.NO ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> voList = new ArrayList<MemberVo>();
		
		int start = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit() + 1;
		int end = start + pvo.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String grade =  rs.getString("GRADE");
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 11);
				String quitYn = rs.getString("QUIT_YN");
				
				MemberVo vo = new MemberVo();
				vo.setNo(no);
				vo.setGrade(grade);
				vo.setId(id);
				vo.setName(name);
				vo.setEnrollDate(enrollDate);
				vo.setQuitYn(quitYn);
				
				voList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return voList;
	}

	public List<MemberVo> selectQuitYMember(Connection conn, PageVo pvo) {
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM (   SELECT M.NO, G.NAME AS GRADE, M.ID, M.NAME, M.ENROLL_DATE, M.QUIT_YN FROM MEMBER M JOIN GRADE G ON M.GRADE = G.NO WHERE QUIT_YN = 'Y' ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> voList = new ArrayList<MemberVo>();
		
		int start = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit() + 1;
		int end = start + pvo.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String grade =  rs.getString("GRADE");
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 11);
				String quitYn = rs.getString("QUIT_YN");
				
				MemberVo vo = new MemberVo();
				vo.setNo(no);
				vo.setGrade(grade);
				vo.setId(id);
				vo.setName(name);
				vo.setEnrollDate(enrollDate);
				vo.setQuitYn(quitYn);
				
				voList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return voList;
	}

	public List<MemberVo> selectQuitNMember(Connection conn, PageVo pvo) {
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM (   SELECT M.NO, G.NAME AS GRADE, M.ID, M.NAME, M.ENROLL_DATE, M.QUIT_YN FROM MEMBER M JOIN GRADE G ON M.GRADE = G.NO WHERE QUIT_YN = 'N' ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVo> voList = new ArrayList<MemberVo>();
		
		int start = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit() + 1;
		int end = start + pvo.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String grade =  rs.getString("GRADE");
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 11);
				String quitYn = rs.getString("QUIT_YN");
				
				MemberVo vo = new MemberVo();
				vo.setNo(no);
				vo.setGrade(grade);
				vo.setId(id);
				vo.setName(name);
				vo.setEnrollDate(enrollDate);
				vo.setQuitYn(quitYn);
				
				voList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return voList;
	}



}
