<게시판 만들기>

Ⅰ. 준비
1. 데이터베이스 구축							----- 완
   -> 테이블 생성, 시퀀스 생성
   
2. 샘플 데이터 삽입과 확인(-> COMMIT;)			----- 완

3. DBCP(커넥션 풀) 세팅(서버의 server.xml)	----- 완
   -> <Context>[작성]</Context>
   <Context docBase="프로젝트 이름" path="/프로젝트 이름" reloadable="true" source="org.eclipse.jst.jee.server:web12Board">
      	<Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              
              url="jdbc:oracle:thin:@127.0.0.1:1521:XE"	-- 경로
              username="GREEN01" password="1234"		-- 오라클 계정
              
              maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>
      </Context>
   
4. 각종 라이브러리 복사(Ojdbc8, JSTL)			----- 완

5. DBmanager 객체를 제작					----- 완
   -> DB연결 객체, 해제를 담당
   
6. VO 객체 제작							----- 완
   -> 데이터베이스 컬럼과 일치

7. DAO 객체 제작							----- 완
   -> 싱글톤 패턴으로 제작
   
8. CSS 제작(기존 복사 : board.css)			----- 완

--------------------------------------------------
9. 모든 요청을 처리하기 위한 서블릿				----- 완
   - BoardServlet.java [bs]
   - 각 요청과 그에 따른 로직을 연결시켜주기 위한 클래스
     (ActionFactory.java)

10. 로직 처리를 위한 메서드를 알려줄 인터페이스 제작	----- 완
    인터페이스(Action.java)
    
--------------------------------------------------
Ⅱ. 본격적인 기능 제작

11. 모든 게시물 보기 기능(목록보기)				----- 완
 - index.html 링크
 - 기능을 수행할 (command = 'board_list')
 - 기능을 수행할 클래스 (BoardListAction.java)
 - DAO 게시물 목록 조회 메서드 (selectAllBoard())
 - 보여주기 위한 뷰 페이지 (board/boardList.jsp)
 
--------------------------------------------------
12. 글 등록 기능							----- 완
 - boardList.jsp -> 링크
 - 기능을 수행할 명령어 (command = 'board_write_form')
 - 기능을 수행할 클래스 (BoardWriteFormAction.java)
 - 보여주기 위한 뷰 페이지 (board/boardWrite.jsp)
 
 - boardWrite.jsp -> submit 버튼
 - 기능을 수행할 명령어 (command = 'board_write')
 - 기능을 수행할 클래스 (BoardWriteAction.java)
 - DAO 게시물 목록 조회 메서드 (insertBoard())
 - 보여주기 위한 뷰 페이지 (board/boardList.jsp)
 
--------------------------------------------------
13. 글 상세보기 - 게시글 하나에 대해서			----- 완
 - boardList.jsp -> 제목 - 링크
 - 기능을 수행할 명령어 (command = 'board_write_view')
 - 기능을 수행할 클래스 (BoardViewAction.java)
 - DAO 조회수 증가 메서드(updateReadCount())
 - DAO 상세보기를 위한 조회 메서드(selectBoardByNum())
 - 보여주기 위한 뷰 페이지 (board/boardView.jsp)
 
--------------------------------------------------
14. 글 수정/삭제 -> 암호확인					----- 완
 - boardView.jsp -> 수정/삭제  -> 새창열기
 - 기능을 수행할 명령어 (command = 'board_check_pass_form')
 - 기능을 수행할 클래스 (BoardCheckPassFormAction.java)
 - 보여주기 위한 뷰 페이지 (board/boardCheckPass.jsp)
 
 - boardCheckPass.jsp -> submit버튼
 - 기능을 수행할 명령어 (command = 'board_check_pass')
 - 기능을 수행할 클래스 (BoardCheckPassAction.java)
 - DAO 암호를 체크하는 메서드(checkPassword(num, pass))
 - [실패] 보여주기 위한 뷰 페이지 (board/boardCheckPass.jsp)
 - [성공] 보여주기 위한 뷰 페이지 (board/checkSuccess.jsp)
 						   -> alert('암호 확인 성공');
 
--------------------------------------------------
15. 글 삭제 기능							----- 완
 - board/checkSuccess.jsp -> 부모창의 경로 이동 -> 새창닫기
 - 기능을 수행할 명령어 (command = 'board_delete')
 - 기능을 수행할 클래스 (BoardDeleteAction.java)
 - DAO 게시글 삭제 메서드(deleteBoard(num))
 - 보여주기 위한 뷰 페이지 (board/boardList.jsp)
 
--------------------------------------------------
16. 글 수정 기능							----- 완
 - board/checkSuccess.jsp -> 부모창의 경로 이동 -> 새창닫기
 - 기능을 수행할 명령어 (command = 'board_update_form')
 - 기능을 수행할 클래스 (BoardUpdateFormAction.java)
 - DAO 게시글 삭제 메서드(selectBoardByNum(num))
 - 보여주기 위한 뷰 페이지 (board/boardUpdate.jsp)
 
 board/boardUpdate.jsp -> submit버튼
 - 기능을 수행할 명령어 (command = 'board_update')
 - 기능을 수행할 클래스 (BoardUpdateeAction.java)
 - DAO 게시글 삭제 메서드(updateBoard(board))
 - 보여주기 위한 뷰 페이지 (board/boardList.jsp)
 
--------------------------------------------------
17. 페이징								----- 완

 - 페이지 : 한 화면에 보여질 게시물 목록 : 페이지 당 10개의 게시물
 - 섹션	: 여러 페이지의 그룹		   : 섹션 당 100개의 게시물(번호가 10개씩)
 
[1] : 특정 페이지에 보여질 게시글의 번호

	<< 1 2 3 4 5 6 7 8 9 10 >>	=> 1번 섹션(001 ~ 100)
	1번 페이지  1 ~ 10
	2번 페이지 11 ~ 20
	3번 페이지 21 ~ 30				=> 72번 페이지 : 711 ~ 720
	->> (페이지번호 -1) *10 +1 ~ (페이지번호) *10

[2] : 특정 섹션에 보여질 게시글의 번호

	<<  1  2  3  4  5  6  7  8  9 10 >>	=> 1번 섹션(001 ~ 100)
	<< 11 12 13 14 15 16 17 18 19 20 >>	=> 2번 섹션(101 ~ 200)
	<< 21 22 23 24 25 26 27 28 29 30 >>	=> 3번 섹션(201 ~ 300)
	<< 31 32 33 34 35 36 37 38 39 40 >>	=> 4번 섹션(301 ~ 400)
	
	->> (섹션번호 -1) *100 +1 ~ (섹션번호) *100
	
--------------------------------------------------
내가 확인하고자 하는 게시물이 몇 번 섹션에 몇 번째 페이지의 게시물인지 알 수 있다.
예 : 757번 게시물
 - 701 ~ 800	8번	섹션		<< 71 72 … 80 >>
 -  51 ~  60	6번 페이지		76[751 ~ 760]
 
섹션 번호와 페이지 번호를 알면 그 페이지의 게시글을 알 수 있다.

--------------------------------------------------
[3] : 섹션 번호와 페이지 번호로 어떻게 쿼리문을 만들 것인가

 1단계 :	전체 데이터 조회
 		SELECT * FROM board ORDER BY num DESC;
 		-> 오라클에는 특별히 관리되는 컬럼이 있다. => 행의 번호 : ROWNUM
 		
 2단계 :	1단계에서 조회된 데이터를 기준으로 행 번호를 추가한 새로운 쿼리문 생성
 		SELECT ROWNUM as nickNum, num, pass, name, email, title, content, readCount, writeDate
 		FROM (SELECT * FROM board ORDER BY num DESC);
 		-> 1) 정렬, 2) 행 번호 부여
 		
 3단계 :	2단계에서 매겨진 전체 행 번호를 기준으로 섹션과 페이지 번호를 이용해서 원하는 페이지에 해당하는 목록을 추출
 		SELECT * FROM(
		SELECT ROWNUM as nickNum, num, pass, name, email, title, content, readCount, writeDate
		FROM (SELECT * FROM board ORDER BY num DESC))
		WHERE nickNum BETWEEN (섹션번호-1) *100 + (페이지번호 -1) *10 +1 AND (섹션번호-1) *100 + (페이지번호) *10;
 		
--------------------------------------------------
 -> DAO 전체 게시글의 수를 알아오는 메서드
 -> DAO 섹션번호와 페이지번호를 통해서 현재 페이지 게시글 목록을 읽어오는 메서드
 -> BoardListServlet에 섹션번호와 페이지번호를 전달할 수 있게 소스를 변경
 -> list페이지의 내용을 수정