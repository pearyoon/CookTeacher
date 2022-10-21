package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.CategoryVo;
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
		
		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM , T.* FROM (SELECT B.NO ,B.WRITER ,B.CATEGORY ,B.TITLE ,B.CONTENT ,B.ENROLL_DATE ,B.DELETE_YN ,B.C_LIKE ,B.MODIFY_DATE ,B.VIEW_COUNT ,B.REPORT_YN ,M.NICK AS NICK FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO WHERE B.DELETE_YN = 'N' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
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

	//카테고리 목록 조회
	public List<CategoryVo> selectCategoryList(Connection conn) {
		//SQL
		
		String sql = "SELECT MENU_CATE_NO, MENU_TYPE FROM MENU_CATE";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CategoryVo> list = new ArrayList<CategoryVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			//rs -> var -> vo
			while(rs.next()) {
				//rs -> var
				String no = rs.getString("MENU_CATE_NO");
				String type = rs.getString("MENU_TYPE");
				
				//var -> vo
				CategoryVo vo = new CategoryVo(no, type);
				//2개밖에 없으니 만들어질 때 부터 값을 넣어줍니다.
				
				list.add(vo);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}

	//게시글 작성
	public int insertStory(Connection conn, BobstoryVo vo) {
		//SQL
		
		String sql = "INSERT INTO BOBSTORY (NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES (SEQ_BOBSTORY_NO.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
