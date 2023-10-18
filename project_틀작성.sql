DROP TABLE CATEGORY;
DROP TABLE FOOD;
DROP TABLE INVENTORY;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

DROP SEQUENCE FOOD_BARCODE;         -- 상품코드 시퀀스 
DROP SEQUENCE INVENTORY_BARCODE;    -- 인벤토리 시퀀스

CREATE SEQUENCE FOOD_BARCODE START WITH 846543 INCREMENT BY 17; -- 상품코드 846543부터 시작해서 17씩 증가
CREATE SEQUENCE INVENTORY_BARCODE START WITH 846543 INCREMENT BY 17; -- 인벤토리코드 846543부터 시작해서 17씩 증가

CREATE TABLE CATEGORY(              -- 품목 테이블 (이 테이블의 데이터값은 고정)
    CODE VARCHAR2(10) PRIMARY KEY,  -- 품목분류코드 
    KIND VARCHAR2(20)               -- 품목 분류
);
CREATE TABLE FOOD(                  -- 상품 테이블
    CODE INT DEFAULT FOOD_BARCODE.NEXTVAL PRIMARY KEY,  -- 상품 코드(상품마다 다름, 시퀀스 사용)
    NAME VARCHAR2(50),              -- 상품명 
    COMPANY VARCHAR2(30)            -- 제조회사명
);
CREATE TABLE INVENTORY(             -- 관리 테이블 
    CATEGORY_CODE VARCHAR2(10),     -- 품목분류하기위한 코드 (외래키) -- CATEGORY 테이블의 CODE랑 연결
    FOOD_CODE INT DEFAULT INVENTORY_BARCODE.NEXTVAL, -- 상품 코드(외래키) -- FOOD 테이블의 CODE랑 연결
    CNT INT,          -- 재고량
    PRICE INT                     -- 음식 가격
);
-- CATEGORY 테이블의 CODE를 참조하여 INVENTORY 테이블의 CATEGORY_CODE를 외래키로 지정
ALTER TABLE INVENTORY ADD CONSTRAINT FK_CATEGORY_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CODE);   
                                                                                                           
 -- FOOD 테이블의 CODE를 참조하여 INVENTORY 테이블의 FOOD_CODE를 외래키로 지정                                                                                      
ALTER TABLE INVENTORY ADD CONSTRAINT FK_FOOD_CODE FOREIGN KEY(FOOD_CODE) REFERENCES FOOD(CODE);     
                                                                                       
-- CATEGORY 테이블 데이터 추가/ 품목분류코드(CODE), 품목 분류(KIND) 
INSERT INTO CATEGORY VALUES ('AB01', '간편식사');    -- 현오
INSERT INTO CATEGORY VALUES ('AB02', '과자');       -- 효정
INSERT INTO CATEGORY VALUES ('AB03', '아이스크림');   -- 인혁
INSERT INTO CATEGORY VALUES ('AB04', '식품');       --효정
INSERT INTO CATEGORY VALUES ('AB05', '음료');        -- 광수

-- CATEGORY 테이블 출력
SELECT * FROM CATEGORY;

-- FOOD 테이블 데이터 추가/ 상품명(NAME), 회사명(COMPANY)
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반' ,'회사이름');

-- FOOD 테이블 출력
SELECT * FROM FOOD;

-- 관리 테이블 데이터 추가/ 품목 코드(FOOD_CODE), 재고(CNT), 가격(PRICE), 
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500);

-- 관리 테이블 출력
SELECT * FROM INVENTORY;

COMMIT;
-------------------------------------조회-------------------------------------
-- 1. 모든 테이블 JOIN해서 모두 조회
--SELECT CATEGORY.CODE 상품코드, CATEGORY.KIND 상품분류,
--INVENTORY.CODE 음식코드, FOOD.CNT 재고량,
-- INVENTORY.NAME 음식명, FOOD.PRICE 가격, FOOD.COMPANY 제조사 
--FROM CATEGORY, INVENTORY, FOOD 
--WHERE FOOD.FOOD_CODE = CATEGORY.code and FOOD.CATEGORY_CODE = INVENTORY.code; 
--commit;
--
---- 2.회사별 가장 비싼 상품 회사명, 상품이름, 가격 출력하기
--SELECT COMPANY 제조사, INVENTORY.NAME 상품명, MAX(PRICE) 최고가격 FROM FOOD,INVENTORY WHERE FOOD.CATEGORY_CODE = INVENTORY.code
--GROUP BY COMPANY, NAME ;
--COMMIT;

-- 3. 이름으로 ''일 경우 검색 후 음식코드,음식명,가격,재고량,제조사 출력하기

-- 4. 음식코드를 검색시 음식명, 가격, 
