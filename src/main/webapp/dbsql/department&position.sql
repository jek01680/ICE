/* ���� */
/*DROP TABLE position 
	CASCADE CONSTRAINTS;*/

/* �μ� */
/*DROP TABLE department 
	CASCADE CONSTRAINTS;*/

/* ���� */
CREATE TABLE position (
	posCode VARCHAR2(10) NOT NULL, /* �����ڵ� */
	posName VARCHAR2(100) /* ���޸� */
);

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
		
insert into position
values('910', '���1');

insert into position
values('911', '���2');

insert into position
values('912', '���3');

insert into position
values('919', '�渮');

insert into position
values('930', '����');

insert into position
values('940', '����');

insert into position
values('950', '����');

insert into position
values('960', '�̻�');	

insert into position
values('999', '������');

/* �μ� */
CREATE TABLE department (
	deptCode VARCHAR2(10) NOT NULL, /* �μ��ڵ� */
	deptName VARCHAR2(100) /* �μ��� */
);

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
	
insert into department
values('111', '����1��');

insert into department
values('121', '��ȹ��');

insert into department
values('131', '������');

insert into department
values('141', '������');

insert into department
values('151', '������');

insert into department
values('161', '������');

insert into department
values('171', '�λ���');


insert into department
values('999', '������');	



		
	