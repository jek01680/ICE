/* 법인카드 */
CREATE TABLE companyCard (
	no NUMBER NOT NULL, /* 법인카드 DB관리번호 */
	cardNo VARCHAR2(100) NOT NULL, /* 법인카드 번호 */
	memNo VARCHAR2(50), /* 사원번호 */
	accCode VARCHAR(20), /* 계정코드 */
	price NUMBER, /* 금액 */
	usePlace VARCHAR2(100), /* 사용처 */
	useDate varchar2(30) , /* 날짜 */
	fileNo NUMBER /* 파일순서 */
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

/* 파일내역 */
CREATE TABLE companyCardFile (
	fileNo NUMBER NOT NULL, /* 파일순서 */
	fileName VARCHAR2(100), /* 파일이름 */
	uploadDate DATE DEFAULT sysdate, /* 파일업로드 날짜 */
	isDelete VARCHAR2(10) /* 파일 삭제 여부 */
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

/* 계정코드 */
CREATE TABLE accountCode (
	accCode VARCHAR(20) NOT NULL, /* 코드 */
	accGroup VARCHAR2(50), /* 분류 */
	accTitle VARCHAR2(50), /* 계정과목 */
	accContent CLOB /* 내용 */
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
		
		
--drop sequence companyCard_seq
create sequence companyCard_seq
start with 1
increment by 1;


 create view comcard_mem
 as 
 select c.*, m.NAME , m.POSNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 select * from comcard_mem;