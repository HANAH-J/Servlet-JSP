package web01;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LifeCycleServlet extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 처음 실행됨 : 인스턴스 생성");
	}
	
	public void destroy() {
		System.out.println("서블릿이 삭제됨 : 인스턴스 소멸");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 Get 요청이 있을 때");
	}
}