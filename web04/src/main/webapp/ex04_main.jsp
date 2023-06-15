<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<h1>메인 페이지입니다.</h1>
	<a href="./ex04_sub.jsp">서브 페이지로 이동합니다.</a>
	
	<jsp:include page="./ex04_footer.jsp">
		<jsp:param value="10" name="num"/>
	</jsp:include>
</body>
</html>