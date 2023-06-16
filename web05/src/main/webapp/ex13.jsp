<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url var="puppy" value="img/puppy-g504eb3347_1920.jpg" scope="request"/>
<div>${puppy}</div>
<hr>
<img alt="멍멍이" src="${puppy}">
</body>
</html>