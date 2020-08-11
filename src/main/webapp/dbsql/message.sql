/* �޴»�� */
DROP TABLE message_rec 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE message 
	CASCADE CONSTRAINTS;

/* �޴»�� */
CREATE TABLE message_rec (
	no NUMBER NOT NULL, /* ����������ȣ */
	recMemNo VARCHAR2(50) NOT NULL, /* �޴»����ȣ */
	msgno NUMBER NOT NULL /* ������ȣ */
);

CREATE UNIQUE INDEX PK_message_rec
	ON message_rec (
		no ASC
	);

ALTER TABLE message_rec
	ADD
		CONSTRAINT PK_message_rec
		PRIMARY KEY (
			no
		);

/* ������ */
CREATE TABLE message (
	msgno NUMBER NOT NULL, /* ������ȣ */
	msgstatus VARCHAR2(50) DEFAULT 0 NOT NULL, /* �������� */
	msgcontent CLOB, /* �������� */
	msgregdate DATE DEFAULT sysdate, /* ��¥ */
	sendMemNo VARCHAR2(50) /* ���������ȣ */
);

CREATE UNIQUE INDEX PK_message
	ON message (
		msgno ASC
	);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			msgno
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MEMBER_TO_message_rec2
		FOREIGN KEY (
			recMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_message_TO_message_rec
		FOREIGN KEY (
			msgno
		)
		REFERENCES message (
			msgno
		);

ALTER TABLE message
	ADD
		CONSTRAINT FK_MEMBER_TO_message
		FOREIGN KEY (
			sendMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);