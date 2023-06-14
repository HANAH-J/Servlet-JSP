<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션에 저장된 값 읽기</h1>
	<%
	String id = (String) session.getAttribute("id");
	//						반환 타입 : Object
	
	// pageContext, request, session, application 등에 저장하는 데이터는 꼭 문자열이 아니어도 상관없다.
	// 저장할 때는 아무 객체나 저장하고 꺼낼 때 형변환 필요
	
	String pwd = (String) session.getAttribute("pwd");
	String name = (String) session.getAttribute("name");
	%>
	아이디 : <%=id %><br>
	비밀번호 : <%=pwd %><br>
	이름 : <%=name %><br>
	
	<a href="./ex06_invalidate.jsp">세션 데이터 삭제</a>
</body>
</html>