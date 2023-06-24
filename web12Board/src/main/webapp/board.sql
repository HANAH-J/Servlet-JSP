ALTER TABLE comments DROP CONSTRAINT fk_comments_board;
DROP TABLE comments;
DROP TABLE board;
DROP SEQUENCE board_seq;

CREATE TABLE board(
    num NUMBER PRIMARY KEY,
    pass VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    title VARCHAR2(100),
    content VARCHAR2(2000),
    readCount NUMBER DEFAULT 0,
    writeDate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE board_seq
NOCACHE;

INSERT INTO board
VALUES(board_seq.nextval, '1234', '고길동', 'ko@naver.com', '첫 방문', '반갑습니다.', 0, sysdate);
INSERT INTO board
VALUES(board_seq.nextval, '1234', '홍길동', 'hong@naver.com', '흔적을 남기다', '이제 이건 제 겁니다.', 0, sysdate);
INSERT INTO board
VALUES(board_seq.nextval, '1234', '고길동', 'ko@naver.com', '두 번째 방문', '건강하시죠?', 0, sysdate);
INSERT INTO board
VALUES(board_seq.nextval, '1234', '박길동', 'park@naver.com', '반갑습니다.', '평생을 함께하는 OO보험사', 0, sysdate);
INSERT INTO board
VALUES(board_seq.nextval, '1234', '김길동', 'kim@naver.com', '게시판 체크', '췍췍췍췍췍', 0, sysdate);

COMMIT;
SELECT * FROM board;