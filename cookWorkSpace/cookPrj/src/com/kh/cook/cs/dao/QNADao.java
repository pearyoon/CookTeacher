package com.kh.cook.cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.common.PageVo;
import com.kh.cook.cs.vo.CSVo;

public class QNADao {

	//QNA 리스트 조회
	public List<CSVo> selectQNAList(Connection conn, PageVo pv) {

		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM (SELECT Q.QNA_NO ,M.NICK ,Q.TITLE ,Q.CONT ,Q.Q_DATE ,Q.DELETE_YN ,Q.EDIT_DATE ,Q.QNA_CATE FROM QNA Q JOIN MEMBER M ON Q.NO = M.NO WHERE Q.DELETE_YN = 'N' AND Q.QNA_CATE = 'Q' ORDER BY Q.QNA_NO DESC)T ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CSVo> QNAList = new ArrayList<CSVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//페이징처리..꼭하기. 페이징처리하면 쿼리문 마지막 수정해야함.
			int start = (pv.getCurrentPage() -1 ) * pv.getBoardLimit() +1;
			int end = start + pv.getBoardLimit() -1;
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String qnaNo = rs.getString("QNA_NO");
				String writer = rs.getString("NICK");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONT");
				String qnaDate = rs.getString("Q_DATE").substring(0,10);
				String deleteYN = rs.getString("DELETE_YN");
				String editDate = rs.getString("EDIT_DATE");
				String qnaCategory = rs.getString("QNA_CATE");
				
				CSVo vo = new CSVo();
				vo.setQnaNo(qnaNo);
				vo.setWriter(writer);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setQnaDate(qnaDate);
				vo.setDeleteYN(deleteYN);
				vo.setEditDate(editDate);
				vo.setQnaCategory(qnaCategory);
				
				QNAList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return QNAList;
	}

	//페이지카운트
		public int pageSelectCount(Connection conn) {
			
			String sql = "SELECT COUNT(*) AS CNT FROM QNA WHERE QNA_CATE = 'Q'";
			
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

		public int insertQNA(Connection conn, CSVo vo) {

			String sql = "INSERT INTO QNA VALUES(SEQ_QNA_NO.NEXTVAL, ? , ?, ?, SYSDATE,'N',SYSDATE,'Q')";
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				System.out.println("sql문 실행됨");
				
				pstmt.setString(1, vo.getNo());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				System.out.println(vo);
				
				result = pstmt.executeUpdate();
				System.out.println("sql추가됨");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public CSVo selectQNAone(Connection conn, String qNo) {
			
			String sql = "SELECT Q.QNA_NO,Q.NO, Q.TITLE, Q.CONT, Q.Q_DATE, Q.EDIT_DATE, Q.DELETE_YN, Q.QNA_CATE, M.NICK AS WRITER FROM QNA Q JOIN MEMBER M ON Q.NO = M.NO WHERE QNA_CATE = 'Q' AND Q.QNA_NO = ? AND Q.DELETE_YN = 'N'";
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			CSVo vo = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, qNo);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String qnaNo = rs.getString("QNA_NO");
					String no = rs.getString("NO");
					String writer = rs.getString("WRITER");
					String title = rs.getString("TITLE");
					String content = rs.getString("CONT");
					String qnaDate = rs.getString("Q_DATE").substring(0,10);
					String deleteYN = rs.getString("DELETE_YN");
					String editDate = rs.getString("EDIT_DATE");
					String qnaCategory = rs.getString("QNA_CATE");
					
					vo = new CSVo();
					vo.setQnaNo(qnaNo);
					vo.setNo(no);
					vo.setWriter(writer);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setQnaDate(qnaDate);
					vo.setDeleteYN(deleteYN);
					vo.setEditDate(editDate);
					vo.setQnaCategory(qnaCategory);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
				JDBCTemplate.close(rs);
			}
			
			return vo;
		}

		public int updateQNAone(Connection conn, CSVo QNAvo) {
			
			String sql = "UPDATE QNA SET TITLE = ?, CONT = ?, MODIFY_DATE = SYSDATE WHERE QNA_NO = ?";
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, QNAvo.getTitle());
				pstmt.setString(2, QNAvo.getContent());
				pstmt.setString(3, QNAvo.getQnaNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			
			
			return result;
		}


}
;