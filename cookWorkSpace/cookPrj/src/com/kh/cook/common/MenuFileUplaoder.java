package com.kh.cook.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.Part;

import com.kh.cook.menu.vo.MenuVo;

public class MenuFileUplaoder {
	public static MenuVo uploadFile(Part f, String rootPath) throws IOException {


		//0. 준비
		//확장자 명 확인
		String originName = f.getSubmittedFileName();
		// 뒷쪽부터 해서 점의 인덱스 가져올 수 있음
		String ext = originName.substring(originName.lastIndexOf("."),originName.length());
		//체인지 네임에는 중복되지 않을 랜덤값을 넣어줌! || UUID.randomUUID() ||
		//String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 +1) + ext;
		
				
		// 1. 파일 객체 준비 ( 경로 + 파일명)
		String filePath = "upload/img";
		// "최상단경로/upload/img/temp01.png"
		String path = rootPath + filePath + "/";// rootPath = 최상단 경로
		// new File( path + 파일명);
		File target = new File( path );
		
		// 2. 데이터 넣기 (클라파일 -> 자바 -> 타겟파일로 넘기기 )
		
//			//읽어들이고
//			InputStream fis =  f.getInputStream();
//			//내보내고
//			FileOutputStream fos =  new FileOutputStream(target);
		
		
		BufferedInputStream bis = new BufferedInputStream(f.getInputStream());
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
		
		byte[] buf = new byte[1024];
		
		//리턴타입은 읽어들인 사이즈(== 몇 글자가 읽혔는지)가 나옴
		int size = 0;
		
		//사이즈가 -1일 때 while문 통과해야 함.
		//
		while((size = bis.read(buf)) != -1) {
			//size (==읽어들인 만큼) 만큼만 내보내야 하므로
			bos.write(buf, 0, size);
		}

		bos.flush();
		bis.close();
		bos.close();
		
		
		MenuVo vo = new MenuVo();
		vo.setImgPath(originName);
		vo.setFilePath(filePath);
		
		
		return vo;
}
}
