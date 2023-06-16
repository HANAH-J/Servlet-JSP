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
<%
	String[] movieList = {"맨온렛지",
			"슬램덩크", "이탈리안잡",
			"던전앤드래곤", "맨인블랙",
			"범죄도시", "미비포유"};
	request.setAttribute("movieList", movieList);
%>
<%-- 반복문 --%>
<%
	for(String movie : movieList){
		
	}
%>
<c:forEach items="${movieList}" var="movieTitle">
	${movieTitle}<br>
</c:forEach>
<hr>
<table border="1">
	<tr>
		<th>인덱스</th>
		<th>카운트</th>
		<th>영화제목</th>
	</tr>
	<c:forEach items="${movieList}" var="movieTitle" varStatus="status">
		<tr>
			<td>${status.index}</td>
			<td>${status.count}</td>
			<td>${movieTitle}</td>
		</tr>
	</c:forEach>
</table>

<hr>
<ul>
	<c:forEach items="${movieList}" var="movieTitle" varStatus="status">
		<c:choose>
			<c:when test="${status.first }">
				<li style="font-weight:bold; color=red;">${movieTitle}</li>
			</c:when>
			<c:when test="${status.last }">
				<li style="background-color=blue; color=white;">${movieTitle}</li>
			</c:when>
			<c:otherwise>
				<li>${movieTitle}</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>

<hr>

<table border="1">
	<tr>
		<th>인덱스</th>
		<th>카운트</th>
		<th>숫자</th>
	</tr>
	<c:forEach begin="4" end="10" step="2" var="num" varStatus="status">
		<tr>
			<td>${status.index}</td>
			<td>${status.count}</td>
			<td>${num}</td>
		</tr>
	</c:forEach>
</table>

<hr>
<%
	// 자바스크립트 split(",");
	// StringTokenizer("문자열");
	String names = "김길동; 이길동, 박길동; 신길동, 양길동; 정길동, 조길동; 최길동, 함길동; 홍길동";
	request.setAttribute("names", names);
%>
<c:forTokens var="name" items="${names}" delims=",;" varStatus="status">
	${name}<br>
</c:forTokens>
</body>
</html>