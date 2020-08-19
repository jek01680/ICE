/* ����ī�� */
CREATE TABLE companyCard (
	cardNo VARCHAR2(100) NOT NULL, /* ����ī�� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	accCode VARCHAR(20), /* �����ڵ� */
	price NUMBER, /* �ݾ� */
	usePlace VARCHAR2(100), /* ���ó */
	useDate DATE DEFAULT sysdate /* ��¥ */
);

COMMENT ON TABLE companyCard IS '����ī��';

COMMENT ON COLUMN companyCard.cardNo IS '����ī�� ��ȣ';

COMMENT ON COLUMN companyCard.MEMNO IS '�����ȣ';

COMMENT ON COLUMN companyCard.accCode IS '�����ڵ�';

COMMENT ON COLUMN companyCard.price IS '�ݾ�';

COMMENT ON COLUMN companyCard.usePlace IS '���ó';

COMMENT ON COLUMN companyCard.useDate IS '��¥';

CREATE UNIQUE INDEX PK_companyCard
	ON companyCard (
		cardNo ASC
	);

ALTER TABLE companyCard
	ADD
		CONSTRAINT PK_companyCard
		PRIMARY KEY (
			cardNo
		);

/* ���ϳ��� */
CREATE TABLE companyCardFile (
	no NUMBER NOT NULL, /* ���ϼ��� */
	fileName VARCHAR2(100), /* �����̸� */
	uploadDate DATE DEFAULT sysdate, /* ���Ͼ��ε� ��¥ */
	isDelete VARCHAR2(10) /* ���� ���� ���� */
);

COMMENT ON TABLE companyCardFile IS '���ϳ���';

COMMENT ON COLUMN companyCardFile.no IS '���ϼ���';

COMMENT ON COLUMN companyCardFile.fileName IS '�����̸�';

COMMENT ON COLUMN companyCardFile.uploadDate IS '���Ͼ��ε� ��¥';

COMMENT ON COLUMN companyCardFile.isDelete IS '���� ���� ����';

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

/* ���� */
CREATE TABLE position (
	posCode NUMBER NOT NULL, /* �����ڵ� */
	posName VARCHAR2(100) /* ���޸� */
);

COMMENT ON TABLE position IS '����';

COMMENT ON COLUMN position.posCode IS '�����ڵ�';

COMMENT ON COLUMN position.posName IS '���޸�';

CREATE UNIQUE INDEX PK_position
	ON position (
		posCode ASC
	);

ALTER TABLE position
	ADD
		CONSTRAINT PK_position
		PRIMARY KEY (
			posCode
		);

/* �μ� */
CREATE TABLE department (
	deptCode NUMBER NOT NULL, /* �μ��ڵ� */
	deptName VARCHAR2(100) /* �μ��� */
);

COMMENT ON TABLE department IS '�μ�';

COMMENT ON COLUMN department.deptCode IS '�μ��ڵ�';

COMMENT ON COLUMN department.deptName IS '�μ���';

CREATE UNIQUE INDEX PK_department
	ON department (
		deptCode ASC
	);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			deptCode
		);

/* ��� */
CREATE TABLE MEMBER (
	MEMNO VARCHAR2(50) NOT NULL, /* �����ȣ */
	NAME VARCHAR2(50), /* ����� */
	PWD VARCHAR2(50), /* ��й�ȣ */
	hp1 VARCHAR2(20), /* ��ȭ��ȣ1 */
	hp2 VARCHAR2(20), /* ��ȭ��ȣ2 */
	hp3 VARCHAR2(20), /* ��ȭ��ȣ3 */
	email1 VARCHAR2(50), /* �̸���1 */
	email2 VARCHAR2(50), /* �̸���2 */
	ssn1 VARCHAR2(50), /* �ֹι�ȣ1 */
	ssn2 VARCHAR2(50), /* �ֹι�ȣ2 */
	zipcode VARCHAR2(50), /* �����ȣ */
	addr VARCHAR2(100), /* �ּ� */
	addrDetail VARCHAR2(100), /* ���ּ� */
	salary NUMBER, /* ���� */
	hiredate DATE, /* �Ի��� */
	firedate DATE, /* ����� */
	gender VARCHAR2(10), /* ���� */
	profileURL VARCHAR2(100), /* ���� */
	originalFileName VARCHAR2(100), /* �������������̸� */
	fileSize LONG, /* ���ϻ����� */
	deptCode NUMBER, /* �μ��ڵ� */
	posCode NUMBER /* �����ڵ� */
);

COMMENT ON TABLE MEMBER IS '���';

COMMENT ON COLUMN MEMBER.MEMNO IS '�����ȣ';

COMMENT ON COLUMN MEMBER.NAME IS '�����';

COMMENT ON COLUMN MEMBER.PWD IS '��й�ȣ';

COMMENT ON COLUMN MEMBER.hp1 IS '��ȭ��ȣ1';

COMMENT ON COLUMN MEMBER.hp2 IS '��ȭ��ȣ2';

COMMENT ON COLUMN MEMBER.hp3 IS '��ȭ��ȣ3';

COMMENT ON COLUMN MEMBER.email1 IS '�̸���1';

COMMENT ON COLUMN MEMBER.email2 IS '�̸���2';

COMMENT ON COLUMN MEMBER.ssn1 IS '�ֹι�ȣ1';

COMMENT ON COLUMN MEMBER.ssn2 IS '�ֹι�ȣ2';

COMMENT ON COLUMN MEMBER.zipcode IS '�����ȣ';

COMMENT ON COLUMN MEMBER.addr IS '�ּ�';

COMMENT ON COLUMN MEMBER.addrDetail IS '���ּ�';

COMMENT ON COLUMN MEMBER.salary IS '����';

COMMENT ON COLUMN MEMBER.hiredate IS '�Ի���';

COMMENT ON COLUMN MEMBER.firedate IS '�����';

COMMENT ON COLUMN MEMBER.gender IS '����';

COMMENT ON COLUMN MEMBER.profileURL IS '����';

COMMENT ON COLUMN MEMBER.originalFileName IS '�������������̸�';

COMMENT ON COLUMN MEMBER.fileSize IS '���ϻ�����';

COMMENT ON COLUMN MEMBER.deptCode IS '�μ��ڵ�';

COMMENT ON COLUMN MEMBER.posCode IS '�����ڵ�';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		MEMNO ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			MEMNO
		);

/* �ڸ�Ʈ */
CREATE TABLE payComment (
	commentNo NUMBER NOT NULL, /* �ڸ�Ʈ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	content CLOB, /* ���� */
	docNo NUMBER, /* ������ȣ */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
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
	docNo NUMBER NOT NULL, /* ������ȣ */
	payDate VARCHAR2(100) DEFAULT sysdate, /* ���纯���� */
	MEMNO VARCHAR2(50), /* �޴»����ȣ */
	read VARCHAR2(10) /* �������� */
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

/* �系�Խ��� ��� */
CREATE TABLE boardComment (
	comNo NUMBER NOT NULL, /* ��۹�ȣ */
	boardNo NUMBER, /* �Խñ۹�ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ* */
	content CLOB, /* ���� */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
);

COMMENT ON TABLE boardComment IS '�系�Խ��� ���';

COMMENT ON COLUMN boardComment.comNo IS '��۹�ȣ';

COMMENT ON COLUMN boardComment.boardNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN boardComment.MEMNO IS '�����ȣ*';

COMMENT ON COLUMN boardComment.content IS '����';

COMMENT ON COLUMN boardComment.regdate IS '�ۼ���';

CREATE UNIQUE INDEX PK_boardComment
	ON boardComment (
		comNo ASC
	);

ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment
		PRIMARY KEY (
			comNo
		);

/* �޴»�� */
CREATE TABLE message_rec (
	noteNo NUMBER NOT NULL, /* ����������ȣ */
	READ_FLAG VARCHAR2(50) NOT NULL, /* �б⿩�� */
	MEMNO VARCHAR2(50) NOT NULL, /* ���������ȣ */
	DEL_FLAG VARCHAR2(10), /* �������� */
	MSG_NO NUMBER NOT NULL /* ������ȣ */
);

COMMENT ON TABLE message_rec IS '�޴»��';

COMMENT ON COLUMN message_rec.noteNo IS '����������ȣ';

COMMENT ON COLUMN message_rec.READ_FLAG IS '�б⿩��';

COMMENT ON COLUMN message_rec.MEMNO IS '���������ȣ';

COMMENT ON COLUMN message_rec.DEL_FLAG IS '��������';

COMMENT ON COLUMN message_rec.MSG_NO IS '������ȣ';

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

/* �������� */
CREATE TABLE notice (
	NOTI_NO NUMBER NOT NULL, /* �������װԽñ۹�ȣ */
	NOTI_TITLE VARCHAR2(100) NOT NULL, /* ������ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	NOTI_CONTENT CLOB NOT NULL, /* �۳��� */
	NOTI_REGDATE DATE NOT NULL, /* ����� */
	NOTI_FILENAME VARCHAR2(100), /* ���ε����ϸ� */
	NOTI_FILESIZE LONG, /* ���ϻ����� */
	NOTI_ORFILENAME VARCHAR2(100), /* ������ ���ε� ���ϸ� */
	NOTI_DOWNCOUNT NUMBER, /* �ٿ�� */
	NOTI_READCOUNT NUMBER, /* ��ȸ�� */
	NOTI_CATEGORY VARCHAR2(100) NOT NULL /* ī�װ� */
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

/* �系�Խ�����õ */
CREATE TABLE companyBoard_recommend (
	recNo NUMBER NOT NULL, /* ��õ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	boardNo NUMBER /* �Խñ۹�ȣ */
);

COMMENT ON TABLE companyBoard_recommend IS '�系�Խ�����õ';

COMMENT ON COLUMN companyBoard_recommend.recNo IS '��õ��ȣ';

COMMENT ON COLUMN companyBoard_recommend.MEMNO IS '�����ȣ';

COMMENT ON COLUMN companyBoard_recommend.boardNo IS '�Խñ۹�ȣ';

CREATE UNIQUE INDEX PK_companyBoard_recommend
	ON companyBoard_recommend (
		recNo ASC
	);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT PK_companyBoard_recommend
		PRIMARY KEY (
			recNo
		);

/* �系�Խ��� */
CREATE TABLE board (
	boardNo NUMBER NOT NULL, /* �Խñ۹�ȣ */
	title VARCHAR2(100), /* ������ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	content CLOB, /* �۳��� */
	regdate DATE DEFAULT sysdate, /* ����� */
	imageURL VARCHAR2(100), /* �̹����̸� */
	visited NUMBER, /* ��ȸ�� */
	recommend NUMBER, /* ��õ */
	isMain VARCHAR2(10) /* ���ο��� */
);

COMMENT ON TABLE board IS '�系�Խ���';

COMMENT ON COLUMN board.boardNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN board.title IS '������';

COMMENT ON COLUMN board.MEMNO IS '�����ȣ';

COMMENT ON COLUMN board.content IS '�۳���';

COMMENT ON COLUMN board.regdate IS '�����';

COMMENT ON COLUMN board.imageURL IS '�̹����̸�';

COMMENT ON COLUMN board.visited IS '��ȸ��';

COMMENT ON COLUMN board.recommend IS '��õ';

COMMENT ON COLUMN board.isMain IS '���ο���';

CREATE UNIQUE INDEX PK_board
	ON board (
		boardNo ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			boardNo
		);

/* ������ */
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* ������ ��ȣ */
	MEMNO VARCHAR2(50) NOT NULL, /* �����ȣ */
	TITLE VARCHAR2(100) NOT NULL, /* ������ ���� */
	START VARCHAR2(100) NOT NULL, /* ������ ���� ��¥ */
	END VARCHAR2(100) NOT NULL, /* ������ ����¥ */
	PLACE VARCHAR2(100), /* ������ ��� */
	CONTENT VARCHAR2(100) /* ������ ���� */
);

COMMENT ON TABLE schedule IS '������';

COMMENT ON COLUMN schedule.SCHNO IS '������ ��ȣ';

COMMENT ON COLUMN schedule.MEMNO IS '�����ȣ';

COMMENT ON COLUMN schedule.TITLE IS '������ ����';

COMMENT ON COLUMN schedule.START IS '������ ���� ��¥';

COMMENT ON COLUMN schedule.END IS '������ ����¥';

COMMENT ON COLUMN schedule.PLACE IS '������ ���';

COMMENT ON COLUMN schedule.CONTENT IS '������ ����';

CREATE UNIQUE INDEX PK_schedule
	ON schedule (
		SCHNO ASC
	);

ALTER TABLE schedule
	ADD
		CONSTRAINT PK_schedule
		PRIMARY KEY (
			SCHNO
		);

/* ���°��� */
CREATE TABLE workRecord (
	CMT_NO NUMBER NOT NULL, /* ���°��� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	CMP_IN DATE DEFAULT sysdate, /* ��ٽð� */
	CMP_OUT DATE DEFAULT sysdate, /* ��ٽð� */
	CMP_STATUS VARCHAR2(50), /* ���»��� */
	CMP_REGDATE DATE /* ��¥ */
);

COMMENT ON TABLE workRecord IS '���°���';

COMMENT ON COLUMN workRecord.CMT_NO IS '���°��� ��ȣ';

COMMENT ON COLUMN workRecord.MEMNO IS '�����ȣ';

COMMENT ON COLUMN workRecord.CMP_IN IS '��ٽð�';

COMMENT ON COLUMN workRecord.CMP_OUT IS '��ٽð�';

COMMENT ON COLUMN workRecord.CMP_STATUS IS '���»���';

COMMENT ON COLUMN workRecord.CMP_REGDATE IS '��¥';

CREATE UNIQUE INDEX PK_workRecord
	ON workRecord (
		CMT_NO ASC
	);

ALTER TABLE workRecord
	ADD
		CONSTRAINT PK_workRecord
		PRIMARY KEY (
			CMT_NO
		);

/* �����ڵ� */
CREATE TABLE accountCode (
	accCode VARCHAR(20) NOT NULL, /* �ڵ� */
	accGroup VARCHAR2(50), /* �з� */
	accTitle VARCHAR2(50), /* �������� */
	accContent CLOB /* ���� */
);

COMMENT ON TABLE accountCode IS '�����ڵ�';

COMMENT ON COLUMN accountCode.accCode IS '�ڵ�';

COMMENT ON COLUMN accountCode.accGroup IS '�з�';

COMMENT ON COLUMN accountCode.accTitle IS '��������';

COMMENT ON COLUMN accountCode.accContent IS '����';

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

/* ������ */
CREATE TABLE MESSAGE (
	MSG_NO NUMBER NOT NULL, /* ������ȣ */
	MSG_TITLE VARCHAR2(200), /* �������� */
	MSG_CONTENT CLOB, /* �������� */
	MSG_REGDATE DATE, /* ��¥ */
	SEND_DELFLAG VARCHAR2(10), /* ����ȸ�� �������� */
	MEMNO VARCHAR2(50) /* �����ȣ */
);

COMMENT ON TABLE MESSAGE IS '������';

COMMENT ON COLUMN MESSAGE.MSG_NO IS '������ȣ';

COMMENT ON COLUMN MESSAGE.MSG_TITLE IS '��������';

COMMENT ON COLUMN MESSAGE.MSG_CONTENT IS '��������';

COMMENT ON COLUMN MESSAGE.MSG_REGDATE IS '��¥';

COMMENT ON COLUMN MESSAGE.SEND_DELFLAG IS '����ȸ�� ��������';

COMMENT ON COLUMN MESSAGE.MEMNO IS '�����ȣ';

CREATE UNIQUE INDEX PK_MESSAGE
	ON MESSAGE (
		MSG_NO ASC
	);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT PK_MESSAGE
		PRIMARY KEY (
			MSG_NO
		);

/* �ڿ��������̺� */
CREATE TABLE reservation (
	RV_NO NUMBER NOT NULL, /* �ڿ������ȣ */
	RES_NO NUMBER NOT NULL, /* �ڿ���ȣ */
	RV_START DATE NOT NULL, /* �ڿ�������۽ð� */
	RV_END DATE NOT NULL, /* �ڿ����� ����ð� */
	RV_CONTENT VARCHAR2(1000) NOT NULL, /* �ڿ����೻�� */
	RV_CONFRM VARCHAR2(100) NOT NULL, /* �ڿ����ο��� */
	RV_REGDATE DATE, /* �ڿ������� */
	MEMNO VARCHAR2(50), /* �����ȣ */
	deptCode NUMBER /* �μ��ڵ� */
);

COMMENT ON TABLE reservation IS '�ڿ��������̺�';

COMMENT ON COLUMN reservation.RV_NO IS '�ڿ������ȣ';

COMMENT ON COLUMN reservation.RES_NO IS '�ڿ���ȣ';

COMMENT ON COLUMN reservation.RV_START IS '�ڿ�������۽ð�';

COMMENT ON COLUMN reservation.RV_END IS '�ڿ����� ����ð�';

COMMENT ON COLUMN reservation.RV_CONTENT IS '�ڿ����೻��';

COMMENT ON COLUMN reservation.RV_CONFRM IS '�ڿ����ο���';

COMMENT ON COLUMN reservation.RV_REGDATE IS '�ڿ�������';

COMMENT ON COLUMN reservation.MEMNO IS '�����ȣ';

COMMENT ON COLUMN reservation.deptCode IS '�μ��ڵ�';

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		RV_NO ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			RV_NO
		);

/* �ڿ��������̺� */
CREATE TABLE RESOURCE (
	RES_NO NUMBER NOT NULL, /* �ڿ���ȣ */
	RES_NAME VARCHAR2(50) NOT NULL, /* �ڿ��� */
	RES_DEC VARCHAR2(100), /* �ڿ����� */
	RES_REGDATE DATE /* �ڿ������ */
);

COMMENT ON TABLE RESOURCE IS '�ڿ��������̺�';

COMMENT ON COLUMN RESOURCE.RES_NO IS '�ڿ���ȣ';

COMMENT ON COLUMN RESOURCE.RES_NAME IS '�ڿ���';

COMMENT ON COLUMN RESOURCE.RES_DEC IS '�ڿ�����';

COMMENT ON COLUMN RESOURCE.RES_REGDATE IS '�ڿ������';

CREATE UNIQUE INDEX PK_RESOURCE
	ON RESOURCE (
		RES_NO ASC
	);

ALTER TABLE RESOURCE
	ADD
		CONSTRAINT PK_RESOURCE
		PRIMARY KEY (
			RES_NO
		);

/* �ּҷϱ׷� */
CREATE TABLE addressGroup (
	adgNo NUMBER NOT NULL, /* �׷��ȣ */
	groupName VARCHAR2(30) NOT NULL, /* �׷�� */
	memNo VARCHAR2(50) NOT NULL /* �����ȣ */
);

COMMENT ON TABLE addressGroup IS '�ּҷϱ׷�';

COMMENT ON COLUMN addressGroup.adgNo IS '�׷��ȣ';

COMMENT ON COLUMN addressGroup.groupName IS '�׷��';

COMMENT ON COLUMN addressGroup.memNo IS '�����ȣ';

CREATE UNIQUE INDEX PK_addressGroup
	ON addressGroup (
		adgNo ASC
	);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT PK_addressGroup
		PRIMARY KEY (
			adgNo
		);

/* �ּ� */
CREATE TABLE address (
	adNo NUMBER NOT NULL, /* �ּҷϹ�ȣ */
	name VARCHAR2(50) NOT NULL, /* ����� */
	hp1 VARCHAR2(20), /* ��ȭ��ȣ1 */
	hp2 VARCHAR2(20), /* ��ȭ��ȣ2 */
	hp3 VARCHAR2(20), /* ��ȭ��ȣ3 */
	email1 VARCHAR2(50), /* �̸���1 */
	email2 VARCHAR2(50), /* �̸���2 */
	adgNo NUMBER, /* �׷��ȣ */
	company VARCHAR2(100), /* ȸ���/�ŷ�ó�� */
	deptName VARCHAR2(100), /* �μ� */
	posName VARCHAR2(100), /* ���� */
	isFavorite VARCHAR2(10), /* ���ã�� ���� */
	isDeleted VARCHAR2(10) /* ����(������) */
);

COMMENT ON TABLE address IS '�ּ�';

COMMENT ON COLUMN address.adNo IS '�ּҷϹ�ȣ';

COMMENT ON COLUMN address.name IS '�����';

COMMENT ON COLUMN address.hp1 IS '��ȭ��ȣ1';

COMMENT ON COLUMN address.hp2 IS '��ȭ��ȣ2';

COMMENT ON COLUMN address.hp3 IS '��ȭ��ȣ3';

COMMENT ON COLUMN address.email1 IS '�̸���1';

COMMENT ON COLUMN address.email2 IS '�̸���2';

COMMENT ON COLUMN address.adgNo IS '�׷��ȣ';

COMMENT ON COLUMN address.company IS 'ȸ���/�ŷ�ó��';

COMMENT ON COLUMN address.deptName IS '�μ�';

COMMENT ON COLUMN address.posName IS '����';

COMMENT ON COLUMN address.isFavorite IS '���ã�� ����';

COMMENT ON COLUMN address.isDeleted IS '����(������)';

CREATE UNIQUE INDEX PK_address
	ON address (
		adNo ASC
	);

ALTER TABLE address
	ADD
		CONSTRAINT PK_address
		PRIMARY KEY (
			adNo
		);

/* �ı� */
CREATE TABLE  ticket (
	TICNO NUMBER NOT NULL, /* �ıǱ��Ű��� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	TICQUANTITY NUMBER, /* ���Ÿż� */
	TICPRICE NUMBER, /* ���� */
	TICREGDATE DATE DEFAULT SYSDATE /* ������ */
);

COMMENT ON TABLE  ticket IS '�ı�';

COMMENT ON COLUMN  ticket.TICNO IS '�ıǱ��Ű��� ��ȣ';

COMMENT ON COLUMN  ticket.MEMNO IS '�����ȣ';

COMMENT ON COLUMN  ticket.TICQUANTITY IS '���Ÿż�';

COMMENT ON COLUMN  ticket.TICPRICE IS '����';

COMMENT ON COLUMN  ticket.TICREGDATE IS '������';

CREATE UNIQUE INDEX PK_ ticket
	ON  ticket (
		TICNO ASC
	);

ALTER TABLE  ticket
	ADD
		CONSTRAINT PK_ ticket
		PRIMARY KEY (
			TICNO
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

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_position_TO_MEMBER
		FOREIGN KEY (
			posCode
		)
		REFERENCES position (
			posCode
		);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_department_TO_MEMBER
		FOREIGN KEY (
			deptCode
		)
		REFERENCES department (
			deptCode
		);

ALTER TABLE payComment
	ADD
		CONSTRAINT FK_payment_TO_payComment
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE payComment
	ADD
		CONSTRAINT FK_MEMBER_TO_payComment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_docForm_TO_payment
		FOREIGN KEY (
			formNo
		)
		REFERENCES docForm (
			formNo
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_MEMBER_TO_payment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_docType_TO_payment
		FOREIGN KEY (
			typeNo
		)
		REFERENCES docType (
			typeNo
		);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT FK_MEMBER_TO_paymentLine
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE paymentLine
	ADD
		CONSTRAINT FK_payment_TO_paymentLine
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE paymentFile
	ADD
		CONSTRAINT FK_payment_TO_paymentFile
		FOREIGN KEY (
			docNo
		)
		REFERENCES payment (
			docNo
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_MEMBER_TO_boardComment
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_board_TO_boardComment
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MEMBER_TO_message_rec2
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE message_rec
	ADD
		CONSTRAINT FK_MESSAGE_TO_message_rec
		FOREIGN KEY (
			MSG_NO
		)
		REFERENCES MESSAGE (
			MSG_NO
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

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_MEMBER_TO_companyBoard_recommend
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE companyBoard_recommend
	ADD
		CONSTRAINT FK_board_TO_companyBoard_recommend
		FOREIGN KEY (
			boardNo
		)
		REFERENCES board (
			boardNo
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_MEMBER_TO_board
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE schedule
	ADD
		CONSTRAINT FK_MEMBER_TO_schedule
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE workRecord
	ADD
		CONSTRAINT FK_MEMBER_TO_workRecord
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_MEMBER_TO_MESSAGE
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_MEMBER_TO_reservation
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_department_TO_reservation
		FOREIGN KEY (
			deptCode
		)
		REFERENCES department (
			deptCode
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_RESOURCE_TO_reservation
		FOREIGN KEY (
			RES_NO
		)
		REFERENCES RESOURCE (
			RES_NO
		);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT FK_MEMBER_TO_addressGroup
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);

ALTER TABLE address
	ADD
		CONSTRAINT FK_addressGroup_TO_address
		FOREIGN KEY (
			adgNo
		)
		REFERENCES addressGroup (
			adgNo
		);

ALTER TABLE  ticket
	ADD
		CONSTRAINT FK_MEMBER_TO_ ticket
		FOREIGN KEY (
			MEMNO
		)
		REFERENCES MEMBER (
			MEMNO
		);