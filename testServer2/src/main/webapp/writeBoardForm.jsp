<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	<form action="writeBoard" method="post">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td>
					<textarea rows="10" cols="80" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
					<button type="reset">다시작성</button>
					<button type="button" onclick="location.href='listBoard'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>