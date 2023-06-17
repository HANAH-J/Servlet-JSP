<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // HTTP://서버주소:포트번호/경로
	String uId = "GREEN01";
	String uPwd = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	
	/* String sql = "INSERT INTO member " + 
				 	" VALUES('최길동', 'choi', '1234', 'choi@naver.com', '010-1234-5678', 0)"; */
				 
	String name = "최길동"; // request.getParameter("userName");
	String userId = "choi";
	String userPwd = "1234";
	String email = "choi@naver.com";
	String phone = "010-1234-5678";
	int admin = 0;
	
	String sql = "INSERT INTO member " + 
			 	 " VALUES('"+name+"', '"+userId+"', '"+userPwd+"', '"+email+"', '"+phone+"', "+admin+")";
%>
<%
	try{
		// 1단계 : 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2단계 : 데이터베이스 연결
		conn = DriverManager.getConnection(url, uId, uPwd);
		// 3단계 : 쿼리문을 실행할 객체 생성
		stmt = conn.createStatement();
		// 4단계 : 쿼리문 전달
		int num = stmt.executeUpdate(sql);
		
		// num 반환값 : 몇 개의 레코드가 수정되었는지 알려주는 정보
		System.out.println("바뀐 행의 수 : " + num);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(stmt != null){stmt.close();}
			if(conn != null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>