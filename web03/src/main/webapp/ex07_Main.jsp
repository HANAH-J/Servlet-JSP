<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그인이 되지 않은 상태라면?
	if(session.getAttribute("name") == null){
		response.sendRedirect("./ex07_loginForm.jsp");
	}else{
%>
	<h1>메인 페이지</h1>
	<%=((String) session.getAttribute("name")).toString() %>
	(<%=((String) session.getAttribute("id")).toString()%>)님 환영합니다.<br>
	<!-- 아기상어(pink)님 환영합니다. -->
	
	<p>오늘도 저희 홈페이지를 방문해주셔서 감사합니다.<br>
	좋은 하루 되세요.</p>
	
	<!-- 1. 로그아웃폼 : 데이터 전송 -->
	<form action="./ex07_logout.jsp" method="GET">
		<input type="hidden" name="data" value="보내고 싶은 데이터">
		<input type="hidden" name="name" value="<%=((String) session.getAttribute("name")).toString() %>">
		<button type="submit">로그아웃</button>
	</form>
	
	<!-- 2. 자바스크립트 -->
	<button type="button" onclick="logout()">로그아웃</button>
	
	<script type="text/javascript">
		function logout() {
			location.href="./ex07_logout.jsp?data=보내고싶은데이터";
		}
	</script>
<%
	}
%>
	
</body>
</html>