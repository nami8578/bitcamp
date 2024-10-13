--drop table b_comment;
--drop table b_content;
--drop table b_address;
--drop sequence seq_ctnt;
--drop sequence seq_cmt;
--drop sequence seq_addr;
--drop table proMembers;



CREATE TABLE proMembers (
    name VARCHAR2(100) NOT NULL,
    id VARCHAR2(50) PRIMARY KEY,
    pw VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phoneNum VARCHAR2(20) NOT NULL,
    address VARCHAR2(255)
); 


INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('ȫ�浿', 'hong123', 'password123', 'hong@example.com', '010-1234-5678', '����Ư���� ������ ���ﵿ');
INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('�̱浿', 'lee123', 'password123', 'lee@example.com', '010-0000-0000', '����Ư���� ���빮�� �ְ浿');
INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('�׽�Ʈ', '1111', '1111', 'test@test.com', '010-0000-0000', '����Ư���� ���빮�� �ְ浿');

select * from proMembers;
---------------------------------------------------------------------------------------------------------
CREATE TABLE b_content (
content_id number(20) primary key,
content_title varchar2(30) not null,
content_author varchar2(20) not null,
add_date date DEFAULT SYSDATE,
edit_date date DEFAULT SYSDATE,
content_view number(20) default 0,
content_main varchar2(2000) not null,

foreign key(content_author) references proMembers(id) on delete cascade
);
create sequence seq_ctnt
increment by 1
start with 1
minvalue 1
maxvalue 999;

insert into b_content(
content_id, content_title, content_author, content_main
) values(
seq_ctnt.nextval, '�׽�Ʈ ���Դϴ�. 1', '1111',
'������ Ȯ�ο� 1');

insert into b_content(
content_id, content_title, content_author, content_main
) values(
seq_ctnt.nextval, 'Servlet�� ���� �� �ǽ�', 'hong123',
'test���Դϴ�. \n�׽�Ʈ1');
    
insert into b_content(
content_id, content_title, content_author, content_main
) values(
seq_ctnt.nextval, '�Խ��� �̴� ������Ʈ', 'lee123',
'test���Դϴ�. \n�׽�Ʈ2!');

commit;
select * from b_content;


---------------------------------------------------------------------------------------------------------
create table b_comment (
comment_id number(20) primary key,
content_id number(20) not null,
comment_author varchar2(20),
comment_main varchar2(2000),
parent_id number(20) default null,

foreign key(content_id) references b_content(content_id) on delete cascade,
foreign key(comment_author) references proMembers(id) on delete cascade,
foreign key(parent_id) references b_comment(comment_id) on delete cascade
);
create sequence seq_cmt
increment by 1
start with 1
minvalue 1
maxvalue 999;

insert into b_comment(
comment_id, content_id, comment_author, comment_main
) values(
seq_cmt.nextval, 1, 'hong123', '���� ������ �Ǵ� ���̿���bb');


insert into b_comment(
comment_id, content_id, comment_author, comment_main, parent_id
) values(
seq_cmt.nextval, 1, 'lee123', '�˾ƿ� ��', 1);


insert into b_comment(
comment_id, content_id, comment_author, comment_main
) values(
seq_cmt.nextval, 2, 'lee123', '�۰��� ^^');


select * from b_comment;

commit;


---------------------------------------------------------------------------------------------------------
create table b_address (
address_id number(20) primary key,
address_owner varchar2(20),
address_name varchar2(20) not null,
address_phone varchar2(20) not null,
address_home varchar2(20),
address_email varchar2(20),
address_group varchar2(20) not null,
address_memo varchar2(2000),
address_bookmark number default 0,

foreign key(address_owner) references promembers(id) on delete cascade
);

create sequence seq_addr
increment by 1
start with 1
minvalue 1
maxvalue 999;


insert into b_address values(
seq_addr.nextval,'1111','��浿','010-3214-2351',
'041-900-2435','kim1212@naver.com','ģ��','��浿���� �޸��Դϴ�.',0);
insert into b_address values(
seq_addr.nextval,'1111','ȫ�浿','010-7276-5423',
'02-900-2135','hong142@naver.com','ģ��','ȫ�浿���� �޸��Դϴ�.',0);
insert into b_address values(
seq_addr.nextval,'1111','�ֱ浿','010-7784-7856',
'02-757-7555','ch488@naver.com','����','��浿���� �޸��Դϴ�.',1);
insert into b_address values(
seq_addr.nextval,'1111','�ڱ浿','010-7784-7856',
'02-757-7555','ch488@naver.com','����','��浿���� �޸��Դϴ�.',1);
insert into b_address values(
seq_addr.nextval,'1111','���浿','010-7784-7856',
'02-757-7555','ch488@naver.com','ȸ��','��浿���� �޸��Դϴ�.',1);
insert into b_address values(
seq_addr.nextval,'1111','������','010-1552-1553',
'041-135-5331','lee1425@naver.com','ȸ��','���������� �޸��Դϴ�.',0);
insert into b_address values(
seq_addr.nextval,'1111','�ڼ���','010-2535-5253',
'02-1243-5233','pk4545@naver.com','�б�','�ڼ������� �޸��Դϴ�.',0);
insert into b_address values(
seq_addr.nextval,'1111','�賲��','010-7835-4575',
'02-4574-4535','nh4545@naver.com','�б�','�賲���� �޸��Դϴ�.',1);
insert into b_address values(
seq_addr.nextval,'1111','���¿�','010-2535-5253',
'02-1243-5233','pk4545@naver.com','��Ÿ','�ڼ������� �޸��Դϴ�.',0);
insert into b_address values(
seq_addr.nextval,'1111','���浿','010-7835-4575',
'02-4574-4535','nh4545@naver.com','��Ÿ','�賲���� �޸��Դϴ�.',1);

select * from b_address;

commit;
