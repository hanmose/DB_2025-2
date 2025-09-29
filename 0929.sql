select * from 고객;
-- 고객테이블에 고객아이디는 strawberry, 고객이름 최유경, 나이 30세, 등급 vip, 직업은 공무원, 적립금 100원인 고객의 정보를 삽입(추가)하시오.
-- 속성(컬럼,필드)리스트를 생략하여 추가
insert  into 고객 values('strawberry', '최유경', 30, 'vip', '공무원', 100);

-- 고객테이블에 고객아이디는 kiwi, 고객이름 김키위, 나이 25세, 등급 gold, 직업은 학생, 적립금 500원인 고객의 정보를 삽입(추가)하시오.
-- 속성(컬럼,필드)리스트를 작성하여 추가
insert  into 고객(고객아이디, 고객이름, 직업, 나이, 등급, 적립금) values('kiwi', '김키위', '학생', 23, 'silver', 500);

-- 고객테이블에 고객아이디는 grapes, 고객이름 강포도, 등급 gold, 직업은 의사, 적립금 1500원인 고객의 정보를 삽입(추가)하시오.
-- 속성(컬럼,필드)리스트를 작성하여 추가
insert  into 고객(고객아이디, 고객이름, 직업, 등급, 적립금) values('grapes', '강포도', '의사', 'gold', 1500);

-- 한빛제품 테이블 
  CREATE TABLE 한빛제품 
   (	    
	제품명 VARCHAR2(20) NOT NULL, 
	재고량 NUMBER, 
	단가 NUMBER,
    PRIMARY KEY(제품명)
    );
    
-- Sub Query를 사용하서 행추가  
INSERT INTO 한빛제품(제품명, 재고량, 단가)
                SELECT 제품명, 재고량, 단가 FROM 제품 WHERE 재조업체='한빛제과';
                
SELECT * FROM 한빛제품;

-- 데이터 업데이트(수정)
-- 제품테이블에서 제품번호가 p05인 제품의 제품명을 신나라면, 가격을 2000원으로 수정하시오.
-- UPDATE 테이블명 SET 컬럼명=값 WHERE 조건
UPDATE 제품 SET 제품명='신나라면', 단가=2000 WHERE 제품번호='p05';

SELECT * FROM 제품;

-- 제품테이블에서 모든 제품의 단가를 20% 인상된 금액으로 수정하시오.
UPDATE 제품 SET 단가=단가*1.2;

-- UPDATE 조건절에 SubQuery 사용
-- 정소화 고객이 주문한 제품의 주문수량을 5개로 수정하시오.
UPDATE 주문 SET 수량=5 WHERE 주문고객 IN(SELECT 고객아이디 FROM 고객 WHERE 고객이름='정소화');
select * from 주문;

-- delete(행삭제)
-- 한빛제품테이블에서 단가가 1000원 이상 2500원 이하인 행들을 삭제하시오.
delete from 한빛제품 where 단가>=1000 and 단가 <=2500;
delete from 한빛제품 where 단가 between 1000 and 2500;
select * from 한빛제품;

-- 고객이름이 김키위인 고객의 정보를 삭제하시오
delete from 고객 where 고객이름 = '김키위';
select * from 고객;

-- View는 논리적인 가상테이블
-- 기존에 생성해서 사용한 테이블은 물리적 장치에 저장됨
-- View 생성 방법
-- 고객테이블 등급이 vip인 고객의 고객아이티, 고객이름, 나이, 등급으로 구성된 View를 우수고객이라는 이름으로 생성하시오
create View 우수고객(고객아이디, 고객이름, 나이, 등급) 
        as select 고객아이디, 고객이름, 나이, 등급 from 고객 where 등급='vip'
                with check option;
                
select * from 우수고객;        

-- 제품테이블에서 제조업체별 제품수로 구성된 업체별제품수라는 이름의 View를 생성해보자.
create view 업체별제품수(제조업체, 제품수)
    as select 제조업체, count(*) from 제품
        group by 제조업체
        with check option;
        
select * from 업체별제품수;

-- 나이가 30세 이상인 우수고객을 검색(조회)하시오.
    select * from 우수고객
        where 나이>=30;     
        
create view 제품1(제품명,재고량,제조업체) as select 제품명,재고량,재조업체 from 제품;

select * from 제품1;        
        
-- 제품2 view에 제품번호 p08, 재고량 1000, 제조업체 신선식품인 제품의 정보를 삽입하시오.
select * from 제품1;

create view 제품2(제품번호, 재고량, 제조업체)
    as select 제품번호, 재고량, 재조업체 from 제품
         with check option;

insert into 제품2 values('p08', 1000, '신선식품');

select * from 제품2;
select * from 제품;

-- 가상테이블 삭제
drop view 제품1;        