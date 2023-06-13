<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String storedId = "green";
	String storedPwd = "1234";
	String storedName = "홍길동";
%>

<%
	// _jspService 메서드에 request와 response 인자(파라미터, 매개값)을 전달받는다.
	// 아이디와 암호를 입력받아서 로그인 성공 시 "green님 환영합니다."
	// 로그인 실패 시 "아이디 또는 비밀번호가 틀렸습니다."
	
	// 저장된 아이디와 비빌번호 green / 1234;
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	if(storedId.equals(userid) && storedPwd.equals(userpwd)){
%>
		<h1><%=storedName%>님 환영합니다.</h1>
<%
	}else{
%>
		<h1>아이디 또는 비밀번호가 틀렸습니다.</h1>
<%
	}
%>
</body>
</html>