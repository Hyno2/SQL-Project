DROP TABLE FOOD;
DROP TABLE PRODUCT;
DROP TABLE JAEGO;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

CREATE TABLE PRODUCT( -- 품목 테이블
    CODE VARCHAR2(10) PRIMARY KEY, -- 품목분류코드 
    KINDOF VARCHAR2(20) -- 품목 종류
);
CREATE TABLE JAEGO( -- 재고테이블
    CODE VARCHAR2(10) PRIMARY KEY, -- 음식 코드
    NAME VARCHAR2(50)              -- 음식 이름 
   
);
CREATE TABLE FOOD(                  -- 음식 테이블 
    FCODE VARCHAR2(10),             -- 품목분류하기위한 코드
    JCODE VARCHAR2(10) PRIMARY KEY, -- 음식 코드
    CNT INT,                        -- 재고량
    PRICE INT,                      -- 음식 가격
    COMPANY VARCHAR2(30)            -- 제조사
);

ALTER TABLE FOOD ADD CONSTRAINT FK_FCODE FOREIGN KEY(FCODE) REFERENCES PRODUCT(CODE);   -- 음식테이블의 품목분류하기위한코드(FCODE)는 
                                                                                        -- 품목테이블의 품목분류코드(CODE)를 참조함
ALTER TABLE FOOD ADD CONSTRAINT FK_JCODE FOREIGN KEY(JCODE) REFERENCES JAEGO(CODE);     -- 음식테이블의 음식코드(JCODE)는
                                                                                        -- 재고테이블의 재고코드를 참조함
--  품목 테이블 데이터 추가. 품목분류코드(CODE), 품목종류(KINDOF) 
INSERT INTO PRODUCT VALUES ('AB01', '간편식사');
INSERT INTO PRODUCT VALUES ('AB02', '과자');
INSERT INTO PRODUCT VALUES ('AB03', '아이스크림');
INSERT INTO PRODUCT VALUES ('AB04', '식품');
INSERT INTO PRODUCT VALUES ('AB05', '음료');

-- 품목 테이블 출력
SELECT * FROM PRODUCT;

-- 재고 테이블 데이터 추가 음식코드(CODE), 음식이름(NAME)
INSERT INTO JAEGO VALUES ('111', '햇반');
INSERT INTO JAEGO VALUES ('222', '컵반');
INSERT INTO JAEGO VALUES ('333', '포카칩');
INSERT INTO JAEGO VALUES ('444', '스윙칩');
INSERT INTO JAEGO VALUES ('555', '김밥');

-- 재고 테이블 출력
SELECT * FROM JAEGO;

-- 음식 테이블 데이터 추가 품목분류위한코드(FCODE), 음식코드(JCODE), 재고량(CNT), 음식가격(PRICE), 제조사(COMPANY)
INSERT INTO FOOD VALUES ('AB01', '111', 10, 1500, 'CJ');
INSERT INTO FOOD VALUES ('AB01', '222', 20, 2000, '오뚜기');
INSERT INTO FOOD VALUES ('AB02', '333', 30, 3000, '농심');
INSERT INTO FOOD VALUES ('AB02', '444', 40, 4000, '롯데');
INSERT INTO FOOD VALUES ('AB04', '555', 50, 5000, 'PB');
INSERT INTO FOOD VALUES ('AB01', '111', 10, 1500, 'CJ');


-- 음식 테이블 출력
SELECT * FROM FOOD;


-------------------------------------조회-------------------------------------
-- 1. 모든 테이블 JOIN해서 모두 조회
SELECT PRODUCT.CODE 상품코드, PRODUCT.KINDOF 상품분류,
JAEGO.CODE 음식코드, FOOD.CNT 재고량,
 JAEGO.NAME 음식명, FOOD.PRICE 가격, FOOD.COMPANY 제조사 
FROM PRODUCT, JAEGO, FOOD 
WHERE FOOD.fcode = PRODUCT.code and FOOD.jcode = jaego.code; 
commit;

-- 2.회사별 가장 비싼 상품 회사명, 상품이름, 가격 출력하기
SELECT COMPANY 제조사, JAEGO.NAME 상품명, MAX(PRICE) 최고가격 FROM FOOD,JAEGO WHERE FOOD.jcode = jaego.code
GROUP BY COMPANY, NAME ;
COMMIT;

-- 3. 이름으로 ''일 경우 검색 후 음식코드,음식명,가격,재고량,제조사 출력하기

-- 4. 음식코드를 검색시 음식명, 가격, 
