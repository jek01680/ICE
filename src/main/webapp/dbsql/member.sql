/* ��� */
/*DROP TABLE member 
	CASCADE CONSTRAINTS;
*/
/* ��� */
CREATE TABLE member (
	memNo VARCHAR2(50) NOT NULL, /* �����ȣ */
	name VARCHAR2(50), /* ����� */
	pwd VARCHAR2(50), /* ��й�ȣ */
	hp1 VARCHAR2(20), /* ��ȭ��ȣ1 */
	hp2 VARCHAR2(20), /* ��ȭ��ȣ2 */
	hp3 VARCHAR2(20), /* ��ȭ��ȣ3 */
	email1 VARCHAR2(50), /* �̸���1 */
	email2 VARCHAR2(50), /* �̸���2 */
	ssn1 VARCHAR2(50), /* �ֹι�ȣ1 */
	ssn2 VARCHAR2(50), /* �ֹι�ȣ2 */
	zipcode VARCHAR2(50), /* ������ȣ */
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

CREATE UNIQUE INDEX PK_member
	ON member (
		memNo ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			memNo
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
		
create view log_mem
as
select name , memno, pwd,  p.PNAME, d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  
select * from log_mem;

create view mypage_mem
as
select m.*,  p.PNAME, d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  
  
select * from mypage_mem;		