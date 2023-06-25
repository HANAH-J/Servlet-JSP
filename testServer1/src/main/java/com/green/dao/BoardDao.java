package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.green.db.DBManager;
import com.green.vo.BoardVo;

public class BoardDao {
	// ---- 싱글톤 ----
	private BoardDao() {}
	private static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao;
	}
	
	// [기능] 게시글 목록 가져오기
	public List<BoardVo> selectAllBoards(){
		List<BoardVo> lists = new ArrayList<>();
		String sql = "SELECT * FROM boardTbl ORDER BY boardNum DESC";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BoardVo board = new BoardVo();
				
				board.setBoardNum(rs.getInt("boardNum"));
				board.setBoardtitle(rs.getString("boardTitle"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardWriter(rs.getString("boardWriter"));
				board.setBoardCount(rs.getInt("boardCount"));
				board.setBoardRegDate(rs.getDate("boardRegDate"));
				// 날짜 관련 새로운 객체 : LocalDateTime()
				
				lists.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		return lists;
	}
	
	// [기능] 게시글 작성하기
	public void insertBoard(BoardVo board) {
		String sql = "INSERT INTO boardTbl VALUES(board_seq.nextval, ?, ?, ?, 0, SYSDATE)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, board.getBoardtitle());
			psmt.setString(2, board.getBoardContent());
			psmt.setString(3, board.getBoardWriter());
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	
	// [기능] 게시글 수정하기
	public void updateBoard(BoardVo board) {
		String sql = "UPDATE boardTbl SET boardTitle = ?, boardContent = ?, boardWriter = ? WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, board.getBoardtitle());
			psmt.setString(2, board.getBoardContent());
			psmt.setString(3, board.getBoardWriter());
			psmt.setInt(4, board.getBoardNum());
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	// [기능] 게시글 삭제하기
	public void deleteBoard(int boarddNum) {
		String sql = "DELETE FROM boardTbl WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boarddNum);
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	
	// [기능] 게시글 조회하기
	public BoardVo selectBoardByNum(int boardNum) {
		count(boardNum);
		
		BoardVo board = new BoardVo();
		
		String sql = "SELECT * FROM boardTbl WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				board.setBoardNum(rs.getInt("boardNum"));
				board.setBoardtitle(rs.getString("boardTitle"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardWriter(rs.getString("boardWriter"));
				board.setBoardCount(rs.getInt("boardCount"));
				board.setBoardRegDate(rs.getDate("boardRegDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return board;
	}
	
	// [기능] 조회수 증가
	public void count(int boardNum) {
		String sql = "UPDATE boardTbl SET boardCount = boardCount+1 WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
}