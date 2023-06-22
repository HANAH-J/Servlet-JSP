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

public class ProductWriteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 입력 페이지로 연결
		request.getRequestDispatcher("product/productWrite.jsp").forward(request, response);
	}

	private static final String dir = "C:\\Repository";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼에서 입력된 데이터를 데이터베이스에 저장
		// (+ 이미지도 저장)
		ProductVO product = new ProductVO();
		
		Part part = request.getPart("pictureurl");
		product.setPictureurl(part.getSubmittedFileName());
		
		part.write(dir + File.separator + part.getSubmittedFileName());
		part.delete();
		
		product.setName(request.getParameter("name"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.insertProduct(product);
		
		response.sendRedirect("productList");
	}
}