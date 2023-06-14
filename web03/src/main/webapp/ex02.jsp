<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>네이버로 이동합니다.</h3>
	<%
		response.sendRedirect("https://www.naver.com");
	
	// 서버 프로그램(JSP)에서 페이지를 이동시키는 방법 2가지
	// 1) 리다이렉트 방식
//		  클라이언트에게 이동하라는 방식
//		  => 브라우저 주소에 직접 작성시켜서 이동
	// 2) 포워드 방식
//		  서버 내부에서 움직이는 방식 -> 클라이언트는 이동 여부를 모른다.
	%>
</body>
</html>