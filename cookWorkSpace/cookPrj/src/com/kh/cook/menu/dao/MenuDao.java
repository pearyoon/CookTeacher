package com.kh.cook.menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.menu.vo.MenuVo;

public class MenuDao {

	//디저트 리스트 조회
	public List<MenuVo> selectDessertList(Connection conn) {
		String sql = "select * from menu where menu_cate_no = 6 order by no";
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuVo> voList = new ArrayList<MenuVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String recipe = rs.getString("RECIPE");
				String menuProd = rs.getString("MENU_PROD");
				String cal = rs.getString("CAL");
				String recommend = rs.getString("RECOMMEND");
				String menuCateNo = rs.getString("MENU_CATE_NO");
				String no = rs.getString("NO");
				String menuName = rs.getString("MENU_NAME");
				String menuInfo = rs.getString("MENU_INFO");
				String imgPath = rs.getString("IMG_PATH");
				
				MenuVo vo = new MenuVo();
				vo.setRecipe(recipe);
				vo.setMenuProd(menuProd);
				vo.setCal(cal);
				vo.setRecommend(recommend);
				vo.setMenuCateNo(menuCateNo);
				vo.setNo(no);
				vo.setMenuName(menuName);
				vo.setMenuInfo(menuInfo);
				vo.setImgPath(imgPath);
				
				voList.add(vo);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return voList;
	}

}
