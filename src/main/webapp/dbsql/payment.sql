/* �ڸ�Ʈ */
DROP TABLE payComment 
	CASCADE CONSTRAINTS;

/* ������� */
DROP TABLE docForm 
	CASCADE CONSTRAINTS;

/* ���繮�� */
DROP TABLE payment 
	CASCADE CONSTRAINTS;

/* ���缱 */
DROP TABLE paymentLine 
	CASCADE CONSTRAINTS;

/* ����÷������ */
DROP TABLE paymentFile 
	CASCADE CONSTRAINTS;

/* ����Ÿ�� */
DROP TABLE docType 
	CASCADE CONSTRAINTS;
	
/* �ڸ�Ʈ */
CREATE TABLE payComment (
	commentNo NUMBER NOT NULL, /* �ڸ�Ʈ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	content CLOB, /* ���� */
	docNo NUMBER, /* ������ȣ */
	regdate DATE DEFAULT sysdate, /* �ۼ��� */
	signName VARCHAR2(100), /*����*/
	originalSignName VARCHAR2(100) /*�������ϸ�*/
);

COMMENT ON TABLE payComment IS '�ڸ�Ʈ';

COMMENT ON COLUMN payComment.commentNo IS '�ڸ�Ʈ��ȣ';

COMMENT ON COLUMN payComment.MEMNO IS '�����ȣ';

COMMENT ON COLUMN payComment.content IS '����';

COMMENT ON COLUMN payComment.docNo IS '������ȣ';

COMMENT ON COLUMN payComment.regdate IS '�ۼ���';

CREATE UNIQUE INDEX PK_payComment
	ON payComment (
		commentNo ASC
	);

ALTER TABLE payComment
	ADD
		CONSTRAINT PK_payComment
		PRIMARY KEY (
			commentNo
		);

/* ������� */
CREATE TABLE docForm (
	formNo NUMBER NOT NULL, /* ��Ĺ�ȣ */
	formName VARCHAR2(50), /* ��ĸ� */
	content CLOB /* ���� */
);

COMMENT ON TABLE docForm IS '�������';

COMMENT ON COLUMN docForm.formNo IS '��Ĺ�ȣ';

COMMENT ON COLUMN docForm.formName IS '��ĸ�';

COMMENT ON COLUMN docForm.content IS '����';

CREATE UNIQUE INDEX PK_docForm
	ON docForm (
		formNo ASC
	);

ALTER TABLE docForm
	ADD
		CONSTRAINT PK_docForm
		PRIMARY KEY (
			formNo
		);

/* ���繮�� */
CREATE TABLE payment (
	docNo NUMBER NOT NULL, /* ������ȣ */
	MEMNO VARCHAR2(50), /* ���������ȣ */
	formNo NUMBER, /* ��Ĺ�ȣ */
	typeNo NUMBER, /* ����Ÿ�Թ�ȣ */
	title VARCHAR2(100), /* ���� */
	content CLOB, /* ���� */
	hasFile VARCHAR2(10), /* ���Ͽ��� */
	progress VARCHAR2(100), /* �����Ȳ */
	writeDate VARCHAR2(100) DEFAULT sysdate, /* ����� */
	keep NUMBER, /* �����Ⱓ */
	expiryDate DATE, /* ������ */
	imsy VARCHAR2(10) DEFAULT 'N' /* �ӽú��� */
);

COMMENT ON TABLE payment IS '���繮��';

COMMENT ON COLUMN payment.docNo IS '������ȣ';

COMMENT ON COLUMN payment.MEMNO IS '���������ȣ';

COMMENT ON COLUMN payment.formNo IS '��Ĺ�ȣ';

COMMENT ON COLUMN payment.typeNo IS '����Ÿ�Թ�ȣ';

COMMENT ON COLUMN payment.title IS '����';

COMMENT ON COLUMN payment.content IS '����';

COMMENT ON COLUMN payment.hasFile IS '���Ͽ���';

COMMENT ON COLUMN payment.progress IS '�����Ȳ';

COMMENT ON COLUMN payment.writeDate IS '�����';

COMMENT ON COLUMN payment.keep IS '�����Ⱓ';

COMMENT ON COLUMN payment.expiryDate IS '������';

COMMENT ON COLUMN payment.imsy IS '�ӽú���';

CREATE UNIQUE INDEX PK_payment
	ON payment (
		docNo ASC
	);

ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment
		PRIMARY KEY (
			docNo
		);

/* ���缱 */
CREATE TABLE paymentLine (
	payNo NUMBER NOT NULL, /* ����ǹ�ȣ */
	docNo NUMBER references payment(docNo), /* ������ȣ */
	payDate VARCHAR2(100), /* ���纯���� */
	MEMNO VARCHAR2(50), /* �޴»����ȣ */
	read VARCHAR2(10) DEFAULT 'N' /* �������� */
);

COMMENT ON TABLE paymentLine IS '���缱';

COMMENT ON COLUMN paymentLine.payNo IS '����ǹ�ȣ';

COMMENT ON COLUMN paymentLine.docNo IS '������ȣ';

COMMENT ON COLUMN paymentLine.payDate IS '���纯����';

COMMENT ON COLUMN paymentLine.MEMNO IS '�޴»����ȣ';

COMMENT ON COLUMN paymentLine.read IS '��������';

CREATE UNIQUE INDEX PK_paymentLine
	ON paymentLine (
		payNo ASC
	);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT PK_paymentLine
		PRIMARY KEY (
			payNo
		);

/* ����÷������ */
CREATE TABLE paymentFile (
	fileNo NUMBER NOT NULL, /* ���Ϲ�ȣ */
	fileName VARCHAR2(100), /* �����̸� */
	originalFileName VARCHAR2(100), /* �����̸� */
	fileSize LONG, /* ���Ͽ뷮 */
	docNo NUMBER /* ������ȣ */
);

COMMENT ON TABLE paymentFile IS '����÷������';

COMMENT ON COLUMN paymentFile.fileNo IS '���Ϲ�ȣ';

COMMENT ON COLUMN paymentFile.fileName IS '�����̸�';

COMMENT ON COLUMN paymentFile.originalFileName IS '�����̸�';

COMMENT ON COLUMN paymentFile.fileSize IS '���Ͽ뷮';

COMMENT ON COLUMN paymentFile.docNo IS '������ȣ';

CREATE UNIQUE INDEX PK_paymentFile
	ON paymentFile (
		fileNo ASC
	);

ALTER TABLE paymentFile
	ADD
		CONSTRAINT PK_paymentFile
		PRIMARY KEY (
			fileNo
		);

/* ����Ÿ�� */
CREATE TABLE docType (
	typeNo NUMBER NOT NULL, /* ����Ÿ�Թ�ȣ */
	typeName VARCHAR2(50) /* Ÿ�Ը� */
);

COMMENT ON TABLE docType IS '����Ÿ��';

COMMENT ON COLUMN docType.typeNo IS '����Ÿ�Թ�ȣ';

COMMENT ON COLUMN docType.typeName IS 'Ÿ�Ը�';

CREATE UNIQUE INDEX PK_docType
	ON docType (
		typeNo ASC
	);

ALTER TABLE docType
	ADD
		CONSTRAINT PK_docType
		PRIMARY KEY (
			typeNo
		);
		
-----------------------������
--------------------���繮��
drop sequence doc_seq;
create sequence doc_seq
start with 11023
increment by 1
nocache;
--------------------�������
drop sequence docform_seq;
create sequence docform_seq
start with 23400
increment by 1
nocache;
--------------------���缱
drop sequence payline_seq;
create sequence payline_seq
start with 1
increment by 1
nocache;
--------------------���ε�����
drop sequence payfile_seq;
create sequence payfile_seq
start with 1
increment by 1
nocache;
--------------------�ڸ�Ʈ
drop sequence com_seq;
create sequence com_seq
start with 1
increment by 1
nocache;
-----------------------����Ÿ��
insert into doctype(typeNo,typeName)
values(1,'ǰ�Ǽ�');
insert into doctype(typeNo,typeName)
values(2,'��ȼ�');
insert into doctype(typeNo,typeName)
values(3,'����������');
insert into doctype(typeNo,typeName)
values(4,'����');
insert into doctype(typeNo,typeName)
values(5,'��ٺ���');

select * from doctype;
------------------------��
create or replace view paymentView
as
select p.*,d.typeName,m.name, m.DEPTNAME
from (payment p join doctype d
on p.typeNo = d.typeNo)
join mypage_mem m
on p.memNo = m.memNo;

create or replace view chkdocView
as
select p.*,m.NAME,m.posName,m.poscode,m.deptName
from paymentline p join mypage_mem m
on p.MEMNO = m.MEMNO;

create or replace view docView
as
select p.*,m.NAME,m.posName,m.poscode,m.deptName,c.content, c.REGDATE, c.SIGNNAME
from (paymentline p join mypage_mem m
on p.MEMNO = m.MEMNO) join paycomment c
on p.MEMNO = c.MEMNO;

create or replace view paylistView
as
select p.*, l.MEMNO as gmemNo,l.PAYDATE, l.PAYNO,l.READ,d.TYPENAME,m.NAME
from ((payment p join paymentline l
on p.DOCNO = l.DOCNO)join doctype d
on p.TYPENO = d.TYPENO)join member m
on p.MEMNO = m.MEMNO;

create or replace view commentView
as
select p.*,m.NAME from paycomment p
join member m
on p.MEMNO = m.MEMNO;

select * from paymentfile;
select * from payment;
select * from paymentline;

select * from paylistview;
select * from docview;
select * from chkdocview;
select * from paymentview;

select * from position;
select * from department;
select * from member;
select * from payComment;

commit;