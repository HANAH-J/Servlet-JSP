<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// 저장된 데이터
	String id = "pink";
	String password = "pong";
	String name = "아기상어";
%>

<%
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	
	if(userId.equals(id) && userPassword.equals(password)){
		// 로그인 성공 => 로그인 정보를 세션에 저장
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		
		response.sendRedirect("./ex07_Main.jsp");
	}else{
		// 로그인 실패
		response.sendRedirect("./ex07_loginForm.jsp");
	}
%>