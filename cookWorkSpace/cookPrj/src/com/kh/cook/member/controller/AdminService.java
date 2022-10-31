package com.kh.cook.member.controller;

import static com.kh.cook.common.JDBCTemplate.close;
import static com.kh.cook.common.JDBCTemplate.commit;
import static com.kh.cook.common.JDBCTemplate.getConnection;
import static com.kh.cook.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.PageVo;
import com.kh.cook.member.service.MemberService;
import com.kh.cook.member.vo.MemberVo;

public class AdminService {
	
	private static final AdminDao dao = new AdminDao();
	
	public int selectCount(MemberVo vo) {
		Connection conn = getConnection();
		
		int result = dao.selectCount(conn, vo);
		
		close(conn);
		
		return result;
	}
	
	public List<MemberVo> selectList(PageVo pvo) {
		
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectList(conn,pvo);
		
		close(conn);
		
		return voList;
	}

	public List<MemberVo> selectListByQuit(PageVo pvo ,String quitYn) {
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectListByQuit(conn,pvo,quitYn);
		
		close(conn);
		
		return voList;
	}


	public List<MemberVo> selectListById(PageVo pvo, String id) {
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectListById(conn, pvo,id);
		
		close(conn);
		
		return voList;
	}

	public int updateMember(MemberVo vo) {
		Connection conn = getConnection();
		
		int result = dao.updateMember(vo, conn);
		
		MemberVo updateMember = null;
		if(result == 1) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}




}
