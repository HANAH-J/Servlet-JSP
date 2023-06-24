package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시물 삭제 기능
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao dao = BoardDao.getInstance();
		dao.deleteBoard(num);
		
		response.sendRedirect("bs?command=board_list");
	}
}