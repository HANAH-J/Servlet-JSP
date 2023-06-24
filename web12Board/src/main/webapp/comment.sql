-- commentTbl 테이블 참조키(O) 수정 / 삭제 / 생성
ALTER TABLE commentTbl DROP CONSTRAINT fk_commentTbl_boardTbl;
DROP TABLE commentTbl;
CREATE TABLE commentTbl(
    c_code NUMBER PRIMARY KEY,
    boardCode NUMBER NOT NULL,
    c_user VARCHAR2(20) NOT NULL,
    c_comment VARCHAR2(1000) NOT NULL,
    c_password VARCHAR2(10) NOT NULL,
    c_regDate DATE DEFAULT SYSDATE,
    CONSTRAINT fk_commentTbl_boardTbl FOREIGN KEY(boardCode) REFERENCES boardTbl(boardNum)
);

-- commentTbl 테이블 참조키(X)
CREATE TABLE commentTbl(
    c_code NUMBER PRIMARY KEY,
    boardCode NUMBER NOT NULL,
    c_user VARCHAR2(20) NOT NULL,
    c_comment VARCHAR2(1000) NOT NULL,
    c_password VARCHAR2(10) NOT NULL,
    c_regDate DATE DEFAULT SYSDATE
);

-- commentTbl_seq 시퀀스 삭제 / 생성
DROP SEQUENCE commentTbl_seq;
CREATE SEQUENCE commentTbl_seq
NOCACHE;

-- commentTble 샘플 데이터 삽입
INSERT INTO commentTbl
VALUES(commentTbl_seq.nextval, 1, '홍길동', 'ㅋㅋㅋㅋㅋ', '1234', SYSDATE);
INSERT INTO commentTbl
VALUES(commentTbl_seq.nextval, 1, '최길동', 'ㅋㅋ웃기네', '1234', SYSDATE);

-- 커밋
COMMIT;

-- 조회
SELECT * FROM commentTbl;