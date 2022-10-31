package com.kh.cook.member.service;

import static com.kh.cook.common.JDBCTemplate.close;
import static com.kh.cook.common.JDBCTemplate.commit;
import static com.kh.cook.common.JDBCTemplate.getConnection;
import static com.kh.cook.common.JDBCTemplate.rollback;

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
	public MemberVo findId(MemberVo vo) {
		Connection conn = getConnection();
		
		MemberVo findMember = dao.findId(vo,conn);
		
		close(conn);
		
		return findMember;
	}
	
	// 아이디 중복검사
	public int dupCheckId(String id) {
		
		Connection conn = getConnection();
		
		int result = dao.dupCheckId(id ,conn);
		
		close(conn);
		
		return result;
	}
	
	// 닉네임 중복검사
	public int dupCheck(String nick) {
		
		Connection conn = getConnection();
		
		int result = dao.dupCheckNick(nick, conn);
		
		close(conn);
		
		return result;
	}
	// 이메일 중복검사
	public int dupCheckEmail(String email) {
		
		Connection conn = getConnection();
		
		int result = dao.dupCheckEmail(email, conn);
		
		close(conn);
		
		return result;
	}
	public String findPwd(MemberVo vo) {
		Connection conn = getConnection();
		
		String no = dao.findPwd(vo, conn);
		
		close(conn);
		
		return no;
	}
	public int modifyPwd(MemberVo vo) {
		Connection conn = getConnection();
		
		int result = dao.modifyPwd(vo, conn);
		
		if(result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public int quit(MemberVo vo) {
		
		Connection conn = getConnection();
		
		MemberVo checkMember = dao.selectOne(vo,conn); 
				
		int result = 0;
		
		if(checkMember != null) {
			result = dao.quit(conn,vo);
		}
		
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	public MemberVo gradeCheck(MemberVo vo) {
		Connection conn = getConnection();
		
		int result = dao.updateGrade(vo, conn);
		
		MemberVo checkGrade = null;
		if(result == 1) {
			commit(conn);
			checkGrade = dao.selectOneByNo(vo.getNo(), conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return checkGrade;
	}
	public MemberVo selectOneByNo(String no) {
		Connection conn = getConnection();
		
		MemberVo vo = dao.selectOneByNo(no,conn);
		
		close(conn);
		
		return vo;
	}



}
