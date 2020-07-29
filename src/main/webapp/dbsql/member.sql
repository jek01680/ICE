/* 사원 */
/*DROP TABLE member 
	CASCADE CONSTRAINTS;
   
   drop view mypage_mem
	;
*/
/*DROP sequence member_seq ;
*/
/* 사원 */
CREATE TABLE member (
    no number not null , /*사원테이블 관리번호*/
	memNo VARCHAR2(50) NOT NULL, /* 사원번호 */
	name VARCHAR2(50), /* 사원명 */
	pwd VARCHAR2(50), /* 비밀번호 */
	hp1 VARCHAR2(20), /* 전화번호1 */
	hp2 VARCHAR2(20), /* 전화번호2 */
	hp3 VARCHAR2(20), /* 전화번호3 */
	email1 VARCHAR2(50), /* 이메일1 */
	email2 VARCHAR2(50), /* 이메일2 */
	ssn1 VARCHAR2(50), /* 주민번호1 */
	ssn2 VARCHAR2(50), /* 주민번호2 */
	zipcode VARCHAR2(50), /* 우편번호 */
	addr VARCHAR2(100), /* 주소 */
	addrDetail VARCHAR2(100), /* 상세주소 */
	salary NUMBER, /* 연봉 */
	hiredate VARCHAR2(30), /* 입사일 */
	firedate VARCHAR2(30), /* 퇴사일 */
	gender VARCHAR2(10), /* 성별 */
	profileURL VARCHAR2(100), /* 사진 */
	originalFileName VARCHAR2(100), /* 오리지날파일이름 */
	fileSize LONG, /* 파일사이즈 */
	deptCode NUMBER, /* 부서코드 */
	posCode NUMBER /* 직급코드 */
);



create sequence member_seq
start with 1
increment by 1;

CREATE UNIQUE INDEX PK_member
	ON member (
		no ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			no
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_position_TO_member
		FOREIGN KEY (
			posCode
		)
		REFERENCES position (
			posCode
		);

ALTER TABLE member
	ADD
		CONSTRAINT FK_department_TO_member
		FOREIGN KEY (
			deptCode
		)
		REFERENCES department (
			deptCode
		);
		

create view mypage_mem
as
select m.*,  p.posname , d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  

  
select * from mypage_mem;		


