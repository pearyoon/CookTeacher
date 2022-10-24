package com.kh.cook.report.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.report.dao.ReportDao;
import com.kh.cook.report.vo.ReportVo;

public class ReportService {

	//신고 게시글 조회
	public List<ReportVo> selectReportList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<ReportVo> voList = new ReportDao().selectReportList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//신고 글 상세조회
	public ReportVo selectReportOne(String no) {
		//커넥션
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		ReportVo vo = null;
		
		int result = new ReportDao().increaseHit(conn, no);
		if(result == 1) {
			JDBCTemplate.commit(conn);
			vo = new ReportDao().selectReportOne(conn, no);
			
		}
		JDBCTemplate.close(conn);
		
		return vo;
		
	}

	//신고글 삭제
	public int delete(String no) {
		//커넥션
		//sql
		//트랜잭션,클로즈
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReportDao().delete(conn, no);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		 JDBCTemplate.close(conn);
		
		return result;
	}

}
