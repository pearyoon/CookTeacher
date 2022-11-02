package com.kh.cook.cs.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.common.PageVo;
import com.kh.cook.cs.dao.QNADao;
import com.kh.cook.cs.vo.CSCommentVo;
import com.kh.cook.cs.vo.CSVo;

public class QNAService {
	
	private final QNADao dao = new QNADao();

	//QNA 리스트 조회
	public List<CSVo> selectQNAList(PageVo pv) {
		
		Connection conn = JDBCTemplate.getConnection();

		List<CSVo> QNAList = dao.selectQNAList(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return QNAList;
	
	}

	public int pageSelectCount() {
			
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.pageSelectCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//문의글 작성
	public int write(CSVo vo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.insertQNA(conn, vo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.getConnection();
		}
		
		JDBCTemplate.close(conn);		
		
		return result;
	}

	//문의글 상세
	public CSVo selectQNAone(String qnaNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		CSVo QNAvo = dao.selectQNAone(conn,qnaNo);
		//답변 정보 코드 작성하기 CSCommentVo 에 담아서
		
		JDBCTemplate.close(conn);
		
		return QNAvo;
	}

	//문의글 수정
	public int edit(CSVo QNAvo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.updateQNAone(conn, QNAvo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
				
		return result;
	}
	
	//문의 삭제
	public int delete(String qno) {
		
		Connection conn = JDBCTemplate.getConnection();
				
		int result = dao.delete(conn, qno);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//내가 쓴 문의 조회
	public List<CSVo> selectMyQNAList(String no) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<CSVo> voList = dao.selectMyQNAList(conn, no);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//답변 작성
	public int reply(CSCommentVo cvo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.reply(conn, cvo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
				
		return result;
	}

	//답변 조회
	public CSCommentVo selectReplyOne(String qnaNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		CSCommentVo cvo = dao.selectReplyOne(conn, qnaNo);
		
		JDBCTemplate.close(conn);
		
		return cvo;
	}

	//답변 수정
	public int editreply(CSCommentVo cvo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.updateReplyOne(conn, cvo);
		System.out.println(result);
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);

		return result;
	}

	public int deletereply(String qno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.deletereply(conn, qno);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
	//답변 삭제

}
