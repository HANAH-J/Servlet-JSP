package web02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CalcServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int result = num1 + num2;
		
		System.out.println("첫 번째 숫자 : " + num1);	// 콘솔 출력 -> 서버 출력
		System.out.println("두 번째 숫자 : " + num2);	//		  -> 클라이언트는 X
		System.out.println("합      계 : " + result);
		
		response.setContentType("text.html; charset=UTF-8");
		
		// JAVA 코드 내부에 HTML을 작성하는 방식
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>계산 결과</title></head>");
		out.print("<body>");
		out.print("<h2>계산 결과</h2>");
		out.print("<p>" + num1 + " + " + num2 + " = " + result + "</p>");
		out.print("</body></html>");
		
		// HTML 코드에 데이터를 끼워넣는 방식 => 템플릿 엔진 : 'JSP', thymeleaf 등등
	}
}