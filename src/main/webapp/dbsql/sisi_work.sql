select * from member;

select * from position;

select * from department;


create view mypage_mem
as
select m.*,  p.posname , d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  

  
select * from mypage_mem;
  
 /* 
  drop view log_mem;
  drop view mypage_mem;
  drop table position;
  drop table department;
  drop table member;
  */
  
 
  
  commit;
  
 --delete from member;
  

insert into member(no, memNo, name, pwd, deptcode, poscode)
values( member_seq.nextval ,'111910', '���׷�', '123', '111','910');

insert into member(no,memNo, name, pwd, deptcode, poscode)
values(member_seq.nextval ,'121920', '�̰渮', '123', '121','920');

insert into member(no,memNo, name, pwd, deptcode, poscode)
values(member_seq.nextval ,'141930', '�����', '123', '141','930');



insert into member(no,memNo, name, pwd, deptcode, poscode)
values(member_seq.nextval ,'999999', '�ڰ���', '123', '999','999');

insert into member(no,memNo, name, pwd, hiredate, deptcode, poscode, salary)
values(member_seq.nextval ,'141910', '�Ѹ�','123', '2020-07-01','141','930', 4000000);

update member
set memNo = '141911'
where salary = 4000000;

--delete from member where memno = '141910'

select * from companyCard;

insert into companyCard
values(companyCard_seq.nextval,'1111222233334444','111910','102036',9000,'�����','2020-07-12' ,1);

insert into companyCard
values(companyCard_seq.nextval,'1111222233334445','111910','102037',9000,'�����','2020-07-12' ,1);

insert into companyCard
values(companyCard_seq.nextval,'1111222233334446','111910','102036',13000,'�����','2020-07-13' ,1);

insert into companyCard
values(4,'1111222233334447','121920','102036',356000,'�����','2020-07-14' ,1);

insert into companyCard
values(companyCard_seq.nextval,'1111222233334448','111910','102038',9000,'�����','2020-07-12' ,1);

select * from accountCode;
--102306
--102307


select c.*, m.NAME , m.POSNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 create view comcard_mem
 as 
 select c.*, m.NAME , m.POSNAME, m.DEPTNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 select * from comcard_mem;
 
 
 select * from member;
 desc member;
 
 commit;
 
delete from member
where memno = '141912';
 
create table admin_register
(
    memNo VARCHAR2(50) NOT NULL, /* �����ȣ */
	name VARCHAR2(50), /* ����� */
	pwd VARCHAR2(50), /* ��й�ȣ */
	hiredate VARCHAR2(30), /* �Ի��� */
	deptCode NUMBER, /* �μ��ڵ� */
	posCode NUMBER, /* �����ڵ� */
	salary NUMBER /* ���� */
);

commit;

select * from admin_register;