package com.green.dao;

import java.sql.Connection;

public class TestConn {
	public static void main(String[] args) throws Exception{
		MemberDAO dao = MemberDAO.getInstance();
		
		Connection conn = dao.getConnection();
		
		if(conn != null) {
			System.out.println("연결 성공");
			conn.close();
		}else {
			System.out.println("연결 실패");
		}
	}
}