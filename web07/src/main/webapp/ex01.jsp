<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원목록</h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(0:사용자, 1:관리자)</th>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM member";
			
			try{
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
				conn = ds.getConnection();
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					out.print("<tr>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getString("userid") + "</td>");
					out.print("<td>" + rs.getString("userpwd") + "</td>");
					out.print("<td>" + rs.getString("email") + "</td>");
					out.print("<td>" + rs.getString("phone") + "</td>");
					out.print("<td>" + rs.getInt("admin") + "</td>");
					out.print("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
	</table>
</body>
</html>