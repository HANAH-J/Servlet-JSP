<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자바빈에 저장된 프로퍼티 출력</h3>
<h4>표현식으로 출력하기</h4>
<%
	com.green.beans.Member m1 = (com.green.beans.Member) request.getAttribute("member");
%>
아이디 : <%=m1.getUserId() %><br>
이름 : <%=m1.getUserName() %><br>
<hr>
<h4>EL 표기법으로 출력하기</h4>
아이디 : ${requestScope.member.userId }<br>
이름 : ${member["userName"] }<br>
</body>
</html>