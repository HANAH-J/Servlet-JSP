<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./ex10_result.jsp">
		<label for="color">색상을 선택하세요.</label>
		<select id="color" name="color">
			<option value="1">빨강</option>
			<option value="2">파랑</option>
			<option value="3">초록</option>
		</select><br>
		<button type="submit">선택</button>
	</form>
</body>
</html>