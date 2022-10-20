package com.kh.cook.cs.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.cs.dao.FAQDao;
import com.kh.cook.cs.vo.CSVo;

public class FAQService {

	private final FAQDao dao =  new FAQDao();
	
	//FAQ 리스트 조회
	public List<CSVo> selectFAQList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<CSVo> FAQList = dao.selectFAQList(conn);
		
		JDBCTemplate.close(conn);
		
		return FAQList;
		
	}

}
