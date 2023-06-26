package com.green.controller;

import java.io.IOException;
import java.util.List;

import com.green.dao.Repository;
import com.green.vo.BoardVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListBoardServlet extends HttpServlet {
	Repository repo = Repository.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<BoardVo> lists = repo.selectAllBoards();
		
		request.setAttribute("lists", lists);
		
		request.getRequestDispatcher("listBoard.jsp").forward(request, response);
		// response.sendRedirect("listBoard.jsp"); -> 새로운 요청
		// 안 되는 이유
		// 1. request 내장 객체에 담아둔 데이터 활용 불가
		// 2. 모델2
		//	  모든 요청은 서블릿 클래스가 전담
		//	  모든 응답은 JSP가 전담 -> 포워드 요청 'JSP'로 가도록
		//	  -> response.sendRedirect("listBoard");
	}
}