package com.kh.cook.menu.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.Part;

import com.kh.cook.bobstory.vo.AttachmentVo;
import com.kh.cook.menu.vo.MenuAttachmentVo;

public class MenuFileUploader {
	
	public static MenuAttachmentVo uploadFile(Part f, String rootPath) throws IOException {
		
		//0. 준비
		String originName = f.getSubmittedFileName();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 +1) + ext;
		
		//1.파일 객체 준비 ( 경로 + 파일명 )
		String filePath = "upload/img";
		String path = rootPath + filePath + "/";
		File target = new File(path + changeName);
		
		BufferedInputStream bis = new BufferedInputStream(f.getInputStream());
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
		
		byte[] buf = new byte[1024];
		
		int size = 0;
		while((size = bis.read(buf)) != -1) {
			bos.write(buf, 0, size);
		}
		
		//자원반납
		bos.flush();
		bis.close();
		bos.close();
		
		MenuAttachmentVo vo = new MenuAttachmentVo();
		vo.setOriginName(originName);
		vo.setChangeName(changeName);
		vo.setFilePath(filePath);
		
		return vo;
		
	}

}
