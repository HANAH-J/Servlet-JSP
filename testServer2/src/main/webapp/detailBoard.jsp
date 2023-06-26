<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<h1>상세보기 페이지</h1>
	<table border="1">
		<tr>
			<th>글 번호</th>
			<td>${board.boardNum}</td>
			<th>조회수</th>
			<td>${board.boardCount}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.boardWriter}</td>
			<th>작성일</th>
			<td>${board.boardRegDate}</td>
		</tr>
		<tr>
			<th>글 제목</th>
			<td colspan="3">${board.boardTitle}</td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td colspan="3">${board.boardContent}</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="location.href='updateBoard?num=${board.boardNum}'">수정</button>
				<button type="button" onclick="deleteBoard()">삭제</button>
				<button type="button" onclick="location.href='listBoard'">목록보기</button>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function deleteBoard() {
			if(confirm('진짜 삭제하시겠습니까?')){
				location.href='deleteBoard?num=${board.boardNum}';
			}
		}
	</script>
</body>
</html>