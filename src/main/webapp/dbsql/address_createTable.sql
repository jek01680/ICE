/* �ּ� */
DROP TABLE address CASCADE CONSTRAINTS;

/* �ּҷϱ׷� */
DROP TABLE addressGroup CASCADE CONSTRAINTS;


/* �ּ� */
CREATE TABLE address (
	adNo NUMBER NOT NULL, /* �ּҷϹ�ȣ */
	memNo VARCHAR2(50) NOT NULL, /* �����ȣ */
	name VARCHAR2(50) NOT NULL, /* ����� */
	hp1 VARCHAR2(20), /* ��ȭ��ȣ1 */
	hp2 VARCHAR2(20), /* ��ȭ��ȣ2 */
	hp3 VARCHAR2(20), /* ��ȭ��ȣ3 */
	email1 VARCHAR2(50), /* �̸���1 */
	email2 VARCHAR2(50), /* �̸���2 */
	adgNo NUMBER, /* �׷��ȣ */
	company VARCHAR2(100), /* ȸ���/�ŷ�ó�� */
	deptName VARCHAR2(100), /* �μ� */
	posName VARCHAR2(100), /* ���� */
	homeAddress VARCHAR2(300), /*���ּ�*/
	homePage VARCHAR2(200),  /*Ȩ������*/
	messenger VARCHAR2(200),  /*�޽���*/
	SNS VARCHAR2(200),  /*SNS*/
	memo VARCHAR2(1500),  /*�޸�*/
	isFavorite VARCHAR2(10), /* ���ã�� ���� */
	isDeleted Date /* ����(������) */
);

ALTER TABLE address
	ADD
		CONSTRAINT PK_address
		PRIMARY KEY (
			adNo
		);

/* �ּҷϱ׷� */
CREATE TABLE addressGroup (
	adgNo NUMBER NOT NULL, /* �׷��ȣ */
	groupName VARCHAR2(30) /* �׷�� */
);

ALTER TABLE addressGroup
	ADD
		CONSTRAINT PK_addressGroup
		PRIMARY KEY (
			adgNo
		);

ALTER TABLE address
	ADD
		CONSTRAINT FK_addressGroup_TO_address
		FOREIGN KEY (
			adgNo
		)
		REFERENCES addressGroup (
			adgNo
		);

ALTER TABLE address
	ADD
		CONSTRAINT FK_member_TO_address
		FOREIGN KEY (
			memNo
		)
		REFERENCES member (
			memNo
		);