<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 생성</h1>
<%
	// 1. 쿠키 객체 생성
	Cookie c1 = new Cookie("userId", "hong");
	
	// 2. 쿠키를 클라이언트에게 전송(응답)
	response.addCookie(c1);
	
	response.addCookie(new Cookie("userPwd", "1234"));
	response.addCookie(new Cookie("userName", "홍길동"));
	response.addCookie(new Cookie("userAge", "27"));
%>
	<a href="./ex05_getCookie.jsp">쿠키 보기</a>
</body>
</html>