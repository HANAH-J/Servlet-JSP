package com.green.controller;

import java.io.IOException;

import com.green.dao.MemberDAO;
import com.green.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberUpdate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정 폼페이지로 연결
		String url = "member/memberUpdate.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		if(userpwd == null || userpwd.equals("")) { // 비밀번호를 입력하지 않았다면
			userpwd = ((MemberVO) session.getAttribute("loginUser")).getUserpwd();
													// 기존 비밀번호 재사용
		}
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = Integer.parseInt(request.getParameter("admin"));
		
		MemberVO mvo = new MemberVO();
		mvo.setName(name);
		mvo.setUserid(userid);
		mvo.setUserpwd(userpwd);
		mvo.setEmail(email);
		mvo.setPhone(phone);
		mvo.setPhone(phone);
		mvo.setAdmin(admin);
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(mvo);
		
		session.setAttribute("loginUser", mvo); // 세션의 정보도 교체
		
		response.sendRedirect("login"); // 로그인 서블릿을 통해서 메인 페이지로
	}
}