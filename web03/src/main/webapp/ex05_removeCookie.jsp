<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>저장된 쿠키 삭제하기</h1>
<%
	// 쿠키 삭제하는 법 => X
	
	// 쿠키 삭제하는 편법 => 같은 이름의 쿠키로 덮어쓰기
	Cookie c1 = new Cookie("userAge", "18374");
	
	c1.setMaxAge(0); // 쿠키의 유효시간 => 초단위
	// 쿠키의 유효시간을 0초로 만들고 덮어쓰기를 함으로써 쿠키 삭제
	
	response.addCookie(c1);
%>
	<a href="./ex05_getCookie.jsp">쿠키 보기</a>
</body>
</html>