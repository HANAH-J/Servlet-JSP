package com.green.controller;

import java.io.IOException;

import com.green.dao.Repository;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DetailBoardServlet extends HttpServlet {
	
	Repository repo = Repository.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
										   // HTML로부터 읽어온 데이터
		
//		repo.count(num); // 조회수 증가
		BoardVo board = repo.selectBoardByNum(num);
		
		request.setAttribute("board", board);
				// HTML에 전달할 데이터
		
		request.getRequestDispatcher("detailBoard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}