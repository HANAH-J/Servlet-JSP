package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/boardUpdate.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao dao = BoardDao.getInstance();
		BoardVo board = dao.selectBoardByNum(num);
		
		request.setAttribute("board", board);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}