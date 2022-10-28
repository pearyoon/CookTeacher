package com.kh.cook.bobstory.service;

import java.sql.Connection;

import com.kh.cook.bobstory.vo.BobCmtVo;
import com.kh.cook.common.JDBCTemplate;

public class BobCmtService {

	//댓글 작성
	public int writeCmt(BobCmtVo vo) {
		//커넥션
		//sql
		//트랜잭션, 클로즈
		
		Connection conn = JDBCTemplate.getConnection();
		
		
	}

}
