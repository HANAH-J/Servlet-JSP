package com.green.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.green.beans.MemberInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxTest01 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		
		System.out.println("보내온 아이디 : " + userid);
		System.out.println("보내온 비밀번호 : " + userpwd);
		
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("너님 가입 안 됨!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. JSON 객체 -> 자바 객체(자바빈)로 전달 받는다.
		// 2. JSON 객체를 포장하거나 꺼내는 도구 => GSON.jar
		
		String userInfo = request.getParameter("userInfo");
		System.out.println("얻어온 값 : " + userInfo);
		
		Gson gson = new Gson();
		MemberInfo member = gson.fromJson(userInfo, MemberInfo.class);
		
		System.out.println("넘어온 아이디 : " + member.getUserid());
		System.out.println("넘어온 비밀번호 : " + member.getUserpwd());
		System.out.println("넘어온 이름 : " + member.getUsername());
	}
}