
/* ������ */
--drop table schedule;
CREATE TABLE schedule (
	SCHNO NUMBER NOT NULL, /* ������ ��ȣ */
	MEMNO VARCHAR2(50) NOT NULL, /* �����ȣ */
	TITLE VARCHAR2(100) NOT NULL, /* ������ ���� */
	START_DAY VARCHAR2(100) NOT NULL, /* ������ ���� ��¥ */
	END_DAY VARCHAR2(100) NOT NULL, /* ������ ����¥ */
	PLACE VARCHAR2(100), /* ������ ��� */
	CONTENT VARCHAR2(100) /* ������ ���� */
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
		
--drop sequence schedule_seq;
create sequence schedule_seq
increment by 1
start with 1;


select * from SCHEDULE;

insert into SCHEDULE(schno,memNo,title,start_day,end_day,place,content)
		values(schedule_seq.nextval,111910,'����',sysdate,sysdate,'������','8������');
		
		
commit;