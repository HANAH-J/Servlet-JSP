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
	<%--
		try{
			out.println("예외 발생 전");
			int num = 1/0;
			out.println("예외 발생 후");
		}catch(Exception e){
			out.println("<br>");
			e.printStackTrace();
			out.println("예외 코드 : " + e.getMessage());
		}
	--%>
	<c:catch var="err">
		예외 발생 전 <br>
		<%=1/0 %> <br>
		예외 발생 후 <br>
	</c:catch>
	
	예외코드 : ${err} <br>
</body>
</html>