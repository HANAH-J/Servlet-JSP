<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// 오라클 DB에 접속하기 위한 5가지 정보
	// 1. 서버 주소	: localhost	// IP주소
	// 2. 포트번호		: 1521
	// 3. SID		: XE	// ORCL
	// 4. 계정명		: GREEN01
	// 5. 비밀번호		: 1234
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // HTTP://서버주소:포트번호/경로
	String uId = "GREEN01";
	String uPwd = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
%>

<%
	try{
		// 1단계 : 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		// 2단계 : 데이터베이스에 연결 => 연결객체 생성
		conn = DriverManager.getConnection(url, uId, uPwd);
		
		// 3단계 : 쿼리문을 실행할 객체를 생성
		String sql = "SELECT * FROM member"; // 쿼리문 문자열은 반드시 ;(세미콜론)을 빼야 한다.
		
		// ORA-000000 => DBMS 오류
		stmt = conn.createStatement();
		
		// 4단계 : 쿼리문 전달
		//	- 데이터베이스에게 데이터를 보내기 위한 쿼리문(insert, update, delete)
		//	  executeUpdate(query);
		//	- 데이터베이스에서 데이터를 가져오기 위한 쿼리문(select)
		//	  executeQuery(query);
		rs = stmt.executeQuery(sql);
		
		// 5-1단계 : 쿼리문을 통해서 읽어온 데이터 출력
		/* while(rs.next()){
//			next()
//			메서드가 true면 꺼낼 레코드가 있다.
//			메서드가 false면 더 이상 꺼낼 레코드가 없다.

			String name = rs.getString("name"); // 현재 레코드에서 name 컬럼의 문자열 데이터를 꺼내세요.
			String email = rs.getString(4); // 현재 레코드에서 4번째 컬럼의 문자열 데이터를 꺼내세요.
			
			out.println("<p>이름 : " + name + "</p>");
			out.println("<p>이메일 : " + email + "</p>");
			out.println("<hr>");
		} */
		
		List<Member> memberList = new ArrayList<>();
		
		// 5-2단계 : 얻어온 데이터를 저장
		while(rs.next()){
			Member m = new Member();
			
			m.setName(rs.getString("name"));
			m.setUserid(rs.getString("userid"));
			m.setUserpwd(rs.getString("userpwd"));
			m.setEmail(rs.getString("email"));
			m.setPhone(rs.getString("phone"));
			m.setAdmin(rs.getInt("admin"));
			
			// 하나의 자바빈 인스턴스 = 하나의 레코드 데이터;
			memberList.add(m);
		}
		// memberList에는 가져온 모든 레코드 데이터가 저장된다.
		// memberList.get(0).getName(); 리스트의 0번 레코드에서 이름을 꺼내세요.
		
		request.setAttribute("memberList", memberList);
		
		// 다른 JSP에서 꺼내 쓸 때
		// List<Member> mList = (List) request.getAttribute("memberList");
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>