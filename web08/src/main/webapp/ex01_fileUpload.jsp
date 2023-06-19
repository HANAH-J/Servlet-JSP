<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 예제</h2>
	<form action="fileUpload" method="POST" enctype="multipart/form-data">
		글쓴이 : <input type="text" name="writer"><br>
		제목 : <input type="text" name="title"><br>
		파일 : <input type="file" name="fileUpload"><br>
		<button type="submit">전송</button>
	</form>
</body>
</html>