package com.green.upload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class fileUploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 클라이언트에게 전달받은 데이터 : request
		// 파일을 업로드 받을 때는 MultipartRequest가 필요
		
		// MultipartRequest를 만들 때 필요한 정보
				// 1. request 객체
				// 2. 파일 저장 위치 : C:\upload
				// 3. 파일의 최대크기 : 단위는 Byte 10MB => (10*1024*1024)
				// 4. 파일 이름 인코딩 방식 : 한글 UTF-8
				// 5. 파일 정책 : 동일한 파일명의 파일이 존재할 경우 어떻게 할 것인가
				//	  COS가 제공하는 기본 정책을 사용 : DefaultFileRenamePolicy
				//								-> 동일 파일명이 있는 경우 파일명1, 파일명2, ...
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, 
										"C:\\upload", 
										(10*1024*1024), 
										"UTF-8", 
										new DefaultFileRenamePolicy());
			// 객체가 생성됨과 동시에 파일 업로드도 자동으로 동작
			
			String fileName = multi.getFilesystemName("fileUpload");
							  // 업로드 된 파일이름 읽어오기
			// 만약에 파일이름을 읽어올 수 없다면 => 업로드 실패
			
			if(fileName == null) {
				System.out.println("업로드 실패");
			}else {
				out.println("글쓴이 : " + multi.getParameter("writer") + "<br>");
				out.println("글제목 : " + multi.getParameter("title") + "<br>");
				out.println("파일명 : " + multi.getParameter("fileName") + "<br>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		multi.getParameter("");
	}
}