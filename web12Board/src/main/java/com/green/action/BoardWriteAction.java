package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼으로부터 읽어온 데이터를 실제 게시판에 등록하기 위한 기능
		
		BoardVo board = new BoardVo();
		
		board.setName(request.getParameter("name"));
		board.setPass(request.getParameter("pass"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setEmail(request.getParameter("email"));
		
		BoardDao dao = BoardDao.getInstance();
		dao.insertBoard(board);
		
		response.sendRedirect("bs?command=board_list");
	}

}
