
insert into addressGroup
values(adgNo_seq.nextval, 'ȸ��', '111910');
insert into addressGroup
values(adgNo_seq.nextval, 'ģ��', '111910');
insert into addressGroup
values(adgNo_seq.nextval, '����', '111910');
insert into addressGroup
values(adgNo_seq.nextval, '�ƹ���', '121920');
insert into addressGroup
values(adgNo_seq.nextval, '��Ű', '121920');


insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '�ڱ浿', '010', '2222', '3333', 'wotkdf', 'naver.com', 1, '(��)I.C.E' ,'�λ��', '�븮');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '�迬��', '010', '4545', '3333', null, null, 1, null , null, null);
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '�̼���', null, null, null, 'wowwwf', 'gmail.com', 2, null ,'�λ��', '�븮');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '�̶���', '010', '2222', '3333', 'wotkdf', 'naver.com', 2, null ,'�λ��', '�븮');
insert into address(adno, name, hp1, hp2, hp3, email1, email2, adgno, company, deptname, posname)
values(adno_seq.nextval, '��븮', '010', '3434', '7777', 'ready', 'daum.net', 4, '(��)I.C.E' ,'�λ��', '�븮');

select * from position;
select * from department;
select * from member;

select * from address;
select * from addressGroup;