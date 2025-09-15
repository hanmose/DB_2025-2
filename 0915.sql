select 재조업체 from 제품;

select count(재조업체) from 제품;

select count(distinct 재조업체) 제조업체의수 from 제품; 

select count(distinct 주문고객) "주문고객의 수" from 주문;

--그룹별 검색
--주문 테이블에서 주문제품별 수량의 합계를 검색하시오.
select 주문제품, sum(수량) from 주문
                            group by 주문제품 
                            order by 주문제품;
                            
--주문 테이블에서 주문고객별 수량의 평균을 검색하시오.
select 주문고객, avg(수량) from 주문 group by 주문고객 order by 주문고객 desc; 

select * from 고객;

select 등급, avg(적립금) from 고객 group by 등급 order by 등급 asc; 
select 등급, avg(적립금), from 고객 group by 등급,직업 order by 등급 asc; 

--제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품 중 가장 비싼 단가를 검색하시오.(단, 제품의 개수는 제품수, 가장 비싼 단가는 최고가라는 컬럼명으로 출력)
select 재조업체,count(제품명) 제품수,max(단가) 최고가 from 제품 group by 재조업체;

--고객 테이블에서 직업별 나이의 평균과 가장 작은 적립금을 검색하시오.
select 직업,avg(나이) 평균나이 ,min(적립금) 최저적립금 from 고객 group by 직업;

select 재조업체,count(제품명) 제품수,max(단가) 최고가 from 제품 
                                                    group by 재조업체 
                                                    having count(*)>=3;
                                                    
select 재조업체,count(제품명) 제품수,max(단가) 최고가 from 제품 
                                                    group by 재조업체 
                                                    having max(단가)>=4000 and count(*) <= 2 ;
                                                    
-- 고객 테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색하시오
select 등급,count(*), round(avg(적립금),2) "평균 적립금" from 고객 group by 등급  having avg(적립금) >= 1000;

select * from 주문;
--주문테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 검색하시오.
--단, 주문제품,주문고객, 총주문수량을 컬럼으로 출력고 총주문수량이 30개 이상, 주문제품이 p01~p3 까지의 제품만 출력.

select 주문제품, 주문고객, sum(수량) 총주문수량 from 주문 group by 주문제품,주문고객  having sum(수량) >= 30 and 주문제품 in ('p01','p02','p03') order by 주문제품;

--여러 테이블을 조인 검색
--자연 조인(natural join)
--주문테이블과 제품테이블에서 주문번호, 주문고객, 제품명, 단가, 제조업체를 검색하시오.
select 주문번호, 주문고객, 제품명, 단가, 재조업체 from 주문,제품
                                            where 주문제품=제품번호;
                                            
select 제품명 from 주문,제품 where 주문고객='banana' and 주문제품=제품번호;

--고객이름, 나이, 직업, 제품명, 단가, 주문일자, 배송지를 apple 고객이 주문한 정보로 검색하시오.
select 고객이름, 나이, 직업, 제품명, 단가, 주문일자, 배송지 from 주문,제품,고객 where 고객아이디='apple' and 주문제품=제품번호 and 주문고객=고객아이디;

select * from 주문;
select * from 제품;
select * from 고객;

-- 나이가 30세 이상인 고객이 주문한 제품의 번호, 제품명, 주문일자를 검색하시오.
select 주문제품, 나이, 제품명, 주문일자 from 주문,제품,고객 where 나이>=30 and 주문고객=고객아이디 and 주문제품=제품번호; 
                            
