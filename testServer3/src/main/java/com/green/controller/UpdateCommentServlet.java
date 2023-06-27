package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.green.dao.CommentDao;

@WebServlet("/updateComment")
public class UpdateCommentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentCode = Integer.parseInt(request.getParameter("commentCode"));
		String commentComment = request.getParameter("commentComment");
		
		CommentDao dao = CommentDao.getInstance();
		dao.updateComment(commentCode, commentComment);
	}
}