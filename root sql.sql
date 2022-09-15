create database petshop;

use petshop;

/*유저테이블*/
CREATE TABLE USER_TBL (
	USER_ID	INT auto_increment	NOT NULL PRIMARY KEY COMMENT '유저 고유 번호 (PK)',
	USER_NICKNAME	VARCHAR(30)	NULL	COMMENT '유저 아이디',
	USER_PW	VARCHAR(30)	NULL	COMMENT '유저 비밀번호',
	USER_NAME	VARCHAR(30)	NULL	COMMENT '유저 이름',
	USER_EMAIL	VARCHAR(30)	NULL,
	USER_ADDR_1	VARCHAR(30)	NULL,
	USER_ADDR_2	VARCHAR(30)	NULL,
	USER_TEL	VARCHAR(30)	NULL,
	USER_REG_DATE	DATE	NULL,
	USER_DEL_DATE	DATE	NULL,
	USER_DEL_YN	VARCHAR(2)	NULL,
	USER_PET_TYPE	VARCHAR(2)	NULL
);

/*게시판테이블*/
create table board_tbl(
	board_id int auto_increment not null primary key comment '게시판 고유번호(pk)',
    b_user_id int not null comment '유저pk',
    board_writer varchar(30) comment '게시글 작성자 ----> user_tbl nickname 참조',
    board_title varchar(30) comment '게시글제목',
    board_content varchar(100) comment '게시글내용',
    board_reg_date DATE DEFAULT (current_date) comment'게시글작성일',
    board_see int default 0 comment '게시글조회수',
    board_del_yn varchar(2) null,
    foreign key (b_user_id) references user_tbl (user_id)
);

alter table board_tbl modify board_content varchar(1000);
alter table board_tbl modify board_title varchar(1000);
alter table board_tbl add board_del_yn varchar(2) default 'N';
alter table user_tbl add oauth varchar(20) default null; /*카카오 or 구글 or 일반 로그인인지*/
update board_tbl set board_del_yn='N' where board_id=16;

alter table board_tbl drop board_del_yn;

insert into board_tbl (b_user_id, board_writer, board_title, board_content) values ("1","1","2번째 더미데이터입니다","2번째 더미데이터에는 테스트용으로 내용이 입력됩니다.");

select * from board_tbl;

select * from user_tbl;

desc board_tbl;

select BOARD_ID, BOARD_WRITER, BOARD_TITLE, BOARD_CONTENT from BOARD_TBL;

select * from board_tbl where b_user_id = '3';
 
select user_id, user_pw from user_tbl where user_id = '1';

delete from board_tbl where board_id=45;


/* 테이블 데이터 삭제하기 */
delete from user_tbl where user_id = 10;
select * from user_tbl;

/*auto_increment 지정하기*/
alter table user_tbl auto_increment = 4;

/* 테이블삭제
drop table user_tbl;
drop table board_tbl;
*/

SELECT U.user_id, U.user_pw FROM user_tbl AS U WHERE U.user_id = 1;

UPDATE board_tbl b SET b.board_title = '더미데이터', b.board_content = '더미데이터내용', b.board_reg_date = DATE_FORMAT(now(), '%Y-%m-%d') where b.board_id = '2';
        
UPDATE board_tbl b SET b.board_title = '더미데이터', b.board_content = '더미데이터내용' WHERE b.board_id = '2';      
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
/********************************************************************************/        
        
        use topPM;


/* 어드민 계정 테이블 생성 */
create table admin_user
(
    admin_uuid varchar(255) not null primary key,
    admin_id   varchar(45)  null,
    admin_pw   varchar(45)  null
) comment '어드민 계정 관리' collate = utf8_bin;


-- 문의 테이블 생성
create table request_list
(
	seq 		   INT AUTO_INCREMENT PRIMARY KEY not null comment '시퀀스 번호',
    uuid           varchar(255) collate utf8_bin not null comment '고유 아이디',
    title          varchar(255) collate utf8_bin null comment '제목',
    now_state      varchar(255) collate utf8_bin null comment '이주 사유',
    necessary_task varchar(255) collate utf8_bin null comment '필요 정보1',
    time           varchar(255) collate utf8_bin null comment '필요 정보2',
    corporate_name varchar(255) collate utf8_bin null comment '회사 상호',
    corporate_tel  varchar(255) collate utf8_bin null comment '회사 전화 번호',
    staff_name     varchar(255) collate utf8_bin null comment '담당자 이름',
    requested_date varchar(255) collate utf8_bin null comment '요청 일자',
    state          varchar(2) collate utf8_bin   null comment '상태'
);

select * from request_list;
drop table request_list;

-- 어드민 계정 생성
insert into admin_user (admin_uuid, admin_id, admin_pw) values (REPLACE(UUID(), '-', ''), 'yoonsun', '1234');
select * from admin_user;
delete from admin_user where admin_uuid='0d1652570ee611eda5aa10510767f588';