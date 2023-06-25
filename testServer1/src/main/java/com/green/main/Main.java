package com.green.main;

import com.green.comtroller.Controller;

public class Main {
	public static void main(String[] args) {
		new Controller();
	}
	
	/* ---- READ ME ----
	 * 문제 의도 : 자바와 데이터베이스 간의 데이터 전송(CRUD) 과제
	 * 
	 * 1. 준비 작업
	 * 	1) 드라이버 복사 (ojdbc8.jar)
	 * 	2) 데이터베이스에 테이블과 시퀀스를 미리 제작
	 * 	3) 샘플 데이터 삽입 (-> commit)
	 * 	4) 각 클래스를 미리 생성
	 * 	   - Main, Controller, DBManager, BoardDao, BoardVo
	 * 	
	 * 2. DBManager 클래스를 제작 (static으로 제작)
	 * 	1) 연결 객체를 반환하는 메서드
	 * 	2) 리소스를 닫는 메서드 2개
	 * 
	 * 3. BoardVo 클래스를 제작
	 * 	1) 테이블과 같은 양식
	 * 	2) Getter와 Setter 메서드도 제작
	 * 
	 * 4. BoardDao 클래스 제작
	 * 	1) 싱글톤 패턴으로 제작
	 * 	2) [기능] 게시글 목록 가져오기
	 * 	3) [기능] 게시글 작성하기
	 * 	4) [기능] 게시글 수정하기
	 * 	5) [기능] 게시글 삭제하기
	 * 	6) [기능] 게시글 조회하기
	 * 	7) [기능] 조회수 증가
	 * 
	 * 5. Controller 클래스 제작
	 * 	-> 글 목록 조회 -> 단일 글 조회 ->	수정
	 * 								삭제
	 * 	-> 글 등록
	 * 
	 * 6. Main 클래스 제작
	 * 	1) Controller 인스턴스 연결
	 */
}