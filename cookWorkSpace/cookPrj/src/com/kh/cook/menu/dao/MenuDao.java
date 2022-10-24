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
import com.kh.cook.product.vo.ProductVo;

public class MenuDao {

	//디저트 리스트 조회
	public List<MenuVo> selectDessertList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 6 ORDER BY NO";
		
		
		
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

	public MenuVo selectMenuOne(Connection conn, String no) {
		
		String sql = "SELECT RECIPE ,MENU_PROD ,CAL ,RECOMMEND ,MENU_CATE_NO ,MENU_NAME ,MENU_INFO ,IMG_PATH FROM MENU WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String recipe = rs.getString("RECIPE");
				String menuProd = rs.getString("MENU_PROD");
				String cal = rs.getString("CAL");
				String recommend = rs.getString("RECOMMEND");
				String menuCate_no = rs.getString("MENU_CATE_NO");
				String menuName = rs.getString("MENU_NAME");
				String menuInfo = rs.getString("MENU_INFO");
				String imgPath = rs.getString("IMG_PATH");
				
				vo = new MenuVo();
				vo.setRecipe(recipe);
				vo.setMenuProd(menuProd);
				vo.setCal(cal);
				vo.setRecommend(recommend);
				vo.setMenuCateNo(menuCate_no);
				vo.setMenuName(menuName);
				vo.setMenuInfo(menuInfo);
				vo.setImgPath(imgPath);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return vo;
	}

	public List<ProductVo> selectProdList(Connection conn, String no) {
		String sql = "SELECT PROD_NO ,CATE_NO ,STOCK ,PRICE ,WEIGHT ,INFO ,NAME ,IMG_PATH FROM PRODUCT WHERE PROD_NO IN( SELECT MP.PROD_NO FROM MENU M JOIN MENU_PROD MP ON M.NO = MP.NO WHERE MP.NO = ? )";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> prodList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String cate_no = rs.getString("CATE_NO");
				String stock = rs.getString("STOCK");
				String price = rs.getString("PRICE");
				String weight = rs.getString("WEIGHT");
				String info = rs.getString("INFO");
				String name = rs.getString("NAME");
				String img_path = rs.getString("IMG_PATH");
				
				ProductVo prodVo = new ProductVo();
				prodVo.setProdNo(prodNo);
				prodVo.setCateNo(cate_no);
				prodVo.setStock(stock);
				prodVo.setPrice(price);
				prodVo.setWeight(weight);
				prodVo.setInfo(info);
				prodVo.setName(name);
				prodVo.setImgPath(img_path);
				
				prodList.add(prodVo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return prodList;
		
	}


	// 추천순
	public List<MenuVo> selectRecommList(Connection conn) {
		String sql = "SELECT * FROM MENU ORDER BY RECOMMEND DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuVo> recommList = new ArrayList<MenuVo>();
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
				
				recommList.add(vo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return recommList;
		
	}


}
