<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>내장 객체에 저장된 데이터를 EL 표기법으로 출력</h3>
<%
	pageContext.setAttribute("name", "페이지");
	request.setAttribute("name", "리퀘스트");
	session.setAttribute("name", "세션");
	application.setAttribute("name", "어플리케이션");
	
	pageContext.removeAttribute("name", 1);
	request.removeAttribute("name");
	session.removeAttribute("name");
	application.removeAttribute("name");
%>

page 속성 : ${pageScope.name}<br>
request 속성 : ${requestScope.name}<br>
session 속성 : ${sessionScope.name}<br>
application속성 : ${applicationScope.name}<br>
<hr>
name의 값 : ${name}<br>
</body>
</html>