<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="m1" class="com.green.beans.Member" scope="request"/>
	
	<h2>포워드로 이동된 페이지</h2>
	이름1 : <%=request.getParameter("name") %><br>
	이름2 : <jsp:getProperty property="name" name="m1"/>
</body>
</html>