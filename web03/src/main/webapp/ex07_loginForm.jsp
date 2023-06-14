<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h1>로그인 폼</h1>
	<form action="./ex07_testLogin.jsp" method="POST">
		<label>아이디 : <input type="text" name="userId"></label><br>
		<label>비밀번호 : <input type="password" name="userPassword"></label><br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>