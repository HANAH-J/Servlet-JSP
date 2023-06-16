<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>숫자표기</h3>
<fmt:formatNumber value="1234567.89"/><br> <!-- 1,234,567.89 -->
<fmt:formatNumber value="1234567.89" groupingUsed="false"/><br> <!-- 1234567.89 -->
<fmt:formatNumber value=".89" type="percent"/><br> <!-- 89% -->
<fmt:formatNumber value="10000" type="currency"/><br> <!-- (W)10000 -->
<fmt:formatNumber value="10000" type="currency" currencySymbol="$"/><br> <!-- ($)10000 -->
<hr>
<fmt:formatNumber value="12345678.987654321" pattern="#, #00.0#"/><br> <!-- 12,345,678.99 -->
<fmt:formatNumber value="12345678.9" pattern="#, #00.0#"/><br> <!-- 12,345,678.9 -->
<fmt:formatNumber value="12345678.9" pattern="#, #00.000#"/><br> <!-- 12,345,678.900 -->
<fmt:formatNumber value="78.9" pattern="000,000.000"/><br> <!-- 000,078,900 -->

<hr>
<c:set var="now" value="<%=new java.util.Date() %>"/>

<fmt:formatDate value="${now}" type="date"/><br> <!-- 년월일 -->
<fmt:formatDate value="${now}" type="time"/><br> <!-- 시분초 -->
<fmt:formatDate value="${now}" type="both"/><br> <!-- 년월일 시분초 -->
<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 a hh시 mm분 ss초"/><br>
								<!-- OOOO년 OO월 OO일 오후 OO시 OO분 OO초 -->
<hr>
<fmt:timeZone value="GMT">
	GMT : <fmt:formatDate value="${now}" type="both"/><br>
</fmt:timeZone>
<fmt:timeZone value="GMT+9">
	GMT+9 : <fmt:formatDate value="${now}" type="both"/><br>
</fmt:timeZone>

<hr>
톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br>

<fmt:setLocale value="lt_LT"/> <!-- 언어코드_국가코드 -->
로케일을 리투아니아로 설정한 후의 로케일 : <%=response.getLocale() %><br>
통화 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="zh_CN"/> <!-- 언어코드_국가코드 -->
로케일을 중국어로 설정한 후의 로케일 : <%=response.getLocale() %><br>
통화 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="ja_JP"/> <!-- 언어코드_국가코드 -->
로케일을 일본어로 설정한 후의 로케일 : <%=response.getLocale() %><br>
통화 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="en_US"/> <!-- 언어코드_국가코드 -->
로케일을 미국어 설정한 후의 로케일 : <%=response.getLocale() %><br>
통화 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
<fmt:setLocale value="ko_KR"/> <!-- 언어코드_국가코드 -->
로케일을 한국어 설정한 후의 로케일 : <%=response.getLocale() %><br>
통화 : <fmt:formatNumber value="10000" type="currency"/><br>
날짜 : <fmt:formatDate value="${now}" type="both"/><br>
<hr>
</body>
</html>