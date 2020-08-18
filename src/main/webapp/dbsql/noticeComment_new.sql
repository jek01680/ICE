/* �������״�� */
drop table noticeComment;
CREATE TABLE noticeComment (
	no NUMBER NOT NULL, /* ��۹�ȣ */
	noticeNo NUMBER, /* �Խñ۹�ȣ */
	memNo VARCHAR2(50), /* �����ȣ */
	name VARCHAR2(50), /* ����� */
	content CLOB NOT NULL, /* ���� */
	regdate DATE DEFAULT sysdate /* �ۼ��� */
);

create or replace view noticeCommentView
as
select c.No,c.noticeNo,c.MEMNO,m.name, c.content, c.regdate from 
noticeComment c join member m
on c.memNo = m.memNo;

drop sequence noticeComment_seq;
create sequence noticeComment_seq
start with 1
increment by 1;

COMMENT ON TABLE noticeComment IS '�������״��';

COMMENT ON COLUMN noticeComment.no IS '��۹�ȣ';

COMMENT ON COLUMN noticeComment.noticeNo IS '�Խñ۹�ȣ';

COMMENT ON COLUMN noticeComment.memNo IS '�����ȣ';

COMMENT ON COLUMN noticeComment.name IS '�����';

COMMENT ON COLUMN noticeComment.content IS '����';

COMMENT ON COLUMN noticeComment.regdate IS '�ۼ���';

CREATE UNIQUE INDEX PK_noticeComment
	ON noticeComment (
		no ASC
	);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT PK_noticeComment
		PRIMARY KEY (
			no
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_notice_TO_noticeComment
		FOREIGN KEY (
			noticeNo
		)
		REFERENCES notice (
			noticeNo
		);

ALTER TABLE noticeComment
	ADD
		CONSTRAINT FK_MEMBER_TO_noticeComment
		FOREIGN KEY (
			memNo
		)
		REFERENCES MEMBER (
			MEMNO
		);
		
commit;

select * from noticeComment;