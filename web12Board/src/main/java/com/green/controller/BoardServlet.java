package com.green.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.green.action.Action;

public class BoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	
	private void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 처리를 전담할 서블릿 메서드
		
		// 페이지 요청 : localhost:8085/web12Board/bs?command='xxxxxxx';
		String command = request.getParameter("command");
		
		// command는 어떤 기능을 요청할 것인지 알려주는 명령어
		
		// ActionFactory는 command의 값을 가지고 해당 기능을 가진 클래스를 찾아주는 역할
		ActionFactory af = ActionFactory.getInstance();
		
	//	타입 action = af.getAction(command);
	//	타입 변수 = 인스턴스():
	//	타입??
	//	-> 인스턴스와 같은 이름을 가진 클래스	--> X
	//	-> 인스턴스를 상속하는 부모 클래스
	//	-> 인스턴스를 구현하는 인터페이스		--> 기능수행()을 알고 있는 인터페이스
		
	//	인터페이스 타입 action = af.getAction(command);
		
		// 1. 전제조건 : '참조타입'은 기능 수행 메서드를 알고 있어야 한다.
		Action action = af.getAction(command);
		
		// action.기능수행();
		if(action != null) {
			action.execute(request, response);
		}
	}
}