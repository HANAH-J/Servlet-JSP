package com.green.controller;

import java.io.IOException;
import java.util.List;

import com.green.dao.CommentDao;
import com.green.vo.CommentVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DetailBoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시물 상세보기 서블릿
		// 글 번호로 게시물 조회해서 뷰 페이지에 넘겨주는 역활
		
		// 댓글도 가져와서 뷰 페이지에 전달
		CommentDao dao = CommentDao.getInstance();
		List<CommentVo> lists = dao.selectAllComments();
		
		request.setAttribute("lists", lists);
		
		request.getRequestDispatcher("detailBoard.jsp").forward(request, response);
	}
}