package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.PageVo;
import com.kh.cook.common.JDBCTemplate;

public class BobstoryDao {

	//게시글 갯수 조회
	public int selectCount(Connection conn) {
		//SQL
		
		String sql = "SELECT COUNT (*) AS CNT FROM BOBSTORY WHERE DELETE_YN = 'N'";
		
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

	//게시글 목록 조회
	public List<BobstoryVo> selectList(Connection conn, PageVo pv) {
		//SQL
		
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM ( SELECT B.NO ,B.WRITER ,B.CATEGORY ,B.TITLE ,B.CONTENT ,B.ENROLL_DATE ,B.DELETE_YN ,B.C_LIKE ,B.MODIFY_DATE ,B.VIEW_COUNT ,B.REPORT_YN ,M.NICK AS WRITER FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO WHERE B.DELETE_YN = 'N' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		//SQL 문 뭔가 이상함 일단 써놓고 다시 해야함.
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BobstoryVo> voList = new ArrayList<BobstoryVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() -1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() +1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//rs -> vo
				String no= rs.getString("NO");
				String writer= rs.getString("WRITER");
				String category= rs.getString("CATEGORY");
				String title= rs.getString("TITLE");
				String content= rs.getString("CONTENT");
				String enrollDate= rs.getString("ENROLL_DATE");
				String deleteYn= rs.getString("DELETE_YN");
				String cLike= rs.getString("C_LIKE");
				String modifyDate= rs.getString("MODIFY_DATE");
				String viewCount= rs.getString("VIEW_COUNT");
				String reportYn= rs.getString("REPORT_YN");
				
				//vo -> list
				BobstoryVo vo = new BobstoryVo();
				vo.setNo(no);
				vo.setWriter(writer);
				vo.setCategory(category);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setEnrollDate(enrollDate);
				vo.setDeleteYn(deleteYn);
				vo.setcLike(cLike);
				vo.setModifyDate(modifyDate);
				vo.setViewCount(viewCount);
				vo.setViewCount(viewCount);
				
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
