/* ����ī�� */
CREATE TABLE companyCard (
	no NUMBER NOT NULL, /* ����ī�� DB������ȣ */
	cardNo VARCHAR2(100) NOT NULL, /* ����ī�� ��ȣ */
	memNo VARCHAR2(50), /* �����ȣ */
	accCode VARCHAR(20), /* �����ڵ� */
	price NUMBER, /* �ݾ� */
	usePlace VARCHAR2(100), /* ���ó */
	useDate varchar2(30) , /* ��¥ */
	fileNo NUMBER /* ���ϼ��� */
);

CREATE UNIQUE INDEX PK_companyCard
	ON companyCard (
		no ASC
	);

ALTER TABLE companyCard
	ADD
		CONSTRAINT PK_companyCard
		PRIMARY KEY (
			no
		);

/* ���ϳ��� */
CREATE TABLE companyCardFile (
	fileNo NUMBER NOT NULL, /* ���ϼ��� */
	fileName VARCHAR2(100), /* �����̸� */
	uploadDate DATE DEFAULT sysdate, /* ���Ͼ��ε� ��¥ */
	isDelete VARCHAR2(10) /* ���� ���� ���� */
);

CREATE UNIQUE INDEX PK_companyCardFile
	ON companyCardFile (
		fileNo ASC
	);

ALTER TABLE companyCardFile
	ADD
		CONSTRAINT PK_companyCardFile
		PRIMARY KEY (
			fileNo
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
			memNo
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

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_companyCardFile_TO_companyCard
		FOREIGN KEY (
			fileNo
		)
		REFERENCES companyCardFile (
			fileNo
		);
		
		
create sequence companyCard_seq
start with 1
increment by 1;


 create view comcard_mem
 as 
 select c.*, m.NAME , m.POSNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 select * from comcard_mem;