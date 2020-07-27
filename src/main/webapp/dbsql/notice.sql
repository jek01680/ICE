/* �������� */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* �������װԽñ۹�ȣ */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* ������ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	NOTI_CONTENT CLOB NOT NULL, /* �۳��� */
	NOTI_REGDATE DATE NOT NULL, /* ����� */
	NOTI_FILENAME VARCHAR2(100), /* ���ε����ϸ� */
	NOTI_FILESIZE NUMBER, /* ���ϻ����� */
	NOTI_ORFILENAME VARCHAR2(100), /* ������ ���ε� ���ϸ� */
	NOTI_DOWNCOUNT NUMBER, /* �ٿ�� */
	NOTI_READCOUNT NUMBER, /* ��ȸ�� */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL, /* ī�װ� */
	NOTI_MAIN NUMBER, /* ���ο��� */
	newImgTerm  NUMBER /* 24�ð�Ȯ�� */
);

COMMENT ON TABLE notice IS '��������';

COMMENT ON COLUMN notice.NOTI_NO IS '�������װԽñ۹�ȣ';

COMMENT ON COLUMN notice.NOTI_TITLE IS '������';

COMMENT ON COLUMN notice.MEMNO IS '�����ȣ';

COMMENT ON COLUMN notice.NOTI_CONTENT IS '�۳���';

COMMENT ON COLUMN notice.NOTI_REGDATE IS '�����';

COMMENT ON COLUMN notice.NOTI_FILENAME IS '���ε����ϸ�';

COMMENT ON COLUMN notice.NOTI_FILESIZE IS '���ϻ�����';

COMMENT ON COLUMN notice.NOTI_ORFILENAME IS '������ ���ε� ���ϸ�';

COMMENT ON COLUMN notice.NOTI_DOWNCOUNT IS '�ٿ��';

COMMENT ON COLUMN notice.NOTI_READCOUNT IS '��ȸ��';

COMMENT ON COLUMN notice.NOTI_CATEGORY IS 'ī�װ�';

COMMENT ON COLUMN notice.NOTI_MAIN IS '���ο���';

COMMENT ON COLUMN notice.newImgTerm  IS '24�ð�Ȯ��';

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
		
