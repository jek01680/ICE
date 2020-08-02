select * from member;

select * from position;

select * from department;


select * from workRecord;

insert into workRecord(cmp_no, memno, cmp_in, cmp_out, cmp_status, cmp_regdate, cmp_month)
values(3, '111910', '9:00', '17:00', '퇴근', '2020-08-02', '2020-08');

insert into workRecord(cmp_no, memno, cmp_in,  cmp_status, cmp_regdate, cmp_month)
values(5, '111910', '9:00',  '퇴근', '2020-07-30', '2020-07');


select * from workRecord 
    where memno='111910' and cmp_in is not null
    and cmp_regdate = '2020-07-30'
;


create view mypage_mem
as
select m.*,  p.posname , d.DEPTNAME
from member m join position p
 on m.POSCODE = p.POSCODE
 join department d
  on m.DEPTCODE = d.DEPTCODE;
  

  
select * from mypage_mem;
  
 /* 
  
  drop view mypage_mem;
  drop table position;
  drop table department;
  drop table member;
  
  delete from member;
  */
  desc department;
 
  
  commit;
  
 --delete from member;
  

insert into member(memNo, name, pwd, deptcode, poscode)
values('111910', '정그래', '123', '111','910');

insert into member(memNo, name, pwd, deptcode, poscode)
values('121920', '이경리', '123', '121','920');

insert into member(memNo, name, pwd, deptcode, poscode)
values('141930', '김과장', '123', '141','930');

insert into member(memNo, name, hp1, hp2, hp3, pwd, deptcode, poscode)
values('141910', '둘리', '010', '1234','5678','123', '141','930');

insert into member(memNo, name, pwd, hiredate, deptcode, poscode, salary)
values('999999', '박관리', '123', '2009-01-02','999','999' , '4000');


update member
set name = '장그래', hiredate = '2020-03-13', 
			deptcode = '111', poscode = '910', salary = '2850'
where memno = '111910';


--delete from member where memno = '181910'

commit;

select * from companyCard;


insert into companyCard
values(companyCard_seq.nextval,'1111222233334448','111910','102038',9000,'서울시','2020-06-31' ,1  );

insert into companyCard(no, cardno, memno, price, useplace, usedate, fileno)
values(companyCard_seq.nextval,'3243222233334321','111910',9000,'서울시','2020-07-01' ,1  );

insert into companyCard(no, cardno, memno, price, useplace, usedate, fileno)
values(companyCard_seq.nextval,'4321222233331234','111910',9000,'서울시','2020-07-31' ,1  );

insert into companyCard(no, cardno, memno, price, useplace, usedate, fileno)
values(companyCard_seq.nextval,'3777222233331234','111910',9000,'서울시','2020-06-01' ,1  );

--drop table companyCard
--drop sequence companyCard_seq

select * from accountCode;
--102306
--102307

--drop view  comcard_mem;

select c.*, m.NAME , m.POSNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 create view comcard_mem
 as 
 select c.*, m.NAME , m.POSNAME, m.DEPTNAME
from companyCard c join mypage_mem m
 on c.MEMNO = m.MEMNO ;
 
 select * from comcard_mem;
 
 desc comcard_mem
 
select * from comcard_mem
		where acccode is null 
		  and usedate between '2020-06-01' and '2020-07-01';
		 

 select * from member;
 desc member;
 
 commit;
 
delete from member
where memno = '999999';
 

