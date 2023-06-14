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
	// 내장 객체
	// 1) HttpServletRequest request	(매개변수)
	//	  요청 정보
	// 2) HttpServletResponse response	(매개변수)
	//	  응답 정보
	// 3) JspWriter out
	//	  문서 출력
%>
<h3>내장 객체 : request</h3>
<!-- http://localhost:8085/web03/ex01.jsp?name=홍길동 -->
컨텍스트 패스 : <%=request.getContextPath() %><br>
요청 방식 : <%=request.getMethod() %><br>
서버이름 : <%=request.getServerName() %><br>
요청한 URI : <%=request.getRequestURI() %><br>
요청한 URL : <%=request.getRequestURL() %><br>
프로토콜 : <%=request.getProtocol() %><br>
포트번호 : <%=request.getServerPort() %><br>

전달받은 이름 : <%=request.getParameter("name") %><br>

<hr>
<h3>내장 객체 : response</h3>
<%
	response.getWriter(); // 문서 출력을 위한 객체
	out.println("<p>out 내장 객체를 통한 출력문</p>");
	
	response.setContentType("text/html");
	
//	response.sendRedirect("경로");
%>
</body>
</html>