package web01;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Welcome extends HttpServlet {	// main => 톰캣 서버에서 실행
			// 서블릿 : 톰캣이 호출해서 사용가능한 클래스

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("호출 완료!");
		
		// 응답할 HTML문서를 생성
	}
	
//	public void method() {
//		
//	}
}