package web01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/greeting")	// 서블릿버전 3.0 이후부터 어노테이션으로 매핑 가능
public class Hello extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기까지 오셨군요!");
//		request.getMethod(); 어떤 방식으로 요청
//		request.getServletContext(); 컨텍스트 패스는 무엇인가
//		request.getLocalPort();
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>");
		out.print("안녕");
		out.print("</title></head>");
		out.print("<body>");
		out.print("<p>응답 출력 완료</p>");
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}