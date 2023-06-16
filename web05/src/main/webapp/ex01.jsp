<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JAVA의 데이터를 HTML에 출력하는 방법 --%>
<%
	String hello = "안녕하세요.";
	pageContext.setAttribute("hello", hello);
%>
<h3> 1. 스크립트릿과 out 객체를 이용한 출력방법</h3>
<% out.println(hello + "<br>"); %>

<h3> 2. 표현식을 이용한 출력방법</h3>
<%=hello %><br>

<h3> 3. EL 표기법을 이용한 출력방법</h3>
${hello}<br>
</body>
</html>