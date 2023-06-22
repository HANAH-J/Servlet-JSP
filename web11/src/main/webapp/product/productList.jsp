<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 리스트</title>
<link rel="stylesheet" href="./style/comment.css">
</head>
<body>
	<div id="wrap" align="center">
		<table class="list">
			<tr>
				<th>작성자</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${lists}" var="comment" varStatus="s">
				<tr>
					<td>${s.count}</td>
					<td>${comment.c_user}</td>
					<td>${comment.c_comment}</td>
					<td><a href="commentUpdate?c_code=${comment.c_code}">수정</a></td>
					<td><a href="commentDelete?c_code=${comment.c_code}">삭제</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="border: white; text-align: right;">
					<a href="commentWrite">상품 등록</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>