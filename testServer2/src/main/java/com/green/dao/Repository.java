package com.green.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.vo.BoardVo;

public class Repository {
	private Repository() {}
	private static Repository repo = new Repository();
	public static Repository getInstance() {
		return repo;
	}
	
	// 저장용 변수
	private Map<Integer, BoardVo> map = new HashMap<>();
	
	// 번호용 변수
	private int seqNum = 0;
	
//	[기능] 게시글 목록 가져오기
	public List<BoardVo> selectAllBoards(){
		return new ArrayList<>(map.values());
	}
	
//	[기능] 게시글 작성하기
	public void writeBoard(BoardVo board) {
		seqNum++;
		board.setBoardNum(seqNum);
		map.put(seqNum, board);
	}
//	[기능] 게시글 수정하기
	public void updateBoard(BoardVo board) {
		map.put(board.getBoardNum(), board);
	}
	
//	[기능] 게시글 삭제하기
	public void deleteBoard(int boardNum) {
		map.remove(boardNum);
	}
	
//	[기능] 게시글 조회하기
	public BoardVo selectBoardByNum(int boardNum) {
		count(boardNum);
		return map.get(boardNum);
	}
	
//	[기능] 조회수 증가
	public void count(int boardNum) {
		BoardVo board = map.get(boardNum);
		board.setBoardCount(board.getBoardCount()+1);
	}

	public void inputSample() {
		// 5개 정도 샘플 데이터
		
		// 1번 데이터
		BoardVo b1 = new BoardVo();
		b1.setBoardTitle("첫 번째 글");
		b1.setBoardContent("안녕하세요.");
		b1.setBoardWriter("홍길동");
		
		writeBoard(b1);
		
		// 2번 데이터
		BoardVo b2 = new BoardVo();
		b2.setBoardTitle("두 번째 글");
		b2.setBoardContent("반갑습니다.");
		b2.setBoardWriter("박길동");

		writeBoard(b2);
		
		// 3번 데이터
		BoardVo b3 = new BoardVo();
		b3.setBoardTitle("세 번째 글");
		b3.setBoardContent("식사는 하셨나요?");
		b3.setBoardWriter("김길동");

		writeBoard(b3);

		// 4번 데이터
		BoardVo b4 = new BoardVo();
		b4.setBoardTitle("네 번째 글");
		b4.setBoardContent("고생하셨어요.");
		b4.setBoardWriter("이길동");

		writeBoard(b4);
		
		// 5번 데이터
		BoardVo b5 = new BoardVo();
		b5.setBoardTitle("다섯 번째 글");
		b5.setBoardContent("내일 봐요.");
		b5.setBoardWriter("최길동");

		writeBoard(b5);
	}
}