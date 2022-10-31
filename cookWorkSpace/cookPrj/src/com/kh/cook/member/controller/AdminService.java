package com.kh.cook.member.controller;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.common.PageVo;
import com.kh.cook.member.dao.MemberDao;
import com.kh.cook.member.vo.MemberVo;

public class AdminService {
	
	private static final AdminDao dao = new AdminDao();
	public int selectCount() {
		Connection conn = getConnection();
		
		int result = dao.selectCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public List<MemberVo> selectList(PageVo pvo) {
		
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectList(conn,pvo);
		
		close(conn);
		
		return voList;
	}

	public List<MemberVo> selectQuitYMember(PageVo pvo) {
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectQuitYMember(conn,pvo);
		
		close(conn);
		
		return voList;
	}

	public List<MemberVo> selectQuitNMember(PageVo pvo) {
		Connection conn = getConnection();
		
		List<MemberVo> voList = dao.selectQuitNMember(conn,pvo);
		
		close(conn);
		
		return voList;
	}


}
