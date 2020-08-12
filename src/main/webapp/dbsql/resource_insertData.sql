

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, 'ȸ�ǽ�');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '����');


select * from resmanage;

insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, 'ȸ�ǽ�1', 1, '4�� A��');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, 'ȸ�ǽ�2', 1, '4�� B��');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, 'ȸ�ǽ�3', 1, '2�� ����');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '���׽ý� G80', 2, '������A');
insert into resmanage(resno, resname, rkno, reslocation)
values(resno_seq.nextval, '�ƹݶ�', 2, '������B');

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
����?: ?1,376 ~ 2,454����
����?: ?LPG,���ָ�,����
����?: ?10.6 ~ 17.8km/l
*/
-------------------------------------------------------------------------

select * from resreserve;

insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/05 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), to_date('2020/08/05 13:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 111910);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, '2020-08-01', '2020-08-02', 121920);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 1, to_date('2020/08/10 15:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 17:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
    
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 2, to_date('2020/08/10 07:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 09:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);
insert into resreserve(rvno, resno, rvstart, rvend, memno)
values(rvno_seq.nextval, 3, to_date('2020/08/10 12:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 
    to_date('2020/08/10 14:00:00', 'YYYY/MM/DD hh24:Mi:SS'), 141930);



----------------------------------------------------------------------------