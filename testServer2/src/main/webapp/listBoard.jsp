<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 보기</title>
</head>
<body>
	<h1>게시물 목록 보기</h1>
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>글 제목</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${lists}" var="board"> <!-- for(Board board : lists) {~~~} -->
			<tr>
				<td>${board.boardNum}</td>
				<td><a href="detailBoard?num=${board.boardNum}">${board.boardTitle}</a></td>
				<td>${board.boardCount}</td>
			</tr>	
		</c:forEach>
		<tr>
			<td colspan="3">
				<button type="button" onclick="location.href='writeBoard'">글 작성</button>
			</td>
		</tr>
	</table>
</body>
</html>