/* �������� */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* �������װԽñ۹�ȣ */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* ������ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	NOTI_CONTENT CLOB NOT NULL, /* �۳��� */
	NOTI_REGDATE DATE DEFAULT sysdate NOT NULL, /* ����� */
	NOTI_FILENAME VARCHAR2(100), /* ���ε����ϸ� */
	NOTI_FILESIZE LONG, /* ���ϻ����� */
	NOTI_ORFILENAME VARCHAR2(100), /* ������ ���ε� ���ϸ� */
	NOTI_DOWNCOUNT NUMBER default 0, /* �ٿ�� */
	NOTI_READCOUNT NUMBER default 0, /* ��ȸ�� */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL, /* ī�װ� */
	NOTI_MAIN NUMBER /* �������� */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		NOTI_NO ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			NOTI_NO
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_MEMBER_TO_notice
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
create sequence notice_seq
start with 1
increment by 1;

--select * from notice;

commit;


select * from member;