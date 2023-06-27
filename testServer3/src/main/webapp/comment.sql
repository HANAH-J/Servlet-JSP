DROP TABLE commentTbl;
DROP SEQUENCE commentTbl_seq;

CREATE TABLE commentTbl(
    commentCode NUMBER PRIMARY KEY,
    boardNum NUMBER NOT NULL, -- 외래키
    commentUser VARCHAR2(20) NOT NULL,
    commentComment VARCHAR2(1000) NOT NULL,
    commentPassword VARCHAR2(20) NOT NULL,
    commentRegDate DATE DEFAULT sysdate
);

CREATE SEQUENCE comment_seq
NOCACHE;

INSERT INTO commentTbl
VALUES(comment_seq.nextval, 1, '고길동', 'test1', '1234', sysdate);
INSERT INTO commentTbl
VALUES(comment_seq.nextval, 1, '박길동', 'test2', '1234', sysdate);
INSERT INTO commentTbl
VALUES(comment_seq.nextval, 1, '이길동', 'test3', '1234', sysdate);

COMMIT;

SELECT * FROM commentTbl;