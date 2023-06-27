package com.green.controller;

import java.io.IOException;

import com.google.gson.Gson;
import com.green.dao.CommentDao;
import com.green.vo.CommentVo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteCommentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글을 DB서버에 저장
		String commentInfo = request.getParameter("commentInfo");
		
		Gson gson = new Gson();
		CommentVo comment = gson.fromJson(commentInfo, CommentVo.class);
		
		CommentDao dao = CommentDao.getInstance();
		dao.insertComment(comment);
	}
}