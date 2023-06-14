<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 정보 삭제
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃이 정상적으로 완료되었습니다.");
	location.href="./ex07_loginForm.jsp";
</script>