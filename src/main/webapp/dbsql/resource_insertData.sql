

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
values(resno_seq.nextval, 'ȸ�ǽ�4', 1, '4�� A��', 'blue',
'�ο�: 12�ο�
��� : ���� ��������, ����������, ���� IPTV(��Ʈ��, ����Ʈ�� ���� ���̺� ����), �ÿ�ǳ��, ���ǿ� ȭ��Ʈ���� ',
'ȸ�ǽ�4.jpg', 'ȸ�ǽ�4.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 'ȸ�ǽ�3', 1, '2�� ����', 'orange',
'�ο�: 18�ο�
��� : 5G ���� ��������, ���� IPTV(��Ʈ��, ����Ʈ�� ���� ���̺� ����), �ÿ�ǳ��, ���ǿ� ȭ��Ʈ����',
'ȸ�ǽ�3.jpg', 'ȸ�ǽ�3.jpg');
--�ڵ��� : �ڿ���ȣ, �ڿ���, �ڿ�������ȣ, �ڿ����, �ڿ�����, �ڿ��ΰ�����
--�ڿ��������̹������ϸ�, �̹������ϸ�

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 
'2019 ���׽ý� G80', 
2, 
'������A', 
'Casablanca White',
'������ȣ: 164�� 9435,
�����:2019�� 3��,
���Žñ�:2019�� 3��,
�ο�: 5��,
����: 6347����,
����: ���ָ�,
����: 8.0~13.8km/��',
'G80.jpg',
'G80.jpg'
);

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(resno_seq.nextval, 
'2017 �ƹݶ� Ad', 
2, 
'������B', 
'Phantom Black',
'������ȣ: 33ȣ 3469,
�����: 2017�� 3��,
���Žñ�:2017�� 3��
�ο�: 5��,
����: 2670����,
����: ����,
����: 10.6 ~ 17.8km/��',
'avante.jpg', 
'avante.jpg'
);

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2016 ��Ÿ����', 
2, 
'������B', 
'Creamy White',
'������ȣ: 31�� 1963,
�����: 2016�� 3��,
���Žñ�: 2017�� 2��,
�ν�: 11�ν�,
����: 1480����,
����: ����,
����: 6.1~11.0km/��',
'starex.jpg', 
'starex.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2019 ���', 
2, 
'������B', 
'Sparkling Silver',
'������ȣ: 134�� 4693,
�����: 2019�� 6��,
���Žñ�: 2020�� 4��,
�ν�: 5�ν�,
����: 910����,
����: ���ָ�,
����: 11.8~16.0km/��',
'morning.jpg', 
'morning.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2017 ����3', 
2, 
'������B', 
'Navy',
'������ȣ: 32ȣ 7321,
�����: 2017�� 6��,
���Žñ�: 2017�� 12��,
�ν�: 3�ν�,
����: 1673����,
����: ����,
����: 6.4~9.6km/��',
'bongo.jpg', 
'bongo.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2016 �ڶ��� ������', 
2, 
'������B', 
'Space Black',
'������ȣ: 72�� 9317,
�����: 2016�� 3��,
���Žñ�: 2016�� 3��,
�ν�: 5�ν�,
����: 3247����,
����: ����,
����: 11.4~13.3km/��',
'korando.jpg', 
'korando.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'2020 K5', 
2, 
'������B', 
'Aurora Black Pearl',
'������ȣ: 117ȣ 3723,
�����: 2020�� 6��,
���Žñ�: 2020�� 6��,
�ν�: 5�ν�,
����: 3473����,
����: ���ָ�,
����: 9.8~13.8km/��',
'K5.jpg', 
'K5.jpg');

-- resImage -> /webapp/resources/img/resource ���Ͽ� �ִ� �̹����� Ȱ���� ��. 
    -- ���� ���������� �̹����� ÷���ϸ� /webapp/resource_file�� �̸��� ����Ǽ� �����.


insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, 'ȸ�ǽ�1', 1, '4�� A��', 'red');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, 'ȸ�ǽ�2', 1, '4�� B��', 'green');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, 'ȸ�ǽ�3', 1, '2�� ����', 'orange');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '���׽ý� G80', 2, '������A', 'lightgray');
insert into resmanage(resno, resname, rkno, reslocation, rescolor)
values(resno_seq.nextval, '�ƹݶ�', 2, '������B', 'violet');

-- resSubdesc -> ���� ���������� �ڿ����� �ٿ��� ����� ��.
-- resImage -> /webapp/resources/img/resource ���Ͽ� �ִ� �̹����� Ȱ���� ��. 
    -- ���� ���������� �̹����� ÷���ϸ� /webapp/resource_file�� �̸��� ����Ǽ� �����.
 
/* ȸ�ǽ�1
�ο�: 12�ο�
��� : V-�÷� 2m / ���� 85cm / C���ĵ� / ����Ʈ�ڽ� ��
�÷��� : ���߽� E600 x 2 +������
LED ���ӱ� : ���� sl200w * 1 / ���� sl60w �� 2
*/

/* ȸ�ǽ�2
�ο�: 20�ο�
��� : 75��ġ �����, �����͸�, ������, ����/����ũ
*/

/* ȸ�ǽ�3
�ο�: 18�ο�
��� : 5G ���� ��������, ���� IPTV(��Ʈ��, ����Ʈ�� ���� ���̺� ����), �ÿ�ǳ��, ���ǿ� ȭ��Ʈ����
*/

/* ���׽ý� G80
�ο�: 4��
����: ���տ���: 9 ~ 15 km/l (����: 8 ~ 13 km/l, ��ӵ���: 11 ~ 18 km/l)
���� �뷮: 433L
����: 2.2L 4-�Ǹ��� ����, 2.5L 6-�Ǹ���, 3.5L V6
*/

/* �ƹݶ�
�ο�: 4��
����: 1,376 ~ 2,454����
����: LPG,���ָ�,����
����: 10.6 ~ 17.8km/l
*/

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
delete from resreserve where rvno=53;
