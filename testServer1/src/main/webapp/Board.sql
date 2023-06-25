CREATE TABLE boardTbl(
    boardNum NUMBER PRIMARY KEY,
    boardTitle VARCHAR2(200) NOT NULL,
    boardContent VARCHAR2(2000) NOT NULL,
    boardWriter VARCHAR2(20) NOT NULL,
    boardCount NUMBER DEFAULT 0,
    boardRegDate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE board_seq
NOCACHE;

INSERT INTO boardTbl
VALUES(board_seq.nextval, '첫번째 글', '안녕하세요', '홍길동', 0, SYSDATE);
INSERT INTO boardTbl
VALUES(board_seq.nextval, '두번째 글', '반갑습니다.', '박길동', 0, SYSDATE);
INSERT INTO boardTbl
VALUES(board_seq.nextval, '세번째 글', '식사는 하셨나요?', '김길동', 0, SYSDATE);
INSERT INTO boardTbl
VALUES(board_seq.nextval, '네번째 글', '고생했어요', '이길동', 0, SYSDATE);
INSERT INTO boardTbl
VALUES(board_seq.nextval, '다섯번째 글', '내일 봐요.', '최길동', 0, SYSDATE);

COMMIT;

SELECT * FROM boardTbl;