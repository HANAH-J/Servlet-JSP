<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>회원 가입 페이지</h2>
	<p>'*' 표시 항목은 필수입력 항목입니다.</p>
	<form action="join" method="POST" name="frm">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required>*</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="userid" required>*
					<input type="hidden" name="reid"> <!-- 중복을 확인했는지 체크하는 부분 -->
					<button type="button" onclick="idCheck()">중복체크</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpwd" required>*</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwd_check" required>*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone"></td>
			</tr>
			<tr>
				<td>등급</td>
				<td>
					<input type="radio" name="admin" value="0">일반회원
					<input type="radio" name="admin" value="1">관리자
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" onclick="return joinCheck()">회원가입</button>
					<button type="reset">입력취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>