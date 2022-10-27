package com.kh.cook.menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.menu.vo.MenuCateVo;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.product.vo.ProductVo;

public class MenuDao {



	//
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
	
	//한식 리스트 조회
	public List<MenuVo> selectKoreanList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 1 ORDER BY NO";
		
		
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
				
				System.out.println(vo);
				
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

	//반찬 리스트
	public List<MenuVo> selectBanchanList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 2 ORDER BY NO";
		
		
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
				
				System.out.println(vo);
				
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

	//일식 리스트
	public List<MenuVo> selectJapaneseList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 3 ORDER BY NO";
		
		
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
				
				System.out.println(vo);
				
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
	
	//중식 리스트
	public List<MenuVo> selectChineseList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 4 ORDER BY NO";
		
		
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
				
				System.out.println(vo);
				
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
	
	//양식 리스트
	public List<MenuVo> selectWesternList(Connection conn) {
		String sql = "SELECT * FROM MENU WHERE MENU_CATE_NO = 5 ORDER BY NO";
		
		
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
				
				System.out.println(vo);
				
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

	// 좋아요 추가
	public int plusRecommOne(Connection conn, String no) {
		String sql = "UPDATE MENU SET RECOMMEND = RECOMMEND + 1 WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public String selectRecommOne(Connection conn, String no) {

		String sql = "SELECT RECOMMEND\r\n"
				+ "FROM MENU\r\n"
				+ "WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String plusRecomm = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				plusRecomm = rs.getString("RECOMMEND");
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return plusRecomm;
	}

	public List<MenuCateVo> selectMenuCateList(Connection conn) {
		String sql = "SELECT MENU_CATE_NO, MENU_TYPE FROM MENU_CATE";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuCateVo> MenucateList = new ArrayList<MenuCateVo>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String menuCateNo = rs.getString("MENU_CATE_NO");
				String menuType = rs.getString("MENU_TYPE");
				
				MenuCateVo vo = new MenuCateVo(menuCateNo, menuType);
				

				
				MenucateList.add(vo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
			
		}
		
		return MenucateList;
	
	}

	public String menuNum(Connection conn) {
		String sql = "SELECT COUNT (*) + 1 AS MENUNUM\r\n"
				+ "FROM MENU";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String menuNum = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				menuNum = rs.getString("MENUNUM");
				System.out.println(menuNum);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return menuNum;
		
	}

	public ProductVo changeProdNo(Connection conn, String prodInput) {
		String sql = "SELECT PROD_NO, NAME FROM PRODUCT WHERE NAME LIKE '%?%'";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductVo vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prodInput);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String prodNo = rs.getString("PROD_NO");
				String name = rs.getString("NAME");
				
				vo = new ProductVo();
				vo.setProdNo(prodNo);
				vo.setName(name);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return vo;
	}


}
