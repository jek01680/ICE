
/* ������ */
drop table schedule;
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* ������ ��ȣ */
	MEMNO VARCHAR2(50) NOT NULL, /* �����ȣ */
	TITLE VARCHAR2(100) NOT NULL, /* ������ ���� */
	START_DAY VARCHAR2(100) NOT NULL, /* ������ ���� ��¥ */
	END_DAY VARCHAR2(100) NOT NULL, /* ������ ����¥ */
	PLACE VARCHAR2(100), /* ������ ��� */
	CONTENT VARCHAR2(100), /* ������ ���� */
	resourceId VARCHAR2(100) /* ���ҽ� ���̵� */
);


ALTER TABLE schedule
	ADD
		CONSTRAINT PK_schedule
		PRIMARY KEY (
			SCHNO
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
		
drop sequence schedule_seq;

create sequence schedule_seq
increment by 1
start with 9;


insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'db�۾�','2020-08-01','2020-08-03','��������','������db�۾�','a');

insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'ȸ��','2020-08-31','2020-08-31','��Ÿ','ȸ��','b');		
		
insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'�ް�','2020-08-10','2020-08-15','�ް�/����','�ް�','c');

insert into SCHEDULE(schNo,memNo,title,start_day,end_day,place,content,resourceId)
values(schedule_seq.nextval,111910,'����','2020-08-18','2020-08-18','�����ٹ�','����','d');


select * from SCHEDULE;

commit;