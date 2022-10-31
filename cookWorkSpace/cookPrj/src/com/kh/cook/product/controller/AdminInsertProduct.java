package com.kh.cook.product.controller;

import java.io.IOException;
import java.util.List;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.cook.bobstory.controller.FileUploader;
import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.member.vo.MemberVo;
import com.kh.cook.product.service.ProductService;
import com.kh.cook.product.vo.ProductVo;
import com.kh.cook.product.vo.ReviewVo;

@WebServlet(urlPatterns = "/product/main/admin_insertProduct")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, //한번에 핸들링 할 수 있는 최대 사이즈
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 50 * 5
		)
public class AdminInsertProduct extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/product/main/admin_insertProduct.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션 꺼내기
		HttpSession s = req.getSession();
		
		//로그인 멤버 꺼내기
		MemberVo loginMember = (MemberVo)s.getAttribute("loginMember");
		
		//인코딩
		req.setCharacterEncoding("UTF-8");

		//데이터 꺼내기
		String no = req.getParameter("no");
		
		String cateNo = req.getParameter("cateNo");
		String name = req.getParameter("name");
		String info = req.getParameter("info");
		String detail = req.getParameter("detail");
		String price = req.getParameter("price");
		String weight = req.getParameter("weight");
		String stock = req.getParameter("stock");
		Part file = req.getPart("file");
		
		String content = req.getParameter("content");
		
		AttachmentVo avo = null;
		//----------------파일 업로드 start ----------------------
		
		String rootPath = req.getServletContext().getRealPath("/");
		//파일 정보 디비에 저장(파일 있을때)
		if(file.getSubmittedFileName().length() > 0) {
			avo = FileUploader.uploadFile(file, rootPath);
		}
		//----------------파일 업로드 end ------------------------
		
		//데이터 뭉치기
		ProductVo vo = new ProductVo();
		vo.setCateNo(cateNo);
		vo.setName(name);
		vo.setInfo(info);
		vo.setDetail(detail);
		vo.setPrice(price);
		vo.setWeight(weight);
		vo.setStock(stock);
		vo.setImgPath(avo.getChangeName());
		
		int prodNo = new ProductService().findProdNo(vo);
		
//		
//		ReviewVo rvo = new ReviewVo();
//		rvo.setProdNo(Integer.toString(prodNo));
//		rvo.setNo(loginMember.getNo());
//		rvo.setContent(content);
		
		//디비 다녀오기
		int result = new ProductService().insertProduct(vo,avo);
		//int result2 = new ProductService().insertReview(rvo,prodNo);
		
		List<ReviewVo> rvoList = new ProductService().selectReview(no);
		
		//vo.setProdNo(Integer.toString(prodNo));
		
		//화면 선택
		if(result == 1) {
			//작성 성공 => 알람 메세지, 리스트 화면으로 리다이렉트
			s.setAttribute("alertMsg", "상품 등록 완료 !");
			req.setAttribute("vo", vo);
			req.setAttribute("rvoList", rvoList);
			req.setAttribute("prodNo", prodNo);
			
			req.getRequestDispatcher("/views/product/detail/productDetail.jsp").forward(req, resp);
			//resp.sendRedirect("/cookTeacher/product/detail/productDetail?no="+ prodNo);
		}else {
			//게시글 작성 실패
			if(avo != null) {
				String savePath = rootPath + avo.getFilePath() + "/" + avo.getChangeName();
				new File(savePath).delete();
			}
		
			//작성 실패 => 메세지, 에러 페이지 포워딩
			req.setAttribute("msg", "상품 등록 실패 ...");
			req.getRequestDispatcher("/cookTeacher/product/main/productList").forward(req, resp);
		}
		
		
	}
}
