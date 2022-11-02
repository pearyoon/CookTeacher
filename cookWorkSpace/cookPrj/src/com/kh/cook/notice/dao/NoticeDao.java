package com.kh.cook.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.PageVo;
import com.kh.cook.notice.vo.NoticeVo;

import static com.kh.cook.common.JDBCTemplate.*;

public class NoticeDao {

	public int selectCount(Connection conn) {
		String sql = "SELECT COUNT(*) AS CNT FROM NOTICE WHERE DELETE_YN = 'N'";
		
		PreparedStatement pstmt= null;
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

	public List<NoticeVo> selectList(Connection conn, PageVo pVo) {
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, T.* FROM ( SELECT N.NO , M.NICK AS WRITER , N.TITLE , N.CONTENT , N.DELETE_YN, N.ENROLL_DATE , N.MODIFY_DATE FROM NOTICE N JOIN MEMBER M ON N.WRITER = M.NO WHERE N.DELETE_YN = 'N' ORDER BY N.NO DESC )T ) WHERE RNUM BETWEEN ? AND ?";
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeVo> voList = new ArrayList<NoticeVo>();
		int start = (pVo.getCurrentPage() - 1) * pVo.getBoardLimit() + 1;
		int end = start + pVo.getBoardLimit() - 1;
		
		pVo.setStart(start);
		pVo.setEnd(end);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
				String no = rs.getString("NO");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 11);
				String deleteYn = rs.getString("DELETE_YN");
				String modifyDate = rs.getString("MODIFY_DATE");
				
				NoticeVo vo = new NoticeVo();
				
				vo.setContent(content);
				vo.setDeleteYn(deleteYn);
				vo.setEnrollDate(enrollDate);
				vo.setModifyDate(modifyDate);
				vo.setNo(no);
				vo.setTitle(title);
				vo.setWriter(writer);
				
				voList.add(vo);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return voList;
	}

	public NoticeVo selectOneByNo(String no, Connection conn) {
		String sql = "SELECT N.NO ,M.NICK AS WRITER ,N.TITLE ,N.CONTENT ,N.ENROLL_DATE ,N.DELETE_YN ,N.MODIFY_DATE FROM NOTICE N JOIN MEMBER M ON N.WRITER = M.NO WHERE N.NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVo vo = null;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dataNo = rs.getString("NO");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 11);
				String deleteYn = rs.getString("DELETE_YN");
				String modifyDate = rs.getString("MODIFY_DATE");
				
				vo = new NoticeVo();
				
				vo.setContent(content);
				vo.setDeleteYn(deleteYn);
				vo.setEnrollDate(enrollDate);
				vo.setModifyDate(modifyDate);
				vo.setNo(dataNo);
				vo.setTitle(title);
				vo.setWriter(writer);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return vo;
		
		
	}

}
