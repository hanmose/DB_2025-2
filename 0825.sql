--DDL
--Table 생성
create table 고객(
    고객아이디 VARCHAR(20) not null primary key,
    고객이름 varchar(10) not null,
    나이 INT,
    등급 varchar(10) not null,
    직업 VARCHAR(20),
    적립금 INT DEFAULT 0
);

create table 제품(
    제품번호 varchar(5) not null,
    제품명 VARCHAR(20),
    재고량 INT,
    단가 INT,
    제조업체 varchar(20),
    primary key(제품번호),
    check(재고량>=0 and 재고량<=10000)
);


create table 주문(
    주문번호 varchar(5) not null,
    주문고객 VARCHAR(20),
    주문제품 varchar(5),
    수량 INT,
    배송지 varchar(30),
    주문일자 DATE,
    primary key(주문번호),
    FOREIGN key(주문고객) REFERENCES 고객(고객아이디),
    FOREIGN key(주문제품) REFERENCES 제품(제품번호)
);

create table 배송업체(
    업체번호 varchar(5) not null primary key,
    업체명 varchar(20),
    주소 varchar(100),
    전화번호 varchar(20)
);

--테이블 변경
    alter table 고객 
        add 가입날짜 date;

    alter table 고객 
        drop column 가입날짜;