package com.kh.cook.cs.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.common.PageVo;
import com.kh.cook.cs.dao.FAQDao;
import com.kh.cook.cs.vo.CSVo;

public class FAQService {

	private final FAQDao dao =  new FAQDao();
	
	//FAQ 리스트 조회
	public List<CSVo> selectFAQList(PageVo pv) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<CSVo> FAQList = dao.selectFAQList(conn,pv);
		
		JDBCTemplate.close(conn);
		
		return FAQList;
		
	}

	//페이지카운트
	public int pageSelectCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		int result = dao.pageSelectCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//FAQ글 작성(관리자용)
	public int write(CSVo vo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.insertFAQ(conn,vo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	//FAQ 상세글 조회
	public CSVo selectFAQOne(String no) {

		Connection conn = JDBCTemplate.getConnection();
		
		CSVo FAQvo = null;
		
		//int result = dao.increaseHit(conn, no);
		//if(result ==1) {
			//JDBCTemplate.commit(conn);
			FAQvo = dao.selectFAQOne(conn, no);
		//}
				
		JDBCTemplate.close(conn);
		
		return FAQvo;
	}

	public int edit(CSVo FAQvo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.updateFAQone(conn, FAQvo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
				
		return result;
	}
	

}
