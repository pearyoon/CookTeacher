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

public class FAQDao {

	//FAQ 리스트 조회
	public List<CSVo> selectFAQList(Connection conn, PageVo pv) {
		
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM , T.* FROM (SELECT Q.QNA_NO ,M.NICK ,Q.TITLE ,Q.CONT ,Q.Q_DATE ,Q.DELETE_YN ,Q.EDIT_DATE ,Q.QNA_CATE FROM QNA Q JOIN MEMBER M ON Q.NO = M.NO WHERE Q.DELETE_YN = 'N' AND Q.QNA_CATE = 'F' ORDER BY Q.QNA_NO DESC)T ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CSVo> FAQList = new ArrayList<CSVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
				String qnaDate = rs.getString("Q_DATE");
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
				
				FAQList.add(vo); 
				System.out.println(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return FAQList;
	}

	//페이지카운트
	public int pageSelectCount(Connection conn) {
		
		String sql = "SELECT COUNT(*) AS CNT FROM QNA WHERE QNA_CATE = 'F'";
		System.out.println("쿼리문작성");//삭제예정
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			System.out.println("쿼리문진행됨");//
			
			if(rs.next()) {
				result = rs.getInt("CNT");
				System.out.println("쿼리 진행 후 rs값 : " + result);//
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	

}
