package com.green.controller;

import com.green.action.Action;
import com.green.action.BoardCheckPassAction;
import com.green.action.BoardCheckPassFormAction;
import com.green.action.BoardDeleteAction;
import com.green.action.BoardListAction;
import com.green.action.BoardUpdateAction;
import com.green.action.BoardUpdateFormAction;
import com.green.action.BoardViewAction;
import com.green.action.BoardWriteAction;
import com.green.action.BoardWriteFormAction;

public class ActionFactory {
	private ActionFactory() {}
	private static ActionFactory af = new ActionFactory();
	public static ActionFactory getInstance() {
		return af;
	}
	
	// --------------------------------------------------
	// command는 어떤 기능을 처리할지 알려주는 명령어
	// 해당 기능을 가진 인스턴스를 반환해주는 역할
	
	public Action getAction(String command) {
		Action action = null;
		
//		if(command.equals("수정")) {
//			return new 수정_기능을_가진_클래스();	// 타입 인터페이스를 구현한 클래스
//		}else if(command.equals("삭제")) {
//			return new  삭제_기능을_가진_클래스();	// 타입 인터페이스를 구현한 클래스
//		}
		
		if(command.equals("board_list")) {
			action = new BoardListAction();					// 게시물 목록보기
		}else if(command.equals("board_view")) {
			action = new BoardViewAction();					// 게시물 상세보기
		}else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();			// 게시물 등록 폼으로 이동하기
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();				// 게시물 등록하기(DB에 저장)
		}else if(command.equals("board_check_pass_form")) {
			action = new BoardCheckPassFormAction();		// 암호 확인 폼으로 이동하기
		}else if(command.equals("board_check_pass")) {
			action = new BoardCheckPassAction();			// 암호를 확인하는 기능
		}else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();				// 게시물 삭제하기
		}else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();			// 게시물 수정 폼으로 이동하기
		}else if(command.equals("board_update")) {
			action = new BoardUpdateAction();				// 게시물 수정하기
		}
		
		return action;
	}
}