select * from member;

select * from position;

select * from department;

create view log_mem
as
select m.name , m.memno, m.pwd, m.FIREDATE, p.posCode,p.PosNAME ,d.deptCode,d.deptNAME
from member m join position p
 on m.POSCODE = p.POSCODE
join department d
 on m.DEPTCODE = d.DEPTCODE;
 
  
select * from log_mem;

desc log_mem;

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

insert into member(memNo, name, pwd, deptcode, poscode)
values('999999', '�ڰ���', '123', '999','999');


