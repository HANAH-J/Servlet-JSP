<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.green.beans.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 1. JSP에서 자바빈 사용하기 (1)
	//	1) 자바빈 생성
	com.green.beans.Member m1 = new com.green.beans.Member();
	
	// 2) 자바빈에 데이터 저장
	m1.setName("스캣");
	m1.setUserId("cat");
%>
이름 : <%=m1.getName() %><br>
아이디 : <%=m1.getUserId() %><br>

<%
	// 1. JSP에서 자바빈 사용하기 (2)
	//	1) 자바빈 생성
	Member m2 = new Member();
	m2.setName("두다");
	
	//	2) 자바빈을 내장 객체에 저장
	session.setAttribute("member1", m2);
	
	//	3) 자바빈을 내장 객체에서 꺼내기
	Member m3 = (Member) session.getAttribute("member1");
	m3.getName();
%>

<%
	// 2. JSP에서 자바빈 사용하기 (액션태그)
	// jsp:useBean 태그는 자바빈을 생성하기 위한 태그
%>
<jsp:useBean id="m4" class="com.green.beans.Member" scope="request"/>
<%
	// 위 태그와 같은 의미
//	com.green.beans.Member m4 = new com.green.beans.Member();
//	request.setAttribute("m4", m4);
%>
</body>
</html>