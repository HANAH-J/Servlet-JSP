package com.green.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.green.dao.Repository;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateBoardServlet extends HttpServlet {
	
	Repository repo = Repository.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기존의 데이터를 가지고 폼 페이지로 이동
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardVo board = repo.selectBoardByNum(num);
		
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("updateBoardForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정된 데이터를 가지고 Repository에 반영
		int num = Integer.parseInt(request.getParameter("num"));
		int count = Integer.parseInt(request.getParameter("count"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy-MM-DD");
		Date regDate = null;
		try {
			regDate = fomatter.parse(request.getParameter("regDate"));
		}catch(ParseException e) {
			e.printStackTrace();
		}
		
		BoardVo board = new BoardVo();
		
		board.setBoardContent(content);
		board.setBoardCount(count);
		board.setBoardTitle(title);
		board.setBoardWriter(writer);
		board.setBoardNum(num);
		
		repo.updateBoard(board);
		
		response.sendRedirect("listBoard"); // 목록으로 돌아가기
	}
}