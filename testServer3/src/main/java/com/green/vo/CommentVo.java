package com.green.vo;

import java.sql.Timestamp;

public class CommentVo {
	private int commentCode;
	private int boardNum;
	private String commentUser;
	private String commentComment;
	private String commentPassword;
    private Timestamp commentRegDate;
    
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getCommentUser() {
		return commentUser;
	}
	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}
	public String getCommentComment() {
		return commentComment;
	}
	public void setCommentComment(String commentComment) {
		this.commentComment = commentComment;
	}
	public String getCommentPassword() {
		return commentPassword;
	}
	public void setCommentPassword(String commentPassword) {
		this.commentPassword = commentPassword;
	}
	public Timestamp getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(Timestamp commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
}