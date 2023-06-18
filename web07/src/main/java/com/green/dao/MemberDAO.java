package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.vo.MemberVO;

public class MemberDAO { // 데이터베이스 연동을 위한 클래스
	// 싱글톤
	private MemberDAO() {}
	private static MemberDAO dao = new MemberDAO();
	public static MemberDAO getInstance() {
		return dao;
	}
	// --------------------------------------------------
	// DB와 관련된 기능을 처리하기 위한 클래스
	
	// 데이터베이스 연결 객체를 만드는 메서드
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		
		return conn;
	}

	// 아이디, 비밀번호를 입력받아서 인증처리를 하기 위한 메서드
	public int userCheck(String userid, String userpwd) {
		int result = -1;
		String sql = "SELECT userpwd FROM member WHERE userid=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 아이디를 찾은 경우
				if(rs.getString("userpwd") != null && rs.getString("userpwd").equals(userpwd)) {
					// 로그인 성공
					result = 1;
				}else {
					// 비밀번호가 null로 저장되었거나 일치하지 않는 경우
					result = 0;
				}
			}else { // 아이디를 찾을 수 없는 경우
				result = -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public MemberVO getMember(String userid) {
		// 아이디를 가진 회원 정보 가져오기
		MemberVO member = null;
		String sql = "SELECT * FROM member WHERE userid = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				member.setName(rs.getString("name"));
				member.setUserid(rs.getString("userid"));
				member.setUserpwd(rs.getString("userpwd"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAdmin(rs.getInt("admin"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return member;
	}

	// 회원 정보 수정
	public void updateMember(MemberVO mvo) {
		String sql = "UPDATE member "
				+ " SET userpwd = ?, email = ?, phone = ?, admin = ? "
				+ " WHERE userid = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mvo.getUserpwd());
			psmt.setString(2, mvo.getEmail());
			psmt.setString(3, mvo.getPhone());
			psmt.setInt(4, mvo.getAdmin());
			psmt.setString(5, mvo.getUserid());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 아이디 중복을 체크하기 위한 메서드
	public int confirmID(String userid) {
		int result = -1;
		
		String sql = "SELECT userid FROM member WHERE userid = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;		// 아이디가 존재 => 사용자가 사용하려던 아이디 이미 존재
								// => 사용불가
			}else {
				result = -1;	// 아이디가 부재 => 사용자가 사용하려던 아이디 부재
								// => 사용가능
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//입력받은 회원 정보로
	public void insertMember(MemberVO member) {
		String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getName());
			psmt.setString(2, member.getUserid());
			psmt.setString(3, member.getUserpwd());
			psmt.setString(4, member.getEmail());
			psmt.setString(5, member.getPhone());
			psmt.setInt(6, member.getAdmin());
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}