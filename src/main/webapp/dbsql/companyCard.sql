/* ����ī�� */
DROP TABLE companyCard 
	CASCADE CONSTRAINTS;

/* ���ϳ��� */
DROP TABLE companyCardFile 
	CASCADE CONSTRAINTS;

/* �����ڵ� */
DROP TABLE accountCode 
	CASCADE CONSTRAINTS;

/* ����ī�� */
CREATE TABLE companyCard (
    no NUMBER not null,
	cardNo VARCHAR2(100) , /* ����ī�� ��ȣ */
	company VARCHAR2(100), /* ī��� */
	MEMNO VARCHAR2(50), /* �����ȣ */
	accCode VARCHAR(20), /* �����ڵ� */
	price NUMBER, /* �ݾ� */
	usePlace VARCHAR2(100), /* ���ó */
	useDate VARCHAR2(50) , /* ��¥ */
	confirmDate VARCHAR2(50), /* ���� ���� */
	confirmTime VARCHAR2(50), /* ���� �ð� */
	confirmCode VARCHAR2(50), /* ���ι�ȣ */
	payType VARCHAR2(100), /* �������� */
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
	originalFileName VARCHAR(100), /* ���� �̸� */
	fileSize LONG, /* ���Ͽ뷮 */
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
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_accountCode_TO_comCard
		FOREIGN KEY (
			accCode
		)
		REFERENCES accountCode (
			accCode
		);

ALTER TABLE companyCard
	ADD
		CONSTRAINT FK_comCardFile_TO_comCard
		FOREIGN KEY (
			fileNo
		)
		REFERENCES companyCardFile (
			fileNo
		);
		
drop sequence companyCardFile_seq;
drop sequence companyCard_seq;

create sequence companyCardFile_seq
start with 1
increment by 1;

create sequence companyCard_seq
start with 1
increment by 1;


drop view comcard_mem_acc;

create view comcard_mem_acc
 as 
 select c.*, a.ACCTITLE ,m.NAME , m.POSCODE, m.POSNAME, m.DEPTCODE, m.DEPTNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO 
 join accountCode a
  on c.ACCCODE = a.ACCCODE;
 
select * from comcard_mem_acc;

create view comcard_mem
 as 
 select c.*,m.NAME , m.POSCODE, m.POSNAME, m.DEPTCODE, m.DEPTNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
select * from comcard_mem;
