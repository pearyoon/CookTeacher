package com.kh.cook.cs.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.cs.dao.QNADao;
import com.kh.cook.cs.vo.CSVo;

public class QNAService {
	
	private final QNADao dao = new QNADao();

	//QNA 리스트 조회
	public List<CSVo> selectQNAList() {
		
		Connection conn = JDBCTemplate.getConnection();

		List<CSVo> QNAList = dao.selectQNAList(conn);
		
		JDBCTemplate.close(conn);
		
		return QNAList;
	
	}

}
