package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.green.db.DBmanager;
import com.green.vo.BoardVo;

public class BoardDao {
	// 싱글톤 패턴
	private BoardDao() {}
	private static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao;
	}
	
	// --------------------------------------------------
	// 전체 게시물 조회 (페이징X)
	public List<BoardVo> selectAllBoards() {
		List<BoardVo> lists = new ArrayList<>();
		
		String sql = "SELECT * FROM board ORDER BY num DESC"; // 최신글이 상단에 보이도록
		
		Connection conn  = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBmanager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BoardVo board = new BoardVo();
				
				board.setNum(rs.getInt("num"));
				board.setPass(rs.getString("pass"));
				board.setName(rs.getString("name"));
				board.setEmail(rs.getString("email"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setReadCount(rs.getInt("readCount"));
				board.setWriteDate(rs.getTimestamp("writeDate"));
				
				lists.add(board);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, stmt, rs);
		}
		return lists;
	}
	
	// 조회수 증가
	public void updateReadCount(int num) {
		String sql ="UPDATE board SET readCount = readCount+1 WHERE num = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, num);
			
			psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt);
		}
	}

	// 단일 게시물 조회
	public BoardVo selectBoardByNum(int num) {
		BoardVo board = null;
		
		String sql = "SELECT * FROM board WHERE num = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardVo();
				
				board.setNum(rs.getInt("num"));
				board.setPass(rs.getString("pass"));
				board.setName(rs.getString("name"));
				board.setEmail(rs.getString("email"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setReadCount(rs.getInt("readCount"));
				board.setWriteDate(rs.getTimestamp("writeDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt, rs);
		}
		return board;
	}

	// 게시물 등록
	public void insertBoard(BoardVo board) {
		String sql = "INSERT INTO board VALUES(board_seq.nextval, ?, ?, ?, ?, ?, 0, sysdate)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, board.getPass());
			psmt.setString(2, board.getName());
			psmt.setString(3, board.getEmail());
			psmt.setString(4, board.getTitle());
			psmt.setString(5, board.getContent());
			
			psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt);
		}
	}

	// 암호 확인
	public boolean checkPass(int num, String pass) {
		BoardVo board = selectBoardByNum(num);
		
		if(board.getPass().equals(pass)) {
			return true; // 암호 일치
		}else {
			return false; // 암호 불일치
		}
	}

	// 게시물 삭제
	public void deleteBoard(int num) {
		String sql = "DELETE FROM board WHERE num = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, num);
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt);
		}
	}
	
	// 게시물 수정
	public void updateBoard(BoardVo board) {
		String sql = "UPDATE board SET name = ?, email = ?, pass = ?, title = ?, content = ? WHERE num = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, board.getName());
			psmt.setString(2, board.getEmail());
			psmt.setString(3, board.getPass());
			psmt.setString(4, board.getTitle());
			psmt.setString(5, board.getContent());
			psmt.setInt(6, board.getNum());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt);
		}
	}

	// 전체 게시물 수를 알아오는 쿼리
	public int selectAllNum() {
		int allCnt = 0;
		
		String sql = "SELECT count(*) FROM board";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBmanager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				allCnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, stmt, rs);
		}
		return allCnt;
	}
	
	// 현재 페이지 정보를 통해서 해당 페이지 글 목록을 읽어오기
	public List<BoardVo> selectTargetBoards(int section, int pageNum) {
		List<BoardVo> lists = new ArrayList<>();
		
		String sql = " SELECT * "
				+ " FROM ( "
				+ " SELECT ROWNUM as nickNum, num, pass, name, email, title, content, readCount, writeDate "
				+ " FROM (SELECT * FROM board ORDER BY num DESC)) "
				+ " WHERE nickNum BETWEEN (?-1) *100 + (?-1) *10 +1 AND (?-1) *100 + (?) *10";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try{
			conn = DBmanager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, section);
			psmt.setInt(2, pageNum);
			psmt.setInt(3, section);
			psmt.setInt(4, pageNum);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVo board = new BoardVo();
				
				board.setNum(rs.getInt("num"));
				board.setPass(rs.getString("pass"));
				board.setName(rs.getString("name"));
				board.setEmail(rs.getString("email"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setReadCount(rs.getInt("readCount"));
				board.setWriteDate(rs.getTimestamp("writeDate"));
				
				lists.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(conn, psmt, rs);
		}
		return lists;
	}
}