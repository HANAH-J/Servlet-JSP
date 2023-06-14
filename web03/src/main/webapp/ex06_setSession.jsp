<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션 저장</h1>
	<%
	// 세션 객체 : 내장 객체
	session.setAttribute("id", "hong");
	session.setAttribute("pwd", "1234");
	session.setAttribute("name", "홍길동");
	%>
	<a href="./ex06_getSession.jsp">세션 값 보기</a>
</body>
</html>