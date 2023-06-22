package com.green.controller;

import java.io.File;
import java.io.IOException;

import com.green.dao.ProductDAO;
import com.green.vo.ProductVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class ProductUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// code를 통해 읽어온 데이터를 폼 페이지에 보여주기
		int code = Integer.parseInt(request.getParameter("code"));
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = dao.selectProductByCode(code);
		
		request.setAttribute("product", product);
		request.getRequestDispatcher("product/productUpdate.jsp").forward(request, response);
	}

	private static final String dir = "C:\\Repository";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정된 데이터를 데이터베이스에 추가하기
		// + 새로운 이미지는 저장소에 저장하기
		
		ProductVO product = new ProductVO();
		product.setCode(Integer.parseInt(request.getParameter("code")));
		product.setName(request.getParameter("name"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		
		// 사진 등록했는지 판단해서 처리
		Part part = request.getPart("pictureurl");
		String fileName = part.getSubmittedFileName();
		
		if(fileName.isEmpty()) { // 사진 수정하지 않음
			product.setPictureurl(request.getParameter("originPic"));
		}else { // 사진 수정
			product.setPictureurl(fileName);
			
			// 사진 저장
			part.write(dir + File.separator + fileName);
			part.delete();
		}
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.updateProduct(product);
		
		response.sendRedirect("productList");
	}
}