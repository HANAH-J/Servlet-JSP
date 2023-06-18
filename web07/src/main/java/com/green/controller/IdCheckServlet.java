package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.green.dao.MemberDAO;

public class IdCheckServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 아이디가 DB에 존재하는지 체크
		// 존재한다면 가입불가
		// 존재하지 않는다면 가입가능
		
		String userid = request.getParameter("userid"); // 쿼리 스트링
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.confirmID(userid);
		
		request.setAttribute("userid", userid);
		request.setAttribute("result", result);
		// 1 : 가입불가, -1 : 가입가능
		
		request.getRequestDispatcher("member/idCheck.jsp").forward(request, response);
	}
}