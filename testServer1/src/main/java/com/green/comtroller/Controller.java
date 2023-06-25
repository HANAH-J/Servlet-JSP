package com.green.comtroller;

import java.util.List;
import java.util.Scanner;

import com.green.dao.BoardDao;
import com.green.vo.BoardVo;

public class Controller {
	
	Scanner scan = new Scanner(System.in);
	BoardDao dao = BoardDao.getInstance();
	
	public Controller() {
		init();
	}
	
	private void init() {
		while(true) {
			int menuNum = mainMenu();
			
			switch(menuNum) {
			case 1: // 글 목록 출력 -> 번호 입력 시 상세조회 -> 삭제할지, 수정할지
				listBoard();
				break;
			case 2: // 글 작성
				writeBoard();
				break;
			case 3: // 프로그램 종료
				systemExit();
				break;
			default:
				error();
			}
		}
	}

	private void listBoard() {
		// 게시글 목록 보기
		List<BoardVo> lists = dao.selectAllBoards();
		
		System.out.println("*** 게시물 목록을 출력합니다. ***");
		for(BoardVo b : lists) { // c:forEach
			System.out.println(b.getBoardNum() + "." + b.getBoardtitle() + " : " + b.getBoardWriter());
		}
		System.out.println("--------------------------------------------------");
		System.out.println("글 번호를 입력하면 해당 게시물의 상세보기로 이동합니다.");
		System.out.println("0번을 누르면 메인메뉴로 돌아갑니다.");
		
		int selectNum = Integer.parseInt(scan.nextLine());
		
		if(selectNum == 0) {
			return;
		}else {
			detailBoard(selectNum);
		}
	}

	private void detailBoard(int selectNum) {
		// 상세보기
		BoardVo board =  dao.selectBoardByNum(selectNum);
		
		System.out.println("--------------------------------------------------");
		System.out.println("글번호 : " + board.getBoardNum());
		System.out.println("작성일 : " + board.getBoardRegDate());
		System.out.println("글제목 : " + board.getBoardtitle());
		System.out.println("작성자 : " + board.getBoardWriter());
		System.out.println("글내용 : " + board.getBoardContent());
		System.out.println("조회수 : " + board.getBoardCount());
		System.out.println("--------------------------------------------------");
		
		detailMenu(board);
	}

	private void detailMenu(BoardVo board) {
		// 수정 및 삭제
		while(true) {
			System.out.println("1. 수정하기");
			System.out.println("2. 삭제하기");
			System.out.println("0. 메인메뉴 돌아가기");
			System.out.print(">>");
			int num = Integer.parseInt(scan.nextLine());
			
			switch(num) {
			case 0 :
				return;
			case 1:
				updateBoard(board);
				break;
			case 2: // 삭제
				dao.deleteBoard(board.getBoardNum());
				break;
			default:
				error();
			}
		}
	}

	private void updateBoard(BoardVo board) {
		System.out.println("게시글을 수정합니다.");
		System.out.println("작성자를 입력하세요.");
		System.out.print(">>");
		String writer = scan.nextLine();
		System.out.println("글 제목을 입력하세요.");
		System.out.print(">>");
		String title = scan.nextLine();
		System.out.println("글 내용을 입력하세요.");
		System.out.print(">>");
		String content = scan.nextLine();
		
		board.setBoardtitle(title);
		board.setBoardContent(content);
		board.setBoardWriter(writer);
		
		dao.updateBoard(board);
		System.out.println("수정 완료");
	}

	private void writeBoard() {
		System.out.println("게시글을 작성합니다.");
		System.out.println("작성자를 입력하세요.");
		System.out.print(">>");
		String writer = scan.nextLine();
		System.out.println("글 제목을 입력하세요.");
		System.out.print(">>");
		String title = scan.nextLine();
		System.out.println("글 내용을 입력하세요.");
		System.out.print(">>");
		String content = scan.nextLine();
		
		BoardVo board = new BoardVo();
		board.setBoardtitle(title);
		board.setBoardContent(content);
		board.setBoardWriter(writer);
		
		dao.insertBoard(board);
		System.out.println("저장 완료");
	}

	private void systemExit() {
		System.out.println("프로그램을 종료합니다.");
		System.exit(0);
	}

	private void error() {
		System.out.println("잘못 입력했습니다.");
		System.out.println("다시 확인해주세요.");
	}

	private int mainMenu() {
		System.out.println("--------------------------------------------------");
		System.out.println("그린 아카데미 자유 게시판입니다.");
		System.out.println("1. 글 목록 보기");
		System.out.println("2. 글 작성");
		System.out.println("3. 프로그램 종료");
		System.out.println("--------------------------------------------------");
		System.out.print(">>");
		int num = Integer.parseInt(scan.nextLine());
		return num;
	}
}