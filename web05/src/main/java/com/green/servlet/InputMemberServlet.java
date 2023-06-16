package com.green.servlet;

import java.io.IOException;

import com.green.beans.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InputMemberServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자바빈을 생성
		Member member = new Member();
		
		// 자바빈에 프로퍼티 값 저장
		member.setUserId("hong");
		member.setUserName("홍길동");
		
		// 자바빈 객체를 내장 객체에 저장
		request.setAttribute("member", member);
		
		// ex08.jsp로 이동
		request.getRequestDispatcher("ex08.jsp").forward(request, response);
	}
}