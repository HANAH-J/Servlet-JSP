package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 수정 기능
		
		BoardVo board = new BoardVo();
		
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setName(request.getParameter("name"));
		board.setPass(request.getParameter("pass"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setEmail(request.getParameter("email"));
		
		BoardDao dao = BoardDao.getInstance();
		dao.updateBoard(board);
		
		response.sendRedirect("bs?command=board_list");
	}
}