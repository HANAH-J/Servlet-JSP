package com.green.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUploadServlet extends HttpServlet {
	
	private static final String repo = "C:\\Repository";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Collection<Part> parts = request.getParts();
		
		for(Part part : parts) {
			System.out.println("Name : " + part.getName());
			System.out.println("ContentType : " + part.getContentType());
			System.out.println("Size : " + part.getSize());
			System.out.println("FileName : " + part.getSubmittedFileName());
			System.out.println("Header : " + part.getHeader("Content-Disposition"));
			System.out.println("--------------------------------------------------");
			
			if(part.getHeader("Content-Disposition").contains("filename")) { // 업로드된 것이 파일인가?
				
				part.write(repo + File.separator + part.getSubmittedFileName());	// 지정된 경로에 파일을 저장하세요.
				part.delete();		// 임시 저장소의 정보를 삭제
			}else { // 파일이 아닌 것
				String data = request.getParameter(part.getName());
				System.out.println("텍스트 데이터 : " + data);
			}
		}
	}
}