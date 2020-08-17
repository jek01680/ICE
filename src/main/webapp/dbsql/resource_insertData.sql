

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, 'ȸ�ǽ�');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '����');


select * from resmanage;

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 'ȸ�ǽ�1', 1, '4�� A��', 'red', 
'�ο�: 12�ο�
��� : V-�÷� 2m / ���� 85cm / C���ĵ� / ����Ʈ�ڽ� ��
�÷��� : ���߽� E600 x 2 +������
LED ���ӱ� : ���� sl200w * 1 / ���� sl60w �� 2',
'ȸ�ǽ�1.jpg', 'ȸ�ǽ�1.jpg');
insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 'ȸ�ǽ�2', 1, '4�� B��', 'green',
'�ο�: 20�ο�
��� : 75��ġ �����, �����͸�, ������, ����/����ũ',
'ȸ�ǽ�2.jpg', 'ȸ�ǽ�2.jpg');
insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 'ȸ�ǽ�3', 1, '2�� ����', 'orange',
'�ο�: 18�ο�
��� : 5G ���� ��������, ���� IPTV(��Ʈ��, ����Ʈ�� ���� ���̺� ����), �ÿ�ǳ��, ���ǿ� ȭ��Ʈ����',
'ȸ�ǽ�3.jpg', 'ȸ�ǽ�3.jpg');
insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '���׽ý� G80', 2, '������A', 'lightgray',
'�ο�: 4��
����: ���տ���: 9 ~ 15 km/l (����: 8 ~ 13 km/l, ��ӵ���: 11 ~ 18 km/l)
���� �뷮: 433L
����: 2.2L 4-�Ǹ��� ����, 2.5L 6-�Ǹ���, 3.5L V6',
'���׽ý� G80.png',
'���׽ý� G80.png');
insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, '�ƹݶ�', 2, '������B', 'violet',
'�ο�: 4��
����: 1,376 ~ 2,454����
����: LPG,���ָ�,����
����: 10.6 ~ 17.8km/l',
'�ƹݶ�.png', '�ƹݶ�.png');

-- resImage -> /webapp/resources/img/resource ���Ͽ� �ִ� �̹����� Ȱ���� ��. 
    -- ���� ���������� �̹����� ÷���ϸ� /webapp/resource_file�� �̸��� ����Ǽ� �����.

-------------------------------------------------------------------------

select * from resreserve;

delete from resreserve;

insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/05 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), to_date('2020/08/08 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
  
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 10:30:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 12:30:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 20:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 21:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/09 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/11 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/11 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 23:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
        insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/12 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/12 01:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
 insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 19:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 20:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/06/29 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/2 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
     insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2018/01/05 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2019/12/21 00:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
    
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 09:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);

select * from resreserve;

----------------------------------------------------------------------------