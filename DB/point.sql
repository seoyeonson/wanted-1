/* ----------------- POINT TABLE ----------------- */
CREATE SEQUENCE SEQ_POINT;

CREATE TABLE TBL_POINT
(
	POINT_NUMBER NUMBER PRIMARY KEY,
	MEMBER_NUMBER NUMBER,
	POINT_PRICE NUMBER,
	POINT_CONTENT VARCHAR2(200),
	POINT_DATE DATE DEFAULT SYSDATE,
	POINT_END_DATE DATE DEFAULT ADD_MONTHS(SYSDATE, 1),
	CONSTRAINT FK_POINT FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES TBL_MEMBER (MEMBER_NUMBER)
);

SELECT * FROM TBL_POINT;
DROP TABLE TBL_POINT;

INSERT INTO TBL_POINT
VALUES(SEQ_POINT.NEXTVAL, 1, 2000, '[��������] 2000�� ����!', SYSDATE, ADD_MONTHS(SYSDATE, 1));
INSERT INTO TBL_POINT
VALUES(SEQ_POINT.NEXTVAL, 1, 3000, '[��������] 3000�� ����!', SYSDATE, ADD_MONTHS(SYSDATE, 1));
INSERT INTO TBL_POINT
VALUES(SEQ_POINT.NEXTVAL, 1, 200, '[��������] 200�� ����!', SYSDATE, ADD_MONTHS(SYSDATE, 1));
INSERT INTO TBL_POINT
VALUES(SEQ_POINT.NEXTVAL, 3, 2000, '[��������] 2000�� ����!', SYSDATE, ADD_MONTHS(SYSDATE, 1));
/* ----------------------------------------------------- */