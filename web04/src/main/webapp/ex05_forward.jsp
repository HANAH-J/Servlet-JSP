<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="age" class="com.green.beans.Member" scope="request">
		<jsp:setProperty name="m1" property="name" value="최서희"/>
	</jsp:useBean>
	
	<jsp:forward page="./ex05_result.jsp">
		<jsp:param value="최치수" name="name"/>
	</jsp:forward>
</body>
</html>