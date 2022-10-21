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
		
		System.out.println("conn연결중");
		int result = dao.pageSelectCount(conn);
		System.out.println("Service에서 int값 담김. result : " + result);
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int write(CSVo vo) {
		return 0;
	}
	

}
