package web03;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doit(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doit(request, response);
	}
	
	private void doit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get으로 오든 post로 오든 한꺼번에 처리
		
		// 리퀘스트 객체 사용하기
		request.setAttribute("name", "홍길동");
		
		String name = (String) request.getAttribute("name");
		
		// 세션 객체를 사용하기
		// 먼저 세션 객체를 가져와야 한다.
		HttpSession session = request.getSession();
		
		session.setAttribute("name", "홍길동");
		
		String name2 = (String) session.getAttribute("name");
	}
}