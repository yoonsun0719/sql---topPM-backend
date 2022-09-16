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