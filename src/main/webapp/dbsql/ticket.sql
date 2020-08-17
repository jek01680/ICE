

select * from SpayView -- �ֹ��� ��� ���� , ���� ���� �����ִ� �뵵
where memno = '111910';

CREATE TABLE  ticket (
	TICNO NUMBER NOT NULL, /* �ıǱ��Ű��� ��ȣ */
	MEMNO VARCHAR2(50), /* �����ȣ */
	TICQUANTITY NUMBER, /* ���Ÿż� */
	TICPRICE NUMBER, /* ���� */
	TICREGDATE DATE DEFAULT SYSDATE /* ������ */
);

commit;



create or replace view SpayView
as
select t.*, m.name, m.hp1, m.hp2, m.hp3, m.email1, m.email2
from ticket t join member m
on t.MEMNO = m.MEMNO;

create sequence ticket_seq
start with 1
increment by 1
nocache;

select * from SpayView;