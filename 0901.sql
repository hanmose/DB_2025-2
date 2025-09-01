-- 제품테이블에 데이터 행들을 추가

insert into 제품 values('p01','그냥만두', 5000, 4500,'대한식품'),
                       ('p02','매운쫄면', 2500, 4500,'민국푸드'),
                       ('p03','쿵떡파이', 3600, 4500,'한빛제과'),
                       ('p04','맛난초콜릿', 1250, 4500,'한빛제과'),
                       ('p05','얼큰라면', 2200, 4500,'대한식품'),
                       ('p06','통통우동', 1000, 4500,'민국푸드'),
                       ('p07','달콤비스킷', 1650, 1500,'한빛제과');
                       
select * from 제품 order by 제품번호;

--주문 테이블에 데이터 행들을 추가

insert into 주문 values                     ('p01','apple', 'p03', 10,'서울시 마포구','2022-01-01');
insert into 주문 values                     ('p02','melon', 'p01', 5,'인천시 계양구','2022-01-10');
insert into 주문 values                     ('p03','banana', 'p06', 45,'경기도 부천시','2022-01-11');
insert into 주문 values                     ('p04','carrot', 'p02', 8,'부산시 금정구','2022-02-01');
insert into 주문 values                     ('p05','melon', 'p06', 36,'경기도 용인시','2022-02-20');
insert into 주문 values                     ('p06','banana', 'p01', 19,'충청북도 보은군','2022-03-02');
insert into 주문 values                     ('p07','apple', 'p03', 22,'서울시 영등포구','2022-03-15');
insert into 주문 values                     ('p08','pear', 'p02', 50,'강원도 춘천시','2022-04-10');
insert into 주문 values                     ('p09','banana', 'p04', 15,'전라남도 목포시','2022-04-11');
insert into 주문 values                     ('p10','carrot', 'p03', 20,'경기도 안양시','2022-05-22');

                       
--중복행을 허용한 결과행 (모든행을 조회)
select 주문고객 from 주문;
select all 주문고객 from 주문;

--중복행을 허용하지 않는 결과행
select distinct 주문고객 from 주문;

-- 고객아이디, 고객이름, 등급 컬럼만 고객테이블 조회(검색)하시요.
select 고객아이디, 고객이름,등급 from 고객;

--주문고객
SELECT 주문고객 as 주문아이디 ,주문제품, 배송지, 주문일자 FROM 주문;

--제품명, 단가 속성을 제품테이블에서 조회(단가 + 500,단가 => 조정 단가라는 가상컬럼명)
select 제품명,(단가+500) as 조정단가 from 제품;

select 고객이름,나이,직업 from 고객 where 직업='회사원';

select 주문제품,수량,주문일자
from 주문 where 주문고객='apple' and 수량 >=15;

select 고객이름,나이,직업 from 고객 where 직업='회사원' and 나이 < 33;

select 주문제품,수량,주문일자,주문고객 from 주문 where 주문고객='apple' or 수량 >=15;

select 고객이름, 등급, 직업 from 고객 where 등급='gold' or 직업='의사';

select 제품명,단가,재조업체 from 제품 where 단가 >=2000 and 단가 <=3000;

select 나이,등급,직업 from 고객 where 나이 >=20 and 나이 <=30 and (등급='gold' or 등급='silver') and 직업 = '학생';
