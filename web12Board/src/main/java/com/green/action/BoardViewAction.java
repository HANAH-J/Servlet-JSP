package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시물 상세보기
		// - 조회수 증가
		// - 게시물 내용 불러오기
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao dao = BoardDao.getInstance();
		
		dao.updateReadCount(num); // 조회수 증가
		BoardVo board = dao.selectBoardByNum(num); // 게시물 내용 불러오기
		
		request.setAttribute("board", board);
		
		String url = "board/boardView.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
