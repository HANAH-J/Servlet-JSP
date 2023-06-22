package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.green.dao.ProductDAO;
import com.green.vo.ProductVO;

public class ProductListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터베이스에서 모든 목록을 가져와서 뷰페이지에 보내준다.
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductVO> lists = dao.selectAllProducts();
				
		request.setAttribute("lists", lists);
				
		request.getRequestDispatcher("product/productList.jsp").forward(request, response);
	}
}