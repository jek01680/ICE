/* �系�Խ��� ��� */
drop table boardComment;

CREATE TABLE boardComment (
	no NUMBER NOT NULL, /* ��۹�ȣ */
	boardNo NUMBER, /* �Խñ۹�ȣ */
	memNO VARCHAR2(50), /* �����ȣ* */
	nickname VARCHAR2(50) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
);

drop sequence boardComment_seq;

create sequence boardComment_seq
start with 1
increment by 1;

COMMENT ON TABLE boardComment IS '�系�Խ��� ���';

COMMENT ON COLUMN boardComment.no IS '��۹�ȣ';

COMMENT ON COLUMN boardComment.boardNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN boardComment.memNO IS '�����ȣ*';

COMMENT ON COLUMN boardComment.nickname IS '����';

COMMENT ON COLUMN boardComment.content IS '����';

COMMENT ON COLUMN boardComment.regdate IS '�ۼ���';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		no ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			no
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_MEMBER_TO_boardComment
		FOREIGN KEY (
			memNO
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