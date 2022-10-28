package com.kh.cook.menu.service;

import static com.kh.cook.common.JDBCTemplate.close;
import static com.kh.cook.common.JDBCTemplate.commit;
import static com.kh.cook.common.JDBCTemplate.getConnection;
import static com.kh.cook.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.menu.dao.MenuDao;
import com.kh.cook.menu.vo.MenuAttachmentVo;
import com.kh.cook.menu.vo.MenuCartVo;
import com.kh.cook.menu.vo.MenuCateVo;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.product.vo.ProductVo;

import oracle.net.nt.ConnectDescription;

public class MenuService {



	//
	public MenuVo selectMenuOne(String no) {
		//커넥션 준비
		//sql
		//트랜젝션, 자원반납
		Connection conn = JDBCTemplate.getConnection();
		
		MenuVo vo = new MenuDao().selectMenuOne(conn, no);
		
		JDBCTemplate.close(conn);
		
		return vo;
		
		
	}

	public List<ProductVo> selectProdList(String no) {
		Connection conn = JDBCTemplate.getConnection();
		
		List<ProductVo> prodList = new MenuDao().selectProdList(conn, no);
		
		JDBCTemplate.close(conn);
		
		return prodList;
	}

	//디저트 리스트 조회
	public List<MenuVo> selectDessertList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectDessertList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
				
	
	}
	
	//한식 리스트 조회
	public List<MenuVo> selectKoreanList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectKoreanList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
				
	
	}
	
	//반찬 리스트 조회
	public List<MenuVo> selectBanchanList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectBanchanList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//일식 리스트 조회
	public List<MenuVo> selectJapaneseList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectJapaneseList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//즁삭 리스트 조회
	public List<MenuVo> selectChineseList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectChineseList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//양식 리스트 조회
	public List<MenuVo> selectWesternList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectWesternList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//조회수 증가
	public String plusRecommOne(String no) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MenuDao().plusRecommOne(conn, no);
		String recomm = null;
		if(result == 1) {
			JDBCTemplate.commit(conn);
			recomm = new MenuDao().selectRecommOne(conn,no);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		
		return recomm;
	}

	//레시피 카테고리 조회
	public List<MenuCateVo> selectMenuCateList() {
		Connection conn = JDBCTemplate.getConnection();
		
		List<MenuCateVo> menuCateList = new MenuDao().selectMenuCateList(conn);
		
		JDBCTemplate.close(conn);
		
		return menuCateList;
	}

	//레시피 등록 넘버 조회
	public String menuNum() {
		Connection conn = JDBCTemplate.getConnection();
		
		String result = new MenuDao().menuNum(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ProductVo changeProdNo(String prodInput) {
		Connection conn = JDBCTemplate.getConnection();
		
		ProductVo changeInput = new MenuDao().changeProdNo(conn, prodInput);
		
		JDBCTemplate.close(conn);
		
		return changeInput;
	}

	//레시피 등록
	public int menuWrite(MenuVo menuVo, MenuAttachmentVo menuAttachmentVo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MenuDao().insertRecipe(conn, menuVo);
		
		int result2 = 1;
		if(menuAttachmentVo != null) {
			result2 = new MenuDao().insertAttachment(conn, menuAttachmentVo);
		}
		
		if(result * result2 == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
				
	}

	public MenuAttachmentVo selectMenuAttachment(String no) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		MenuAttachmentVo vo =  new MenuDao().selectAttachment(conn,no);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//mcv = 메뉴카트vo
	public int cartInput(MenuCartVo mcv) {
		Connection conn = getConnection();
		
		int result = new MenuDao().addCart(conn, mcv);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}




}
