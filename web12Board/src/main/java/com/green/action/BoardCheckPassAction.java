package com.green.action;

import java.io.IOException;

import com.green.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 암호 확인 폼으로부터 받아온 암호를 체크하는 기능
		
		String url = null;
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		
		BoardDao dao = BoardDao.getInstance();
		
		if(dao.checkPass(num, pass)) {
			// 암호 확인 성공
			url = "board/checkSuccess.jsp";
		}else {
			// 암호 확인 실패
			url = "board/boardCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}