package com.spring.javawspring.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

public class JavawspringProvide {
	public int fileUpload(MultipartFile fName) {
		int res=0;
		try {
			UUID uid = UUID.randomUUID();
			String oFileName = fName.getOriginalFilename();
			String saveFileName = uid + "_" +oFileName;
			
			writeFile(fName,saveFileName,"");
			res=1;
			
		} catch (IOException e) {
			e.getMessage();
		}
		return res;
	}
//서버에 저장하기
	public void writeFile(MultipartFile fName, String saveFileName,String flag) throws IOException {
		byte [] data = fName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath  = request.getSession().getServletContext().getRealPath("resources/"+flag+"/");
		FileOutputStream fos = new FileOutputStream(realPath+saveFileName);
		fos.write(data);
		fos.close();
		
	}
	public void deleteFile(String imgName, String flag) {
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getRealPath("resources/"+flag+"/");
		File imgFile = new File(realPath+imgName);
		if(imgFile.exists()) imgFile.delete();
		
	}
}
