package com.green.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardCheckPassFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 암호 입력 폼으로 이동하는 기능
		String url = "board/boardCheckPass.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}