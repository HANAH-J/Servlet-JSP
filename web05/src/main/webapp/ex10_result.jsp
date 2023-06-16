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
	<%-- 1. 스크립트릿으로 만드는 법 --%>
	<%
		String color = request.getParameter("color"); // 1, 2, 3
		
		if(color.equals("1")){ // 빨강
	%>
			<span style="color:red">빨강</span>
	<%
		}else if(color.equals("2")){ // 파랑
	%>
			<span style="color:blue">파랑</span>
	<%
		}else if(color.equals("3")){ // 초록
	%>
			<span style="color:green">초록</span>
	<%
		}
	%>
	
	<!-- -------------------------------------------------- -->
	<hr>
	<c:if test="${param.color == 1}">
		<span style="color:red">빨강</span>
	</c:if>
	<c:if test="${param.color == 2}">
		<span style="color:blue">파랑</span>
	</c:if>
	<c:if test="${param.color == 3}">
		<span style="color:green">초록</span>
	</c:if>
	
	<!-- -------------------------------------------------- -->
	<hr>
	<c:choose>
		<c:when test="${param.color == 1}">
			<span style="color:red">빨강</span>
		</c:when>
		<c:when test="${param.color == 2}">
			<span style="color:blue">파랑</span>
		</c:when>
		<c:when test="${param.color == 3}">
			<span style="color:green">초록</span>
		</c:when>
		<c:otherwise>
			<span style="color:yellow">노랑</span>
		</c:otherwise>
	</c:choose>
</body>
</html>