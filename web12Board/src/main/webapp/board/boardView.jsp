<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="style/board.css">
</head>
<body>
	<div id="wrap">
	<h1>게시물 상세보기</h1>
	<table>
		<tr>
			<th>작성자</th>
			<td>${board.name}</td>
			<th>이메일</th>
			<td>${board.email}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${board.writeDate}"/></td>
			<th>조회수</th>
			<td>${board.readCount}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${board.title}</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">${board.content}</td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="button"
				onclick="openWin('bs?command=board_check_pass_form&num=${board.num}', 'update')">
					수정
				</button>
				<button type="button"
				onclick="openWin('bs?command=board_check_pass_form&num=${board.num}', 'delete')">
					삭제
				</button>
				<button type="button" onclick="location.href='bs?command=board_list'">목록보기</button>
			</td>
		</tr>
	</table>
	</div>
	<script type="text/javascript">
		function openWin(url, info) {
			window.open(url, info, 'width=500, height=400');
		}
	</script>
</body>
</html>