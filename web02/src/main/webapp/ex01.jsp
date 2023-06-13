<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int num = 10; // 클래스 멤버 변수
	public void m1(){
		System.out.println("메서드 m1 호출");
	}
	
	List<String> names = new ArrayList<>();
	// 임포트가 필요한 클래스
%>

<%
	// 1. 스크립트릿	: <% 자바코드를 작성하는 기본적인 부분
	//		-> _JspService 메서드 내부에 작성 : 변수, 출력문
	// 2. 표현식(출력)	: <%=
	// 3. 선언문		: <%!
	//		-> _JspService 메서드 외부에 작성 : 변수, 메서드
	// 4. 주석		: <%--
	// 5. 지시자		: <%@
	//		-> 페이지에 대한 추가 정보
	
	// java 코드의 영역! => 메서드 내부에 선언된 로컬(지역) 변수
	int num1 = 10;
	int num2 = 20;
	int result = num1 + num2;
	
//	PrintWriter out = response.getWriter();
//	-> JSP에는 내장 객체 out 有
	out.print("<p>" + num1 + " + " + num2 + " = " + result + "</p>");

/*	public void m2(){ // 메서드 내부에는 또다른 메서드를 만들 수 없다.
		System.out.println("메서드 m2 호출");
	} */
%>
<hr>
<% out.println(num1); %>
<%=num1 %>
<br>
<%=num1 %>+<%=num2 %>=<%=result %>

<!--  HTML 주석 : 서블릿이 반영하지 않아서 HTML코드에 섞여서 출력 -->
<%--  JSP  주석 : 서블릿이 주석처리하기 때문에 HTML코드에 노출이 안 된다. --%>
</body>
</html>