package com.green.controller;

import java.io.IOException;

import com.green.dao.Repository;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteBoardServlet extends HttpServlet {
	
	Repository repo = Repository.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 페이지로 연결
		request.getRequestDispatcher("writeBoardForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVo board = new BoardVo();
		
		board.setBoardWriter(writer);
		board.setBoardContent(content);
		board.setBoardTitle(title);
		
		repo.writeBoard(board);
		
		response.sendRedirect("listBoard"); // 서블릿 호출 -> 페이지
	}
}