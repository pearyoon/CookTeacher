package com.kh.cook.menu.service;

import java.sql.Connection;
import java.util.List;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.menu.dao.MenuDao;
import com.kh.cook.menu.vo.MenuVo;

import oracle.net.nt.ConnectDescription;

public class MenuService {

	//디저트 리스트 조회
	public List<MenuVo> selectDessertList() {
		
		Connection conn = JDBCTemplate.getConnection();
		List<MenuVo> voList = new MenuDao().selectDessertList(conn);
		
		JDBCTemplate.close(conn);
		
		return voList;
				
	
	}

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

}
