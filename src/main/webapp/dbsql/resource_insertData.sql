
insert into resmanage(resno, resname)
values(resno_seq.nextval, 'ȸ�ǽ�1');
insert into resmanage(resno, resname, reslocation, ressubdesc)
values(resno_seq.nextval, 'ȸ�ǽ�2', '4�� ����', '��Ʈ�� 3��, ������Ʈ ��, ĥ�� ��');

select * from resmanage;

desc resmanage;