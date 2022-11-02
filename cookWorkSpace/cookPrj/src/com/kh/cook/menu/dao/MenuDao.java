package com.kh.cook.menu.dao;

import static com.kh.cook.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.kh.cook.cart.vo.CartVo;
import com.kh.cook.common.JDBCTemplate;
import com.kh.cook.menu.vo.MenuAttachmentVo;
import com.kh.cook.menu.vo.MenuCartVo;
import com.kh.cook.menu.vo.MenuCateVo;
import com.kh.cook.menu.vo.MenuVo;
import com.kh.cook.menu.vo.MenuWriteVo;
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
		String sql = "SELECT DETAIL, CATE_NO, PROD_NO, PRICE, STOCK, WEIGHT, INFO, IMG_PATH4, IMG_PATH3, IMG_PATH, IMG_PATH2, NAME FROM PRODUCT WHERE PROD_NO IN( SELECT MP.PROD_NO FROM MENU M JOIN MENU_PROD MP ON M.NO = MP.NO WHERE MP.NO = ? )";

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

	public int insertRecipe(Connection conn, MenuWriteVo vo) {
		//String sql = "INSERT INTO MENU( NO ,MENU_CATE_NO ,MENU_NAME ,MENU_INFO ,RECIPE ,CAL ,MENU_PROD ,IMG_PATH) VALUES (SEQ_MENU_NO.NEXTVAL, ? , '메뉴이름', '메뉴설명', '레시피' , 330 ,'재료', '한식레시피/kimchi_stew.png' ) ;";
		String sql = "INSERT INTO MENU( NO ,MENU_CATE_NO ,MENU_NAME ,MENU_INFO ,RECIPE ,CAL ,MENU_PROD ) VALUES (SEQ_MENU_NO.NEXTVAL, ?, ?, ?, ? , ? ,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getMenuCateNo());
			pstmt.setString(2, vo.getMenuName());
			pstmt.setString(3, vo.getMenuInfo());
			pstmt.setString(4, vo.getRecipe());
			pstmt.setString(5, vo.getCal());
			pstmt.setString(6, vo.getMenuProd());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, MenuAttachmentVo menuAttachmentVo) {
		String sql = "INSERT INTO MENUATTACHMENT ( NO , MENU_NO ,ORIGIN_NAME ,CHANGE_NAME ,FILE_PATH ) VALUES ( SEQ_MENUATTACHMENT_NO.NEXTVAL, SEQ_MENU_NO.CURRVAL , ? , ? , ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, menuAttachmentVo.getOriginName());
			pstmt.setString(2, menuAttachmentVo.getChangeName());
			pstmt.setString(3, menuAttachmentVo.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	
	}

	public MenuAttachmentVo selectAttachment(Connection conn, String Nno) {
		String sql = "SELECT * FROM MENUATTACHMENT WHERE STATUS = 'O' AND MENU_NO = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuAttachmentVo vo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Nno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String no1 = rs.getString("NO");
				String menuNo = rs.getString("MENU_NO");
				String originName = rs.getString("ORIGIN_NAME");
				String changeName = rs.getString("CHANGE_NAME");
				String filePath = rs.getString("FILE_PATH");
				String enrollDate = rs.getString("ENROLL_DATE");
				String thumbYn = rs.getString("THUMB_YN");
				String status = rs.getString("STATUS");
		
				vo = new MenuAttachmentVo();
				vo.setNo(menuNo);
				vo.setMenuNo(menuNo);
				vo.setOriginName(originName);
				vo.setChangeName(changeName);
				vo.setFilePath(filePath);
				vo.setEnrollDate(enrollDate);
				vo.setThumbYn(thumbYn);
				vo.setStatus(status);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return vo;
	
	}

	public int addCart(Connection conn, MenuCartVo mcv) {
		String sql = "INSERT INTO CART (NO, PROD_NO, CNT) VALUES (?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mcv.getNo());
			pstmt.setString(2, mcv.getProdNo());
			pstmt.setString(3, mcv.getProdCnt());
			
			System.out.println(mcv.getProdNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			
		}
		
		return result;
		
	}

	public List<MenuWriteVo> selectNewInList(Connection conn) {
//		String sql = "SELECT * FROM MENU ORDER BY NO";
		String sql = "SELECT M.NO, M.MENU_NAME, M.MENU_INFO, A.CHANGE_NAME, A.FILE_PATH FROM MENU M JOIN MENUATTACHMENT A ON M.NO = A.MENU_NO ORDER BY NO DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuWriteVo> writeList = new ArrayList<MenuWriteVo>();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		
			while(rs.next()) {

				String no = rs.getString("NO");
//				String menuCateNo = rs.getString("MENU_CATE_NO");
				String menuName = rs.getString("MENU_NAME");
				String menuInfo = rs.getString("MENU_INFO");
//				String recipe = rs.getString("RECIPE");
//				String cal = rs.getString("CAL");
//				String recommend = rs.getString("RECOMMEND");
//				String menuProd = rs.getString("MENU_PROD");
				String filePath = rs.getString("FILE_PATH");
				String chageName = rs.getString("CHANGE_NAME");
				
				MenuWriteVo vo = new MenuWriteVo();
				vo.setNo(no);
//				vo.setMenuCateNo(menuCateNo);
				vo.setMenuName(menuName);
				vo.setMenuInfo(menuInfo);
				vo.setFilePath(filePath);
				vo.setChangeName(chageName);
//				vo.setRecipe(recipe);
//				vo.setCal(cal);
//				vo.setRecommend(recommend);
//				vo.setMenuProd(menuProd);
				
				writeList.add(vo);
				
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		
		return writeList;

	
	}

	//등록레시피 디테일
	public MenuWriteVo selectNewMenuOne(Connection conn, String no) {
		
		String sql = "SELECT * FROM MENU WHERE NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuWriteVo vo = null;
		
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
	
				
				vo = new MenuWriteVo();
				vo.setRecipe(recipe);
				vo.setMenuProd(menuProd);
				vo.setCal(cal);
				vo.setRecommend(recommend);
				vo.setMenuCateNo(menuCate_no);
				vo.setMenuName(menuName);
				vo.setMenuInfo(menuInfo);
			
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return vo;
	}

	// 카트에 담기
	public int addCart(Connection conn, CartVo vo) {
		
		String sql ="INSERT INTO CART (NO, PROD_NO, CNT) VALUES (?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getProdNo());
			pstmt.setString(3, vo.getCnt());
			
			result = pstmt.executeUpdate();
			

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
		
		// 카트 중복 체크
		public int updateCnt(Connection conn,  CartVo vo) {
			
			String sql = "UPDATE CART SET CNT=CNT+? WHERE NO = ? AND PROD_NO = ? AND PAYMENT_YN = 'N' ";
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, vo.getCnt());
				pstmt.setString(2, vo.getNo());
				pstmt.setString(3, vo.getProdNo());
				
				
				result = pstmt.executeUpdate();
				System.out.println(result);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

		public String[] selectProd(Connection conn, String Nno) {
			
			String sql = "SELECT MENU_PROD FROM MENU WHERE NO = ?";
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String menuProd = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, Nno);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					menuProd = rs.getString("MENU_PROD");
					
				}

				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
				JDBCTemplate.close(rs);
			}
			
			String[] cutProd = menuProd.split(",");
			
			return cutProd;
		}

		// 문자열 -> 숫자 후 인서트
		public int prodInsert(Connection conn, String no, String cutProd) {
			
			String sql = "INSERT INTO MENU_PROD(PROD_NO, NO)\r\n"
					+ "VALUES((SELECT PROD_NO\r\n"
					+ "FROM PRODUCT \r\n"
					+ "WHERE NAME = ? \r\n"
					+ "AND ROWNUM <= 1), ?)";
		
			
			PreparedStatement pstmt = null;
			int result = 0;
			String prodNo = cutProd;
			
			
			try {
				
				System.out.println(cutProd);
				System.out.println(no);
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cutProd);
				pstmt.setString(2, no);
				
				
				
				result = pstmt.executeUpdate();
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
		}

//		public List<ProductVo> selectNewProdList(Connection conn, String no) {
//			String sql = "SELECT DETAIL, CATE_NO, PROD_NO, PRICE, STOCK, WEIGHT, INFO, IMG_PATH4, IMG_PATH3, IMG_PATH, IMG_PATH2, NAME FROM PRODUCT WHERE PROD_NO IN( SELECT MP.PROD_NO FROM MENU M JOIN MENU_PROD MP ON M.NO = MP.NO WHERE MP.NO = ?)";
//			
//			
//			
//			
//		}
	
		



}
