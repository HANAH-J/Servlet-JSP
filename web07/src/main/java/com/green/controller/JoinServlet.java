package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.green.dao.MemberDAO;
import com.green.vo.MemberVO;

public class JoinServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼페이지로 연결
		String url = "member/join.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력한 데이터를 저장
		
		// 폼으로부터 읽어온 데이터를 데이터베이스에 저장
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		MemberVO member = new MemberVO();
		member.setName(name);
		member.setUserid(userid);
		member.setUserpwd(userpwd);
		member.setEmail(email);
		member.setPhone(phone);
		member.setAdmin(admin);
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.insertMember(member);
		
		request.setAttribute("userid", userid);
		
		request.getRequestDispatcher("member/login.jsp").forward(request, response);
	}
}