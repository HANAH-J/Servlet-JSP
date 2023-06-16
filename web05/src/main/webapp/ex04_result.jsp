<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>표현식에서의 연산</h3>
<%
	String str1 = request.getParameter("num1");
	int num1 = Integer.parseInt(str1);
	int num2 = Integer.parseInt(request.getParameter("num2"));
%>
<%=num1 %> + <%=num2 %> = <%=(num1 + num2) %><br>
<hr>
<h3>EL 표기법에서의 연산</h3>
${param.num1 } + ${param.num2 } = ${param.num1 + param.num2 }<br>
</body>
</html>