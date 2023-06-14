<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 읽어오기</h1>
	
<%
	// 1. 클라이언트에 저장된 쿠키 가져오기
	Cookie[] cookies = request.getCookies();

	// 2. 반복 형태로 데이터 조회
	for(Cookie c : cookies){
		out.println(c.getName() + " : " + c.getValue() + "<br>");
	}
%>
</body>
</html>