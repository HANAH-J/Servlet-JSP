package com.green.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.green.db.DBManager;
import com.green.vo.CommentVo;

public class CommentDao {
	private CommentDao() {}
	private static CommentDao dao = new CommentDao();
	public static CommentDao getInstance() {
		return dao;
	}
	
//	[기능] 모든 댓글 읽어오기
	public List<CommentVo> selectAllComments() {
		List<CommentVo> lists = new ArrayList<>();
		
		String sql = "SELECT * FROM commentTbl ORDER BY commentCode DESC";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CommentVo comment = new CommentVo();
				
				comment.setCommentCode(rs.getInt("commentCode"));
				comment.setBoardNum(rs.getInt("boardNum"));
				comment.setCommentUser(rs.getString("commentUser"));
				comment.setCommentComment(rs.getString("commentComment"));
				comment.setCommentPassword(rs.getString("commentPassword"));
				comment.setCommentRegDate(rs.getTimestamp("commentRegDate"));
				
				lists.add(comment);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		
		return lists;
	}
	
//	[기능] 댓글 저장하기
	public void insertComment(CommentVo comment) {
		String sql = "INSERT INTO commentTbl VALUES(comment_seq.nextval, 1, ?, ?, ?, sysdate)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, comment.getCommentUser());
			psmt.setString(2, comment.getCommentComment());
			psmt.setString(3, comment.getCommentPassword());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}

//	[기능] 암호 체크
	public boolean checkPassword(int num, String pass) {
		boolean result = false;
		
		String sql = "SELECT commentPassword FROM commentTbl WHERE commentCode = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);	
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("commentPassword"))) {
					result = true;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return result;
	}
	
//	[기능] 댓글 수정하기
	public void updateComment(int commentCode, String commentComment) {
		String sql = "UPDATE commentTbl SET commentComment = ? WHERE commentCode = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, commentComment);
			psmt.setInt(2, commentCode);
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	
//	[기능] 댓글 삭제하기
	public void deleteComment(int commentCode) {
		String sql = "DELETE FROM commentTbl WHERE commentCode = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, commentCode);
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
}