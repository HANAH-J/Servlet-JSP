<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 페이지</h2>
	<!-- 서버의 Context.xml에 다음 내용 추가
	<Context allowCasualMultipartParsing="true" path="/">
	<Resources cachingAllowed="true" cacheMaxSize="100000" />
	-->
	
	<form action="fileUpload" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="writer"><br>
		글제목 : <input type="text" name="title"><br>
		파일1 : <input type="file" name="file1"><br>
		파일2 : <input type="file" name="file2"><br>
	<button type="submit">업로드</button>
	</form>
</body>
</html>