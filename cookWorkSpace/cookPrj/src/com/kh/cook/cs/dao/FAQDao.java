package com.kh.cook.cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.cs.vo.CSVo;

public class FAQDao {

	//FAQ 리스트 조회
	public List<CSVo> selectFAQList(Connection conn) {
		
		String sql = "SELECT Q.QNA_NO ,M.NICK ,Q.TITLE ,Q.CONT ,Q.Q_DATE ,Q.DELETE_YN ,Q.EDIT_DATE ,Q.QNA_CATE FROM QNA Q JOIN MEMBER M ON Q.NO = M.NO WHERE Q.DELETE_YN = 'N' AND Q.QNA_CATE = 'F' ORDER BY Q.QNA_NO DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CSVo> FAQList = new ArrayList<CSVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return FAQList;
	}

}
