<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 각 저장 영역에 데이터 저장
	pageContext.setAttribute("name", "Page Data");
	request.setAttribute("name", "Request Data");
	session.setAttribute("name", "Session Data");
	application.setAttribute("name", "Application Data");
	
	System.out.println("ex04_page01.jsp");
	System.out.println("페이지 속성 : " + pageContext.getAttribute("name"));
	System.out.println("요청 속성 : " + request.getAttribute("name"));
	System.out.println("세션 속성 : " + session.getAttribute("name"));
	System.out.println("어플리케이션 속성 : " + application.getAttribute("name"));
	
	request.getRequestDispatcher("./ex04_page02.jsp").forward(request, response);
	
	// 세션 정보를 강제로 삭제하기
	session.invalidate();
%>
</body>
</html>