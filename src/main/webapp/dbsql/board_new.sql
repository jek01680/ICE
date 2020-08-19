
DROP TABLE boardComment 
	CASCADE CONSTRAINTS;
	
DROP TABLE companyBoard_recommend 
	CASCADE CONSTRAINTS;

/* �系�Խ��� ��� */
CREATE TABLE boardComment (
	bComNo NUMBER NOT NULL, /* ��۹�ȣ */
	ComNo NUMBER, /* ��ۼ�����ȣ */
	boardNo NUMBER, /* �Խñ۹�ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ* */
	content CLOB, /* ���� */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
);

COMMENT ON TABLE boardComment IS '�系�Խ��� ���';

COMMENT ON COLUMN boardComment.bComNo IS '��۹�ȣ';

COMMENT ON COLUMN boardComment.ComNo IS '��ۼ�����ȣ';

COMMENT ON COLUMN boardComment.boardNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN boardComment.MEMNO IS '�����ȣ*';

COMMENT ON COLUMN boardComment.content IS '����';

COMMENT ON COLUMN boardComment.regdate IS '�ۼ���';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		bComNo ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			bComNo
		);

/* �系�Խ�����õ */
CREATE TABLE companyBoard_recommend (
	recNo NUMBER NOT NULL, /* ��õ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	boardNo NUMBER /* �Խñ۹�ȣ */
);

COMMENT ON TABLE companyBoard_recommend IS '�系�Խ�����õ';

COMMENT ON COLUMN companyBoard_recommend.recNo IS '��õ��ȣ';

COMMENT ON COLUMN companyBoard_recommend.MEMNO IS '�����ȣ';

COMMENT ON COLUMN companyBoard_recommend.boardNo IS '�Խñ۹�ȣ';

CREATE UNIQUE INDEX PK_companyBoard_recommend
	ON companyBoard_recommend (
		recNo ASC
	);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT PK_companyBoard_recommend
		PRIMARY KEY (
			recNo
		);



drop table board;
drop sequence board_seq;

/* �系�Խ��� */
CREATE TABLE board (
	boardNo NUMBER NOT NULL, /* �Խñ۹�ȣ */
	title VARCHAR2(100), /* ������ */
	memNo VARCHAR2(50), /* �����ȣ */
	nickname VARCHAR2(50), /* ���� */
	content CLOB, /* �۳��� */
	regdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	visited NUMBER DEFAULT 0, /* ��ȸ�� */
	recommend NUMBER DEFAULT 0, /* ��õ */
	category VARCHAR2(10), 
	isMain VARCHAR2(10) default 'N', /* ���ο��� */
	filePath VARCHAR2(300) /* ���ϰ�� */
);
/*
fileName VARCHAR2(300), 
saveFileName VARCHAR2(300), 
contentType VARCHAR2(300),
fileSize NUMBER
*/

create sequence board_seq
start with 1
increment by 1;

CREATE UNIQUE INDEX PK_board
	ON board (
		boardNo ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			boardNo
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_MEMBER_TO_boardComment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_board_TO_boardComment
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_MEMBER_TO_comBoard_recom
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_board_TO_comBoard_recom
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_MEMBER_TO_board
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);