<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
</head>
<body>
	<h1>수정 페이지</h1>
	<form action="updateBoard" method="post">
		<table border="1">
			<tr>
				<th>글 번호</th>
				<td><input type="text" name="num" value="${board.boardNum}" readonly></td>
				<th>조회수</th>
				<td><input type="text" name="count" value="${board.boardCount}" readonly></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${board.boardWriter}"></td>
				<th>작성일</th>
				<td>
<input type="text" name="regDate" value="<fmt:formatDate value='${board.boardRegDate}' pattern='yyyy-MM-dd'/>" readonly>
				</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td colspan="3"><input type="text" name="title" value="${board.boardTitle}"></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td colspan="3">
					<textarea rows="10" cols="80" name="content">${board.boardContent}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='listBoard'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>