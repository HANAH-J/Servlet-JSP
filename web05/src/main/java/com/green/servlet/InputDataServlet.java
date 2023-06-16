package com.green.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InputDataServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = 10;
		int num2 = 20;
		
		// 데이터를 JSP에게 넘겨주려면 내장 객체에 저장
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		
		// 데이터를 JSP에게 넘겨주려면 포워드로 JSP로 이동
		request.getRequestDispatcher("ex06.jsp").forward(request, response);
	}

}
