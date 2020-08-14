/*
drop table boardComment;
drop table companyBoard_recommend;
drop table board;
drop sequence board_seq;
*/

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

COMMENT ON TABLE board IS '�系�Խ���';

COMMENT ON COLUMN board.boardNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN board.title IS '������';

COMMENT ON COLUMN board.MEMNO IS '�����ȣ';

COMMENT ON COLUMN board.content IS '�۳���';

COMMENT ON COLUMN board.regdate IS '�����';

COMMENT ON COLUMN board.visited IS '��ȸ��';

COMMENT ON COLUMN board.recommend IS '��õ';

COMMENT ON COLUMN board.isMain IS '���ο���';

COMMENT ON COLUMN board.fileName IS '�̹����̸�';

COMMENT ON COLUMN board.saveFileName IS '�̹��������̸�';

COMMENT ON COLUMN board.contentType IS '�̹���Ÿ��';

COMMENT ON COLUMN board.filePath IS '���ϰ��';

COMMENT ON COLUMN board.fileSize IS '���ϻ�����';

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
		CONSTRAINT FK_MEMBER_TO_companyBoard_recommend
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_board_TO_companyBoard_recommend
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