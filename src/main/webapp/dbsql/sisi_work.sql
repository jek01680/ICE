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
  

insert into member(memNo, name, pwd, deptcode, poscode)
values('111910', '���׷�', '123', '111','910');

insert into member(memNo, name, pwd, deptcode, poscode)
values('121920', '�̰渮', '123', '121','920');

insert into member(memNo, name, pwd, deptcode, poscode)
values('141930', '�����', '123', '141','930');

insert into member(memNo, name, hp1, hp2, hp3, pwd, deptcode, poscode)
values('141910', '�Ѹ�', '010', '1234','5678','123', '141','930');

insert into member(memNo, name, pwd, deptcode, poscode)
values('999999', '�ڰ���', '123', '999','999');

update member
set hiredate = '2020-01-13'
where memno = '111910';

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
 

 
