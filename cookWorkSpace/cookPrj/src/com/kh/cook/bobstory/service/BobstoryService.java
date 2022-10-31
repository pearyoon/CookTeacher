package com.kh.cook.bobstory.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.bobstory.dao.BobstoryDao;
import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.bobstory.vo.BobstoryVo;
import com.kh.cook.bobstory.vo.CategoryVo;
import com.kh.cook.bobstory.vo.PageVo;
import com.kh.cook.common.JDBCTemplate;

public class BobstoryService {

	private final BobstoryDao dao = new BobstoryDao();
	
	//게시글 갯수 조회
	public int selectCount() {
		//커넥션
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.selectCount(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

	//게시글 목록 조회
	public List<BobstoryVo> selectList(PageVo pv) {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BobstoryVo> list = dao.selectList(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	//카테고리 목록 조회
	public List<CategoryVo> selectCategoryList() {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<CategoryVo> list = dao.selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	//게시글 작성
	public int write(BobstoryVo vo, AttachmentVo avo) {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 insert
		int result = dao.insertStory(conn, vo);
		
		//첨부파일 insert
		int result2 = 1;
		if(avo != null) {
			result2 = dao.insertAttachment(conn, avo);
		}
		
		
		if(result * result2 == 1) {
			//성공
			JDBCTemplate.commit(conn);
		}else {
			//실패
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result * result2 ;
		
	}

	//게시글 상세 조회
	public BobstoryVo selectOne(String bno) {
		//커넥션 준비
		//SQL
		//트랜잭션, 자원반납
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.increaseHit(conn, bno);

		BobstoryVo vo = null;
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
			vo = dao.selectOne(conn, bno);
		}
		
		JDBCTemplate.close(conn);
		
		return vo;
		
		
	}

	//첨부파일 조회
	public AttachmentVo selectAttachment(String bno) {
		//커넥션
		//SQL
		//트랜잭션, 자원반납
		Connection conn = JDBCTemplate.getConnection();
		
		AttachmentVo vo = dao.selectAttachment(conn, bno);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//게시글 신고하기
	public int report(String no) {
		//커넥션 에스큐엘 트랜잭션 클로즈
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.report(conn, no);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}


	//게시글 삭제하기
	public int delete(String no) {
		//커넥션
		//SQL
		//트랜잭션 자원반납
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.delete(conn, no);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//게시글 수정하기
	public int edit(BobstoryVo vo) {
		//커넥션준비
				//SQL
				//트랜잭션 , 자원반납
				
				Connection conn = JDBCTemplate.getConnection();
				
				int result =dao.updateOne(conn, vo);
				
				if(result == 1) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.rollback(conn);
				}
				
				JDBCTemplate.close(conn);
				
				return result;
	}

	//게시글 좋아요 증가
	public String plusLikeOne(String no) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.plusLikeOne(conn, no);
		
		String bobLike = null;
		if(result == 1) {
			JDBCTemplate.commit(conn);
			bobLike = dao.selectLike(conn, no);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return bobLike;
	}

	public BobstoryVo selectBoardOne(String no) {
		// TODO Auto-generated method stub
		return null;
	}


	


}
