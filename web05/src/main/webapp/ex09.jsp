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
<h1>JSTL</h1>
<%-- 데이터 저장과 출력 --%>
<h3>스크립트릿</h3>
<%
	request.setAttribute("greet1", "Hello");
%>
인삿말 : <%=request.getAttribute("greet1".toString()) %><br>

<h3>JSTL 사용</h3>
<c:set var="greet2" value="Hello!" scope="request"/>
<c:out value="${greet2}" escapeXml="true"/><br>
${greet2}<br>

<!-- -------------------------------------------------- -->
<%-- 자바빈을 이용한 데이터 저장 --%>
<c:set var="member" value="<%=new com.green.beans.Member() %>" scope="request"/>
<c:set target="${member}" property="userId" value="king"/>
<c:set target="${member}" property="userName">
	이방원
</c:set>
<br>
저장된 아이디 : <c:out value="${member.userId}" escapeXml="true"/><br>
저장된 이름 : <c:out value="${member.userName}" escapeXml="true"/><br>

<!-- -------------------------------------------------- -->
<%-- 저장된 변수를 삭제 --%>
<%
	request.removeAttribute("greet1");
%>
<c:set var="test" value="테스트"/>
변수 선언 후 테스트 값 : ${test}<br>

<c:remove var="test"/>
변수 삭제 후 테스트 값 : ${text}<br>
<hr>
</body>
</html>