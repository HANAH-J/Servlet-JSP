<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>page02</h3>
	페이지 속성 : <%=pageContext.getAttribute("name") %><br>
	요청 속성 : <%=request.getAttribute("name") %><br>
	세션 속성 : <%=session.getAttribute("name") %><br>
	어플리케이션 속성 : <%=application.getAttribute("name") %><br>
	<hr>
	<a href="./ex04_page03.jsp">또 다른 페이지로 이동</a> <!-- 새로운 요청 -->
</body>
</html>