package com.kh.cook.bobstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.bobstory.vo.AttachmentVo;
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
		
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM (SELECT B.NO ,MC.MENU_TYPE AS CATEGORY ,B.TITLE ,B.CONTENT ,B.ENROLL_DATE ,B.DELETE_YN ,B.C_LIKE ,B.MODIFY_DATE ,B.VIEW_COUNT ,B.REPORT_YN ,M.NICK AS WRITER FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO JOIN MENU_CATE MC ON B.CATEGORY = MC.MENU_CATE_NO WHERE B.DELETE_YN = 'N' AND B.REPORT_YN = 'N' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BobstoryVo> voList = new ArrayList<BobstoryVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() + 1;
			
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
				String enrollDate= rs.getString("ENROLL_DATE").substring(0, 10);
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
				vo.setReportYn(reportYn);
				
				
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
		List<CategoryVo> list = new ArrayList<CategoryVo>();
		
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

	//파일 업로드(첨부파일 insert)
	public int insertAttachment(Connection conn, AttachmentVo avo) {
		//SQL
		
		String sql = "INSERT INTO BOBATTACHMENT ( NO ,BOARD_NO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_ATTACHMENT_NO.NEXTVAL , SEQ_BOBSTORY_NO.CURRVAL , ? , ? , ? )";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, avo.getOriginName());
			pstmt.setString(2, avo.getChangeName());
			pstmt.setString(3, avo.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	//조회수 증가
	public int increaseHit(Connection conn, String bno) {
		//SQL
		
		String sql = "UPDATE BOBSTORY SET VIEW_COUNT = VIEW_COUNT + 1 WHERE NO = ? AND DELETE_YN = 'N'";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	//게시글 상세 조회
	public BobstoryVo selectOne(Connection conn, String bno) {
		//SQL
		
		String sql = "SELECT B.NO , B.CATEGORY , B.TITLE , B.CONTENT , B.ENROLL_DATE , B.DELETE_YN , B.C_LIKE , B.MODIFY_DATE , B.VIEW_COUNT , B.REPORT_YN , M.NICK AS WRITER , C.MENU_TYPE AS CATEGORY FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO JOIN MENU_CATE C ON B.CATEGORY = C.MENU_CATE_NO WHERE B.NO = ? AND B.DELETE_YN ='N'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BobstoryVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String writer = rs.getString("WRITER");
				String category = rs.getString("CATEGORY");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0, 10);
				String deleteYn = rs.getString("DELETE_YN");
				String cLike = rs.getString("C_LIKE");
				String modifyDate = rs.getString("MODIFY_DATE");
				String viewCount = rs.getString("VIEW_COUNT");
				String reportYn = rs.getString("REPORT_YN");
				
				vo = new BobstoryVo();
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
				vo.setReportYn(reportYn);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return vo;
	}

	//첨부파일 조회
	public AttachmentVo selectAttachment(Connection conn, String bno) {
		//SQL
		
		String sql = "SELECT * FROM BOBATTACHMENT WHERE STATUS = 'O' AND BOARD_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AttachmentVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String boardNo = rs.getString("BOARD_NO");
				String originName = rs.getString("ORIGIN_NAME");
				String changeName = rs.getString("CHANGE_NAME");
				String filePath = rs.getString("FILE_PATH");
				String enrollDate = rs.getString("ENROLL_DATE");
				String thumbYn = rs.getString("THUMB_YN");
				String status = rs.getString("STATUS");
				
				vo = new AttachmentVo();
				vo.setNo(no);
				vo.setNo(boardNo);
				vo.setOriginName(originName);
				vo.setChangeName(changeName);
				vo.setFilePath(filePath);
				vo.setEnrollDate(enrollDate);
				vo.setThumbYn(thumbYn);
				vo.setStatus(status);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return vo;
		
	}

	//게시글 신고하기
	public int report(Connection conn, String no) {
		//sql
		
		String sql = "UPDATE BOBSTORY SET REPORT_YN = 'Y' WHERE NO = ?";
		
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

	//게시글 삭제
	public int delete(Connection conn, String no) {
		//sql
		
		String sql = "UPDATE BOBSTORY SET DELETE_YN = 'Y' WHERE NO = ?";
		
		PreparedStatement pstmt  = null;
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

	//게시글 수정하기
	public int updateOne(Connection conn, BobstoryVo vo) {
		//SQL
		
		String sql = "UPDATE BOBSTORY SET TITLE = ? , CONTENT = ? , MODIFY_DATE = SYSDATE WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	//좋아요 증가
	public int plusLikeOne(Connection conn, String no) {
		//sql
		
		String sql = "UPDATE BOBSTORY SET C_LIKE = C_LIKE + 1 WHERE NO = ?";
		
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

	//좋아요 수 가져오기
	public String selectLike(Connection conn, String no) {
		//sql
		
		String sql = "SELECT C_LIKE FROM BOBSTORY WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String plusLike = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				plusLike = rs.getString("C_LIKE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return plusLike;
	}

	//내가 쓴 밥스토리 갯수
	public int myBobstoryCount(Connection conn, String no) {
		//sQL
		
		String sql = "SELECT COUNT (*) AS CNT FROM BOBSTORY WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
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

	//내가 쓴 밥스토리 조회
	public List<BobstoryVo> selectMyBobstory(Connection conn, String no, PageVo pv) {
		//sql
		
		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM , AB.* FROM (SELECT B.NO , B.CATEGORY , B.TITLE , B.CONTENT , B.ENROLL_DATE , B.DELETE_YN , B.C_LIKE , B.MODIFY_DATE , B.VIEW_COUNT , B.REPORT_YN , M.NICK AS WRITER FROM BOBSTORY B JOIN MEMBER M ON B.WRITER = M.NO WHERE WRITER = ? ORDER BY B.NO DESC) AB ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BobstoryVo> voList = new ArrayList<BobstoryVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int start = (pv.getCurrentPage() - 1) * pv.getBoardLimit() + 1;
			int end = start + pv.getBoardLimit() + 1;
			
			pstmt.setString(1, no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//rs -> vo
				String no1 = rs.getString("NO");
				String writer = rs.getString("WRITER");
				String category = rs.getString("CATEGORY");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String enrollDate = rs.getString("ENROLL_DATE").substring(0,10);
				String deleteYn = rs.getString("DELETE_YN");
				String cLike = rs.getString("C_LIKE");
				String viewCount = rs.getString("VIEW_COUNT");
				String reportYn = rs.getString("REPORT_YN");
				
				BobstoryVo vo = new BobstoryVo();
				vo.setNo(no1);
				vo.setWriter(writer);
				vo.setCategory(category);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setEnrollDate(enrollDate);
				vo.setDeleteYn(deleteYn);
				vo.setcLike(cLike);
				vo.setViewCount(viewCount);
				vo.setReportYn(reportYn);
				
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
