package com.green.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.green.beans.MemberInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxTest02 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자바빈을 만들어서 JSON 포장 후 전송
		MemberInfo member = new MemberInfo();
		
		member.setUserid("hwnag");
		member.setUserpwd("2468");
		member.setUsername("황길동");
		
		Gson gson = new Gson();
		String mJson = gson.toJson(member);
		
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(mJson);
	}
}