<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
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
//	Statement stmt = null;
	PreparedStatement psmt = null;
				 
	String name = "강길동"; // request.getParameter("userName");
	String userId = "kang";
	String userPwd = "1234";
	String email = "kang@naver.com";
	String phone = "010-1234-5678";
	int admin = 1;
	
	/* String sql = "INSERT INTO member " + 
			 	 " VALUES('"+name+"', '"+userId+"', '"+userPwd+"', '"+email+"', '"+phone+"', "+admin+")"; */
	String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
%>
<%
	try{
		// 1단계 : 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2단계 : 데이터베이스 연결
		conn = DriverManager.getConnection(url, uId, uPwd);
		// 3단계 : 쿼리문을 실행할 객체 생성
//		stmt = conn.createStatement();
		psmt = conn.prepareStatement(sql); // 미완성의 쿼리문 전달
		
		// 4단계 : 쿼리문을 채워서 완성
		psmt.setString(1, name);
		psmt.setString(2, userId);
		psmt.setString(3, userPwd);
		psmt.setString(4, email);
		psmt.setString(5, phone);
		psmt.setInt(6, admin);
		
		// 5단계 : 쿼리문 전달
		int num = psmt.executeUpdate();
		
		// num 반환값 : 몇 개의 레코드가 수정되었는지 알려주는 정보
		System.out.println("바뀐 행의 수 : " + num);
		
		// 트랜젝션
		// 물리적인 작업을 묶어서 하나의 논리적인 작업으로 만드는 것
		// commit; rollback;
		
		// conn.setAutoCommit(true); // 쿼리문 하나당 트랜젝션 하나
		
//		conn.setAutoCommit(false); // 자동 커밋을 중단
		
//		conn.commit(); // 커밋 진행
//		conn.rollback(); // 롤백 진행
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(psmt != null){psmt.close();}
			if(conn != null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>