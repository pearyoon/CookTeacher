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
		String sql = "SELECT DETAIL, CATE_NO, PROD_NO, PRICE, STOCK, WEIGHT, INFO, IMG_PATH4, IMG_PATH3, IMG_PATH, IMG_PATH2, NAME FROM PRODUCT WHERE PROD_NO IN( SELECT MP.PROD_NO FROM MENU M JOIN MENU_PROD MP ON M.NO = MP.NO WHERE MP.NO = ?)";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductVo> prodList = new ArrayList<ProductVo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				String detail = rs.getString("DETAIL");
				String cateNo = rs.getString("CATE_NO");
				String prodNo = rs.getString("PROD_NO");
				String price = rs.getString("PRICE");
				String stock = rs.getString("STOCK");
				String weight = rs.getString("WEIGHT");
				String info = rs.getString("INFO");
				String imgPath4 = rs.getString("IMG_PATH4");
				String imgPath3 = rs.getString("IMG_PATH3");
				String imgPath = rs.getString("IMG_PATH");
				String imgPath2 = rs.getString("IMG_PATH2");
				String name = rs.getString("NAME");
				
				ProductVo prodVo = new ProductVo();
				prodVo.setDetail(detail);
				prodVo.setCateNo(cateNo);
				prodVo.setProdNo(prodNo);
				prodVo.setPrice(price);
				prodVo.setStock(stock);
				prodVo.setWeight(weight);
				prodVo.setInfo(info);
				prodVo.setImgPath4(imgPath4);
				prodVo.setImgPath3(imgPath3);
				prodVo.setImgPath(imgPath);
				prodVo.setImgPath2(imgPath2);
				prodVo.setName(name);
				
				
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



}
