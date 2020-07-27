/* ����ī�� */
CREATE TABLE companyCard (
	cardNo VARCHAR2(100) NOT NULL, /* ����ī�� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	accCode VARCHAR(20), /* �����ڵ� */
	price NUMBER, /* �ݾ� */
	usePlace VARCHAR2(100), /* ���ó */
	useDate DATE DEFAULT sysdate /* ��¥ */
);



/* ���ϳ��� */
CREATE TABLE companyCardFile (
	no NUMBER NOT NULL, /* ���ϼ��� */
	fileName VARCHAR2(100), /* �����̸� */
	uploadDate DATE DEFAULT sysdate, /* ���Ͼ��ε� ��¥ */
	isDelete VARCHAR2(10) /* ���� ���� ���� */
);

CREATE UNIQUE INDEX PK_companyCardFile
	ON companyCardFile (
		no ASC
	);

ALTER TABLE companyCardFile
	ADD
		CONSTRAINT PK_companyCardFile
		PRIMARY KEY (
			no
		);

/* �����ڵ� */
CREATE TABLE accountCode (
	accCode VARCHAR(20) NOT NULL, /* �ڵ� */
	accGroup VARCHAR2(50), /* �з� */
	accTitle VARCHAR2(50), /* �������� */
	accContent CLOB /* ���� */
);

CREATE UNIQUE INDEX PK_accountCode
	ON accountCode (
		accCode ASC
	);

ALTER TABLE accountCode
	ADD
		CONSTRAINT PK_accountCode
		PRIMARY KEY (
			accCode
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_MEMBER_TO_companyCard
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_accountCode_TO_companyCard
		FOREIGN KEY (
			accCode
		)
		REFERENCES accountCode (
			accCode
		);
		
		--drop table companyCard cascade constraints;