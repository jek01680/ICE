drop table notice;

/* �������� */
CREATE TABLE notice (
	noticeNo NUMBER NOT NULL, /* �������װԽñ۹�ȣ */
	title VARCHAR2(100) NOT NULL, /* ������ */
	memNo VARCHAR2(50), /* �����ȣ */
	content CLOB NOT NULL, /* �۳��� */
	regdate DATE DEFAULT sysdate NOT NULL, /* ����� */
	fileName VARCHAR2(100) DEFAULT 0, /* ���ε����ϸ� */
	fileSize LONG DEFAULT 0, /* ���ϻ����� */
	orFileName VARCHAR2(100) DEFAULT 0, /* ������ ���ε� ���ϸ� */
	downcount NUMBER DEFAULT 0, /* �ٿ�� */
	readcount NUMBER DEFAULT 0, /* ��ȸ�� */
	category VARCHAR2(100) NOT NULL, /* ī�װ� */
	main VARCHAR2(5) DEFAULT 'N', /* ���ο��� */
	newImgTerm VARCHAR2(200) DEFAULT 0 /* 24�ð� */
);

drop sequence notice_seq;

create sequence notice_seq
start with 1
increment by 1;

COMMENT ON TABLE notice IS '��������';

COMMENT ON COLUMN notice.noticeNo IS '�������װԽñ۹�ȣ';

COMMENT ON COLUMN notice.title IS '������';

COMMENT ON COLUMN notice.memNo IS '�����ȣ';

COMMENT ON COLUMN notice.content IS '�۳���';

COMMENT ON COLUMN notice.regdate IS '�����';

COMMENT ON COLUMN notice.fileName IS '���ε����ϸ�';

COMMENT ON COLUMN notice.fileSize IS '���ϻ�����';

COMMENT ON COLUMN notice.orFileName IS '������ ���ε� ���ϸ�';

COMMENT ON COLUMN notice.downcount IS '�ٿ��';

COMMENT ON COLUMN notice.readcount IS '��ȸ��';

COMMENT ON COLUMN notice.category IS 'ī�װ�';

COMMENT ON COLUMN notice.main IS '���ο���';

COMMENT ON COLUMN notice.newImgTerm IS '24�ð�';

CREATE UNIQUE INDEX PK_notice
	ON notice (
		noticeNo ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			noticeNo
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_MEMBER_TO_notice
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);