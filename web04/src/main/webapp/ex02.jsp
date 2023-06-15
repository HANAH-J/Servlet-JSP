<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>스크립트릿을 이용한 자바빈</h2>
	<%
		// 스크립트릿을 이용한 자바빈
		com.green.beans.Member m1 = new com.green.beans.Member();
		m1.setName("방글핑");
		request.setAttribute("m1", m1);
	%>
	이름 : <%=m1.getName() %><br>
<!-- -------------------------------------------------- -->
	<h2>액션태그를 이용한 자바빈(XML)</h2>
	<jsp:useBean id="m2" class="com.green.beans.Member" scope="request">
		<jsp:setProperty name="m2" property="name" value="하츄핑" />
	</jsp:useBean>
	
	이름 : <jsp:getProperty name="m2" property="name" /><br>
</body>
</html>