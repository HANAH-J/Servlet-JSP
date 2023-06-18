<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 페이지</title>
</head>
<body>
	<c:if test="${empty loginUser}">
		<c:redirect url="login"/>
	</c:if>
	
	<p>안녕하세요. ${loginUser.name}님 환영합니다.</p>
	
	<form action="logout">
		<button type="submit">로그아웃</button>
		<button type="button" onclick="location.href='memberUpdate'">회원 정보 수정</button>
	</form>
</body>
</html>