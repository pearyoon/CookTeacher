package com.kh.cook.member.dao;

import static com.kh.cook.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.cook.member.vo.MemberVo;

public class MemberDao {
	// 회원가입
	public int join(Connection conn, MemberVo vo) {
		String sql = "INSERT INTO MEMBER (NO, ID, PWD, EMAIL, NAME, PHONE, NICK, ADDR, ADMIN_YN)VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, 'N')";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getNick());
			pstmt.setString(7, vo.getAddr());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
	}
	
	public MemberVo selectOne(MemberVo vo, Connection conn) {
		String sql = "SELECT M.NO ,G.NAME AS GRADE ,ID ,PWD ,EMAIL ,M.NAME ,PHONE ,NICK ,ADDR ,ENROLL_DATE ,MODIFY_DATE ,QUIT_YN ,POINT ,ADMIN_YN FROM MEMBER M JOIN GRADE G ON M.GRADE = G.NO WHERE ID = ? AND PWD = ? AND QUIT_YN = 'N'";
	
		PreparedStatement pstmt = null;
		MemberVo loginMember = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no = rs.getString("NO");
				String grade = rs.getString("GRADE");
				String id = rs.getString("ID");
				String pwd = rs.getString("PWD");
				String email = rs.getString("EMAIL");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String nick = rs.getString("NICK");
				String dataAddr = rs.getString("ADDR");
				String enroll_date = rs.getString("ENROLL_DATE");
				String modify_date = rs.getString("MODIFY_DATE");
				String quitYn = rs.getString("QUIT_YN");
				String point = rs.getString("POINT");
				String adminYn = rs.getString("ADMIN_YN");
				
				int idx = dataAddr.indexOf(",");
				
				String addr = dataAddr.substring(0, idx);
				String detailAddr = dataAddr.substring(idx+1);
				
				
				loginMember = new MemberVo(no,grade,id,pwd,email,name,phone,nick,addr,detailAddr,enroll_date,modify_date,quitYn,point,adminYn);

				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return loginMember;
	}
	// 수정
	public int updateOneByNo(MemberVo vo, Connection conn) {
		String sql = "UPDATE MEMBER SET PWD = ? ,EMAIL = ? ,PHONE = ? ,NICK = ? ,ADDR = ? WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getNick());
			pstmt.setString(5, vo.getAddr());
			pstmt.setString(6, vo.getNo());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	// 아이디 찾기
	public MemberVo findId(MemberVo vo, Connection conn) {
		String sql = "SELECT ID,ENROLL_DATE FROM MEMBER WHERE NAME = ? AND EMAIL = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVo findMember = null;
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				String id = rs.getString("ID");
				String enrollDate =  rs.getString("ENROLL_DATE").substring(0, 11);
				
				findMember = new MemberVo();
				
				findMember.setId(id);
				findMember.setEnrollDate(enrollDate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return findMember;
	}
	// 아이디 중복 검사
	public int dupCheckId(String id, Connection conn) {
		
		String sql = "SELECT ID FROM MEMBER WHERE ID = ? AND QUIT_YN = 'N'";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1; 
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 닉네임 중복검사
	public int dupCheckNick(String nick, Connection conn) {
		String sql = "SELECT NICK FROM MEMBER WHERE NICK = ? AND QUIT_YN = 'N'";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int dupCheckEmail(String email, Connection conn) {
		String sql = "SELECT EMAIL FROM MEMBER WHERE EMAIL = ? AND QUIT_YN = 'N'";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public String findPwd(MemberVo vo, Connection conn) {
		String sql = "SELECT ID FROM MEMBER WHERE ID = ? AND PHONE = ? AND EMAIL =?";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String memberId = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getEmail());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberId = rs.getString("ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return memberId;
		
	}

}
