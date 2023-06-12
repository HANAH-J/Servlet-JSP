package web01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InputData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HTML 폼태그를 통해서 서버로 데이터를 전송 가능
		// 데이터 보내는 방식 = => [name : value]
		
		// 전송해온 데이터 꺼내는 방법 : request.getParameter("name");
		System.out.println("----- GET 방식 -----");
		String name = request.getParameter("username");
		String userId = request.getParameter("userid");
		String userPassword = request.getParameter("userpwd");
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("이름 : " + name);
		System.out.println("아이디 : " + userId);
		System.out.println("암호 : " + userPassword);
		System.out.println("성별 : " + gender);
		
		for(String hobby : hobbys) {
			System.out.println("취미 : " + hobby);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전송해온 데이터 꺼내는 방법 : request.getParameter("name");
		// 한글 깨짐 방지 :
		// request.setCharacterEncoding("UTF-8");
		System.out.println("----- POST 방식 -----");
		String name = request.getParameter("username");
		String userId = request.getParameter("userid");
		String userPassword = request.getParameter("userpwd");
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");

		System.out.println("이름 : " + name);
		System.out.println("아이디 : " + userId);
		System.out.println("암호 : " + userPassword);
		System.out.println("성별 : " + gender);

		for (String hobby : hobbys) {
			System.out.println("취미 : " + hobby);
		}
		
		// System.gc(); //가비지컬렉터 호출
	}
}