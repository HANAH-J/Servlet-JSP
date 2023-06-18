package com.green.controller;

import java.io.IOException;

import com.green.dao.MemberDAO;
import com.green.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 홈페이지로 연결해주는 기능 담당
		
		String url = "member/login.jsp";
		
		// 현재 세션에 로그인 한 사용자가 있다면 main.jsp로 이동
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			url = "main.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실질적으로 로그인 처리를 해주는 기능 담당
		String url = "member/login.jsp"; // 로그인 실패 시 돌아갈 페이지
		
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		// 로그인 인증 처리
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.userCheck(userid, userpwd);
		// 1: 로그인 성공, 0: 비밀번호 불일치, -1: 아이디 부존재
		
		if(result == 1) {
			// 로그인 성공 시 해당 회원정보를 세션에 저장
			MemberVO member = dao.getMember(userid);
			
			// 서블릿은 session 객체가 내장객체가 아니다.
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", member);
			
			url = "main.jsp";
		}else if(result == 0) {
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}else if(result == -1) {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}