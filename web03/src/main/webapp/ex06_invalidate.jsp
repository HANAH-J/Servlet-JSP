<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션에 저장된 값 삭제</h1>
	<%
		// 세션에 저장된 값 전체 삭제하기
		session.invalidate();
	%>
	<a href="./ex06_getSession.jsp">세션 값 보기</a>
</body>
</html>