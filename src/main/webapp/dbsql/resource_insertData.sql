

insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, 'ȸ�ǽ�');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '����');
insert into reskind(rkno, rkkind)
values(rkno_seq.nextval, '���');


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

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'�̴Ϻ��������� PJM-H2000', 
3, 
'3�� ������', 
'Black',
'��ǰ���: HD(1280x720),
����ȭ��ũ��: 50��~160��,
ȭ�����: 16:9,
USB����: 2.0,
����ǰ : HDMI ���̺�,
������, ������, ��뼳��, ����Ŀ��',
'PJM-H2000.jpg', 
'PJM-H2000.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'�ó׺� PF50KS FHD', 
3, 
'3�� ������', 
'White',
'��ǰ���: FULL HD(1920x1080),
����ȭ��ũ��: 50��~200��,
ȭ�����: 16:9,
USB����: 2.0, TYPE-C,
����ǰ : HDMI ���̺�,
������, ������, ��뼳��, ����Ŀ��',
'PF50KS FHD.jpg', 
'PF50KS FHD.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'���������� G86', 
3, 
'3�� ������', 
'White',
'��ǰ���: FULL HD(854x480),
����ȭ��ũ��: 32��~150��,
ȭ�����: 4:3,
USB����: 2.0, TYPE-C,
����ǰ : HDMI ���̺�,
������, ������, ��뼳��, ����Ŀ��',
'G86.jpg', 
'G86.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'���� D3500 AF-P18-55VR KIT', 
3, 
'3�� ������', 
'Black',
'��ǰ���: FULL HD(1080/60),
ȭ��: 2416��,
����ǰ : HDMI ���̺�,
������ ���͸�, ���͸� ������, ��뼳��, ����Ŀ��',
'D3500.jpg', 
'D3500.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'ĳ�� PSSX420IS', 
3, 
'3�� ������', 
'Black',
'��ǰ���: FULL HD(1080/60),
ȭ��: 1876��,
����ǰ : HDMI ���̺�,
������ ���͸�, ���͸� ������, ��뼳��, ����Ŀ��',
' PSSX420IS.jpg', 
' PSSX420IS.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'ĳ�� EOS 100D', 
3, 
'3�� ������', 
'Black',
'��ǰ���: FULL HD(1080/60),
ȭ��: 1800��,
����ǰ : HDMI ���̺�,
������ ���͸�, ���͸� ������, ��뼳��, ����Ŀ��',
'EOS100D.jpg', 
'EOS100D.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'ĳ�� EOS 800D', 
3, 
'3�� ������', 
'Black',
'��ǰ���: FULL HD(1080/60),
ȭ��: 2420��,
����ǰ : HDMI ���̺�,
������ ���͸�, ���͸� ������, ��뼳��, ����Ŀ��',
'EOS800D.jpg', 
'EOS800D.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'LG���� �׷�15 15ZD90N-VX50K', 
3, 
'3�� ������', 
'White',
'CPU: �ھ�i5-1035G7,
RAM: 8GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
SSD: 256GB,
����: 1.12kg,
����ǰ : ���͸� ������, ����',
'15ZD90N-VX50K.jpg', 
'15ZD90N-VX50K.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'�Ｚ���� �����ú� �̿� NT950XCR-G58A', 
3, 
'3�� ������', 
'Aura Silver',
'CPU: �ھ�i5-10210U,
RAM: 8GB,
Graphics: MX250,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
SSD: 256GB,
����: 1.26kg,
����ǰ : ���͸� ������, ����',
'NT950XCR-G58A.jpg', 
'NT950XCR-G58A.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'ASUS �񺸺� R564DA-BQ774', 
3, 
'3�� ������', 
'Silver',
'CPU: ������5-3500U,
RAM: 8GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
SSD: 512GB,
����: 1.37kg,
����ǰ : ���͸� ������, ����',
'R564DA-BQ774.jpg', 
'R564DA-BQ774.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'�Ｚ���� ��Ʈ�� �÷��� NT550XCR-AD1A', 
3, 
'3�� ������', 
'Silver',
'CPU: ������-5205U,
RAM: 4GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
SSD: 128GB,
����: 1.37kg,
����ǰ : ���͸� ������, ����',
'NT550XCR-AD1A.jpg', 
'NT550XCR-AD1A.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'MSI GF75 Thin 9SC-i7', 
3, 
'3�� ������', 
'Black',
'CPU:  �ھ�i7-9750H,
Graphics:  ������GTX1650,
RAM: 8GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
SSD: 128GB,
����: 1.25kg,
����ǰ : ���͸� ������, ����',
'9SC-i7.jpg', 
'9SC-i7.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'����� ���̵���е� L340-15IRH', 
3, 
'3�� ������', 
'Black',
'CPU:  �ھ�i5-9300HF,
Graphics:  ������GTX1650,
RAM: 4GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
����: 1.3kg,
����ǰ : ���͸� ������, ����',
'L340-15IRH.jpg', 
'L340-15IRH.jpg');

insert into resmanage(resno, resname, rkno, reslocation, rescolor, ressubdesc
, resoriginalimage, resimage)
values(
resno_seq.nextval, 
'LG���� ��Ʈ��PC 15UD70N-GX56K', 
3, 
'3�� ������', 
'Black',
'CPU:  �ھ�i5-10210U,
RAM: 8GB,
ȭ��ũ��: 15��ġ,
�ػ�: 1920x1080(FHD),
����: 1.75kg,
����ǰ : ���͸� ������, ����',
'15UD70N-GX56K.jpg', 
'15UD70N-GX56K.jpg');

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
delete from resreserve where rvno=53;

----------------------------------------------------------------------------