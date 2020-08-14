/* �޴»�� */
CREATE TABLE messageRec (
	noteNo NUMBER NOT NULL, /* ����������ȣ */
	recieveMemNo VARCHAR2(50) NOT NULL, /* �޴»����ȣ */
	no NUMBER NOT NULL, /* ������ȣ */
	flagCondition VARCHAR2(50)  default 0/* �������� ��������: 0 ���� : 1 ���� : 2 ���� : 3 */
);

create sequence messageRec_seq
start with 1
increment by 1;

COMMENT ON TABLE message_rec IS '�޴»��';

COMMENT ON COLUMN message_rec.noteNo IS '����������ȣ';

COMMENT ON COLUMN message_rec.recieveMemNo IS '�޴»����ȣ';

COMMENT ON COLUMN message_rec.no IS '������ȣ';

COMMENT ON COLUMN message_rec.flagCondition IS '��������';

CREATE UNIQUE INDEX PK_message_rec
	ON message_rec (
		noteNo ASC
	);

ALTER TABLE message_rec
	ADD
		CONSTRAINT PK_message_rec
		PRIMARY KEY (
			noteNo
		);

/* ������ */
CREATE TABLE message (
	no NUMBER NOT NULL, /* ������ȣ */
	flagCondition VARCHAR2(50) DEFAULT 0 NOT NULL, /* �������� */
	title VARCHAR2(200), /* �������� */
	content CLOB, /* �������� */
	regdate DATE DEFAULT sysdate, /* ��¥ */
	sendMemNo VARCHAR2(50) /* ���������ȣ */
);

create sequence message_seq
start with 1
increment by 1;

COMMENT ON TABLE message IS '������';

COMMENT ON COLUMN message.no IS '������ȣ';

COMMENT ON COLUMN message.flagCondition IS '��������';

COMMENT ON COLUMN message.title IS '��������';

COMMENT ON COLUMN message.content IS '��������';

COMMENT ON COLUMN message.regdate IS '��¥';

COMMENT ON COLUMN message.sendMemNo IS '���������ȣ';

CREATE UNIQUE INDEX PK_message
	ON message (
		no ASC,
		flagCondition ASC
	);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			no,
			flagCondition
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MEMBER_TO_message_rec2
		FOREIGN KEY (
			recieveMemNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_message_TO_message_rec
		FOREIGN KEY (
			no,
			flagCondition
		)
		REFERENCES message (
			no,
			flagCondition
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