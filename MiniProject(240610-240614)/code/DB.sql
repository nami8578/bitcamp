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


INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('홍길동', 'hong123', 'password123', 'hong@example.com', '010-1234-5678', '서울특별시 강남구 역삼동');
INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('이길동', 'lee123', 'password123', 'lee@example.com', '010-0000-0000', '서울특별시 동대문구 휘경동');
INSERT INTO proMembers (name, id, pw, email, phoneNum, address) VALUES ('테스트', '1111', '1111', 'test@test.com', '010-0000-0000', '서울특별시 동대문구 휘경동');

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
seq_ctnt.nextval, '테스트 글입니다. 1', '1111',
'페이지 확인용 1');

insert into b_content(
content_id, content_title, content_author, content_main
) values(
seq_ctnt.nextval, 'Servlet의 개요 및 실습', 'hong123',
'test중입니다. \n테스트1');
    
insert into b_content(
content_id, content_title, content_author, content_main
) values(
seq_ctnt.nextval, '게시판 미니 프로젝트', 'lee123',
'test중입니다. \n테스트2!');

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
seq_cmt.nextval, 1, 'hong123', '정말 도움이 되는 글이예요bb');


insert into b_comment(
comment_id, content_id, comment_author, comment_main, parent_id
) values(
seq_cmt.nextval, 1, 'lee123', '알아요 ㅋ', 1);


insert into b_comment(
comment_id, content_id, comment_author, comment_main
) values(
seq_cmt.nextval, 2, 'lee123', '퍼가요 ^^');


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
seq_addr.nextval,'1111','김길동','010-3214-2351',
'041-900-2435','kim1212@naver.com','친구','김길동씨의 메모입니다.',0);
insert into b_address values(
seq_addr.nextval,'1111','홍길동','010-7276-5423',
'02-900-2135','hong142@naver.com','친구','홍길동씨의 메모입니다.',0);
insert into b_address values(
seq_addr.nextval,'1111','최길동','010-7784-7856',
'02-757-7555','ch488@naver.com','가족','김길동씨의 메모입니다.',1);
insert into b_address values(
seq_addr.nextval,'1111','박길동','010-7784-7856',
'02-757-7555','ch488@naver.com','가족','김길동씨의 메모입니다.',1);
insert into b_address values(
seq_addr.nextval,'1111','유길동','010-7784-7856',
'02-757-7555','ch488@naver.com','회사','김길동씨의 메모입니다.',1);
insert into b_address values(
seq_addr.nextval,'1111','이주현','010-1552-1553',
'041-135-5331','lee1425@naver.com','회사','이주현씨의 메모입니다.',0);
insert into b_address values(
seq_addr.nextval,'1111','박세연','010-2535-5253',
'02-1243-5233','pk4545@naver.com','학교','박세연씨의 메모입니다.',0);
insert into b_address values(
seq_addr.nextval,'1111','김남희','010-7835-4575',
'02-4574-4535','nh4545@naver.com','학교','김남희씨의 메모입니다.',1);
insert into b_address values(
seq_addr.nextval,'1111','강태욱','010-2535-5253',
'02-1243-5233','pk4545@naver.com','기타','박세연씨의 메모입니다.',0);
insert into b_address values(
seq_addr.nextval,'1111','강길동','010-7835-4575',
'02-4574-4535','nh4545@naver.com','기타','김남희씨의 메모입니다.',1);

select * from b_address;

commit;
