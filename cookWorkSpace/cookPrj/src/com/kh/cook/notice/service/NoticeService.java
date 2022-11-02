package com.kh.cook.notice.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.PageVo;
import com.kh.cook.notice.dao.NoticeDao;
import com.kh.cook.notice.vo.NoticeVo;

public class NoticeService {
	private static final NoticeDao dao = new NoticeDao();
	public int selectCount() {
		Connection conn = getConnection();
		
		int result = dao.selectCount(conn);
		
		close(conn);
	
		return result;
	}
	public List<NoticeVo> selectList(PageVo pVo) {
		Connection conn = getConnection();
		
		List<NoticeVo> voList = dao.selectList(conn,pVo);
		
		close(conn);
		
		return voList;
	}
	public NoticeVo selectOne(String no) {
		Connection conn = getConnection();
		
		NoticeVo vo = dao.selectOneByNo(no, conn);
		
		close(conn);
		
		
		return vo;
	}
	public int write(NoticeVo vo) {
		Connection conn = getConnection();
		
		int result = dao.write(vo,conn);
		
		if(result == 1) {
			commit(conn);

		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int edit(NoticeVo vo) {
		Connection conn = getConnection();
		
		int result = dao.updateOne(vo, conn);
		
		if(result == 1) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public int delete(String no) {
		Connection conn = getConnection();
		
		int result = dao.delete(no, conn);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
}
