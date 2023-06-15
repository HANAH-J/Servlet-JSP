<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.green.beans.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 1. 자바빈을 생성 --%>
<%-- 방법 1) 스크립트릿에서 자바빈 생성 --%>
<%--
	Member member1 = new Member();
	session.setAttribute("member1", member1);
--%>
<%-- 방법 2) 액션태그에서 자바빈 생성 --%>
<jsp:useBean id="member2" class="com.green.beans.Member" scope="session"></jsp:useBean>

<%-- -------------------------------------------------- --%>
<%-- 2. 데이터 입력 : 폼에서 가져온 데이터를 자바빈에 저장하는 방법 --%>
<%-- 방법 1) 스크립트릿을 이용한 데이터 입력 1 --%>
<%--
 	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String name = request.getParameter("name");
	String nickName = request.getParameter("nickName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	member1.setUserId(userId);
	member1.setUserPw(userPw);
	member1.setName(name);
	member1.setNickName(nickName);
	member1.setEmail(email);
	member1.setPhone(phone);
--%>
<%-- 방법 2) 스크립트릿을 이용한 데이터 입력 2 --%>
<%--
 	member1.setUserId(request.getParameter("userId"));
	member1.setUserPw(request.getParameter("userPw"));
	member1.setName(request.getParameter("name"));
	member1.setNickName(request.getParameter("nickName"));
	member1.setEmail(request.getParameter("email"));
	member1.setPhone(request.getParameter("phone"));
--%>
<%-- 방법 3) 액션태그를 이용한 데이터 입력 1 --%>
<%--  	<jsp:setProperty property="userId" name="member2" value='<%=request.getParameter("userId") %>'/>
	<jsp:setProperty property="userPw" name="member2" value='<%=request.getParameter("userPw") %>'/>
	<jsp:setProperty property="name" name="member2" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty property="nickName" name="member2" value='<%=request.getParameter("nickName") %>'/>
	<jsp:setProperty property="email" name="member2" value='<%=request.getParameter("email") %>'/>
	<jsp:setProperty property="phone" name="member2" value='<%=request.getParameter("phone") %>'/> --%>
	
<%-- 방법 4) 액션태그를 이용한 데이터 입력 2 --%>
<%--  	<jsp:setProperty property="userId" name="member2"/>
	<jsp:setProperty property="userPw" name="member2"/>
	<jsp:setProperty property="name" name="member2"/>
	<jsp:setProperty property="nickName" name="member2"/>
	<jsp:setProperty property="email" name="member2"/>
	<jsp:setProperty property="phone" name="member2"/> --%>
	
<%-- 방법 5) 액션태그를 이용한 데이터 입력 --%>
	<jsp:setProperty property="*" name="member2"/>

<%-- -------------------------------------------------- --%>
<%-- 3. 데이터 출력 : 자바빈에 저장된 데이터를 화면에 출력 --%>
<%-- 방법 1) 스크립트릿을 이용한 데이터 출력 --%>
<%-- <h2>스크립트릿을 이용한 회원 정보 출력</h2>
아이디 : <%=member1.getUserId() %><br>
비밀번호 : <%=member1.getUserPw() %><br>
이름 : <%=member1.getName() %><br>
별명 : <%=member1.getNickName() %><br>
이메일 : <%=member1.getEmail() %><br>
전화번호 : <%=member1.getPhone() %><br> --%>

<%-- 방법 2) 액션태그를 이용한 데이터 출력 --%>
<h2>액션태그를 이용한 회원 정보 출력</h2>
아이디 : <jsp:getProperty property="userId" name="member2"/><br>
비밀번호 : <jsp:getProperty property="userPw" name="member2"/><br>
이름 : <jsp:getProperty property="name" name="member2"/><br>
별명 : <jsp:getProperty property="nickName" name="member2"/><br>
이메일 : <jsp:getProperty property="email" name="member2"/><br>
전화번호 : <jsp:getProperty property="phone" name="member2"/><br>
</body>
</html>