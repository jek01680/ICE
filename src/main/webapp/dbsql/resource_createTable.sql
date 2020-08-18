drop table resreserve cascade constraints;
drop table resmanage cascade constraints;
DROP TABLE resKind CASCADE CONSTRAINTS;

/* �ڿ����� */
CREATE TABLE resKind (
	rkNo NUMBER NOT NULL, /* �ڿ�������ȣ */
	rkKind VARCHAR2(45) NOT NULL /* �ڿ����� */
);

ALTER TABLE resKind
	ADD
		CONSTRAINT PK_resKind
		PRIMARY KEY (
			rkNo
		);

/* �ڿ����� */
CREATE TABLE resReserve (
	rvNo NUMBER NOT NULL, /* �ڿ������ȣ */
	resNo NUMBER NOT NULL, /* �ڿ���ȣ */
	rvStart DATE NOT NULL, /* �ڿ����� ���۽ð� */
	rvEnd DATE NOT NULL, /* �ڿ����� ���ð� */
	rvReason VARCHAR2(1000), /* �ڿ����� ���� */
	rvCantReason VARCHAR2(1000), /* �ڿ����� ���� ���� */
	rvState VARCHAR2(10) default 'wait', /* �ڿ����ο��� */
	rvRegdate DATE DEFAULT sysdate, /* �ڿ������� */
	memNo VARCHAR2(50) NOT NULL /* �����ȣ */
);

ALTER TABLE resReserve
	ADD
		CONSTRAINT PK_resReserve
		PRIMARY KEY (
			rvNo
		);

/* �ڿ����� */
CREATE TABLE resManage (
	resNo NUMBER NOT NULL, /* �ڿ���ȣ */
	resName VARCHAR2(50) NOT NULL, /* �ڿ��� */
	resImage VARCHAR2(300), /* �̹������ϸ� */
	resSize NUMBER, /* ���ϻ����� */
	resOriginalImage VARCHAR2(300), /* �������̹������ϸ� */
	rkNo NUMBER, /* �ڿ�������ȣ */
	resLocation VARCHAR2(200), /* ��� */
	resSubdesc VARCHAR2(2000), /* �ڿ��ΰ����� */
	resColor VARCHAR2(45) default 'skyblue', /* �޷¿� ��Ÿ�� �� */
	resRegdate DATE DEFAULT sysdate, /* �ڿ������ */
	resState VARCHAR2(30) DEFAULT 'yes', /* �ڿ����� */
	resIsDel VARCHAR2(10) /* �ڿ��������� */
);

ALTER TABLE resManage
	ADD
		CONSTRAINT PK_resManage
		PRIMARY KEY (
			resNo
		);


ALTER TABLE resReserve
	ADD
		CONSTRAINT FK_MEMBER_TO_resReserve
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE resReserve
	ADD
		CONSTRAINT FK_resManage_TO_resReserve
		FOREIGN KEY (
			resNo
		)
		REFERENCES resManage (
			resNo
		);
