<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>표현식에서의 합계</h3>
<%=request.getAttribute("num1") %>
+
<%=request.getAttribute("num2") %>
=
<%=(Integer) request.getAttribute("num1") + (Integer) request.getAttribute("num2") %><br>
<hr>
<h3>EL 표기법에서의 합계</h3>
${requestScope.num1 } + ${requestScope.num2 } = ${requestScope.num1 + requestScope.num2 }<br>
</body>
</html>