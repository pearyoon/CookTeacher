package com.kh.cook.member.service;

import static com.kh.cook.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.cook.member.dao.MemberDao;
import com.kh.cook.member.vo.MemberVo;

public class MemberService {
	
	private static final MemberDao dao = new MemberDao();
	// 회원가입
	public int join(MemberVo vo) {
		
		Connection conn = getConnection();
		
		int result = dao.join(conn, vo);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	// 로그인
	public MemberVo selectOne(MemberVo vo) {
		
		Connection conn = getConnection();
		
		MemberVo loginMember = dao.selectOne(vo,conn);
		
		close(conn);
		
		return loginMember;
	}

	// 회원수정
	public MemberVo modify(MemberVo vo) {
		Connection conn = getConnection();
		
		int result = dao.updateOneByNo(vo,conn);
		
		MemberVo updateMember = null;
	
		if(result == 1) {
			commit(conn);
			updateMember = dao.selectOne(vo, conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMember;
	}
	
	// 아이디 찾기
	public String findId(MemberVo vo) {
		Connection conn = getConnection();
		
		String findId = dao.findId(vo,conn);
		
		close(conn);
		
		return findId;
	}
	
	// 아이디 중복검사
	public String dupCheckId(String id) {
		
		Connection conn = getConnection();
		
		String result = dao.dupCheckId(id ,conn);
		
		close(conn);
		
		return result;
	}



}
