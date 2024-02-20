-- 트리거 사용하기위해 서버 아웃풋을 ON 시킨다
SET SERVEROUTPUT ON;

DROP TABLE INVENTORY;
DROP TABLE CATEGORY;
DROP TABLE COMPANY;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

DROP SEQUENCE FOOD_BARCODE;         -- 상품코드 시퀀스 
DROP SEQUENCE INVENTORY_BARCODE;    -- 인벤토리 시퀀스

CREATE SEQUENCE FOOD_BARCODE START WITH 846543 INCREMENT BY 17; -- 상품코드 846543부터 시작해서 17씩 증가
CREATE SEQUENCE INVENTORY_BARCODE START WITH 846543 INCREMENT BY 17; -- 인벤토리코드 846543부터 시작해서 17씩 증가

CREATE TABLE CATEGORY(              -- 품목 테이블 (이 테이블의 데이터값은 고정)
    CODE VARCHAR2(10) PRIMARY KEY,  -- 품목분류코드 
    KIND VARCHAR2(20)               -- 품목 분류
);
CREATE TABLE COMPANY(                  -- 회사 테이블
    CODE INT DEFAULT FOOD_BARCODE.NEXTVAL PRIMARY KEY,  -- 상품 코드(상품마다 다름, 시퀀스 사용)
    COMPANY VARCHAR2(30)            -- 제조회사명
);
CREATE TABLE INVENTORY(             -- 관리 테이블 
    CATEGORY_CODE VARCHAR2(10),     -- 품목분류하기위한 코드 (외래키) -- CATEGORY 테이블의 CODE랑 연결
    FOOD_CODE INT DEFAULT INVENTORY_BARCODE.NEXTVAL, -- 상품 코드(외래키) -- COMPANY 테이블의 CODE랑 연결
    NAME VARCHAR2(50),              -- 상품명 
    CNT INT ,                        -- 재고량
    PRICE INT                     -- 음식 가격
);
-- CATEGORY 테이블의 CODE를 참조하여 INVENTORY 테이블의 CATEGORY_CODE를 외래키로 지정
ALTER TABLE INVENTORY ADD CONSTRAINT FK_CATEGORY_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CODE);   
                                                                                                           
 -- COMPANY 테이블의 CODE를 참조하여 INVENTORY 테이블의 FOOD_CODE를 외래키로 지정                                                                                      
ALTER TABLE INVENTORY ADD CONSTRAINT FK_FOOD_CODE FOREIGN KEY(FOOD_CODE) REFERENCES COMPANY(CODE);     
                                                                                       
-- CATEGORY 테이블 데이터 추가/ 품목분류코드(CODE), 품목 분류(KIND) 
INSERT INTO CATEGORY VALUES ('AB01', '간편식사');    -- 현오
INSERT INTO CATEGORY VALUES ('AB02', '과자');       -- 효정
INSERT INTO CATEGORY VALUES ('AB03', '아이스크림');   -- 인혁
INSERT INTO CATEGORY VALUES ('AB04', '식품');       --효정
INSERT INTO CATEGORY VALUES ('AB05', '음료');        -- 광수

-- CATEGORY 테이블 출력
SELECT * FROM CATEGORY;

-- COMPANY 테이블 데이터 추가/ 회사명(COMPANY)
-- 간편식사 데이터 추가
INSERT INTO COMPANY(COMPANY) VALUES ('PB');
INSERT INTO COMPANY(COMPANY) VALUES ('PB');
INSERT INTO COMPANY(COMPANY) VALUES ('PB');
INSERT INTO COMPANY(COMPANY) VALUES ('PB');
INSERT INTO COMPANY(COMPANY) VALUES ('PB');
-- 과자 데이터 추가
INSERT INTO COMPANY(COMPANY) VALUES ('크라운');
INSERT INTO COMPANY(COMPANY) VALUES ('오리온');
INSERT INTO COMPANY(COMPANY) VALUES ('크라운');
INSERT INTO COMPANY(COMPANY) VALUES ('해태');
INSERT INTO COMPANY(COMPANY) VALUES ('프링글스');
-- 아이스크림 데이터 추가
INSERT INTO COMPANY(COMPANY) VALUES ('롯데');
INSERT INTO COMPANY(COMPANY) VALUES ('빙그레');
INSERT INTO COMPANY(COMPANY) VALUES ('롯데');
INSERT INTO COMPANY(COMPANY) VALUES ('허쉬');
INSERT INTO COMPANY(COMPANY) VALUES ('서주');
-- 식품 데이터 추가
INSERT INTO COMPANY(COMPANY) VALUES ('삼양');
INSERT INTO COMPANY(COMPANY) VALUES ('오뚜기');
INSERT INTO COMPANY(COMPANY) VALUES ('오뚜기');
INSERT INTO COMPANY(COMPANY) VALUES ('농심');
INSERT INTO COMPANY(COMPANY) VALUES ('삼양');
-- 음료 데이터 추가
INSERT INTO COMPANY(COMPANY) VALUES ('코카콜라');
INSERT INTO COMPANY(COMPANY) VALUES ('코카콜라');
INSERT INTO COMPANY(COMPANY) VALUES ('롯데');
INSERT INTO COMPANY(COMPANY) VALUES ('롯데');
-- COMPANY 테이블 출력
SELECT * FROM COMPANY;

-- 관리 테이블 데이터 추가/ 상품이름(NAME), 품목 코드(FOOD_CODE), 재고(CNT), 가격(PRICE), 
-- 간편식사 데이터 입력
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('후라이드치킨' ,'AB01', 3, 9900); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('소시지바' ,'AB01', 2, 2400); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('브라우니쿠키' ,'AB01', 10, 1000); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('글레이즈드도넛' ,'AB01', 15, 1300); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('뉴자이언트지파이' ,'AB01', 4, 2900); 
-- 과자 데이터 추가
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('콘칩', 'AB02', 15, 3000);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('다이제' ,'AB02', 13, 2000);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('화이트하임','AB02', 42, 3300);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('버터링쿠키','AB02', 18, 1700);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('프링글스오리지널','AB02', 24, 4000);
-- 아이스크림 데이터 추가
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('스크류바', 'AB03', 13, 1500);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('떡붕어싸만코', 'AB03', 18, 2200);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('옥동자딸기', 'AB03', 21, 1500);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('딸기초코바', 'AB03', 14, 2500);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('피치리치바', 'AB03', 6, 1500);
-- 식품 데이터 추가
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('맵탱청양대파라면컵', 'AB04', 20, 1800);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('컵누들소컵', 'AB04', 25, 1800);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('열라면봉지', 'AB04', 18, 1500);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('라면왕김통깨사발', 'AB04', 18, 1800);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('간짬뽕컵', 'AB04', 7, 1800);
-- 음료 데이터 추가
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('코크제로레전드355','AB05', 13, 2000); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('코카콜라제로','AB05', 13, 2000); 
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('펩시콜라제로캔355','AB05', 13, 19000);
INSERT INTO INVENTORY(NAME,CATEGORY_CODE,CNT,PRICE) VALUES ('펩시콜라캔350','AB05', 13, 19000);

-- 관리 테이블 출력
SELECT * FROM INVENTORY;

COMMIT;
-------------------------------------조회-------------------------------------
-- 모든 테이블 JOIN해서 모두 조회
SELECT * FROM INVENTORY JOIN COMPANY ON INVENTORY.FOOD_CODE = COMPANY.CODE JOIN CATEGORY ON CATEGORY.CODE = INVENTORY.CATEGORY_CODE; 
-- 모든 테이블 조회 하면 겹치는 속성값(상품코드,카테고리코드)도 나오니까 필요한 정보들만 속성 뽑아서 뷰 만들기.
CREATE VIEW ALL_INFO AS
SELECT KIND, NAME, PRICE, CNT, COMPANY, FOOD_CODE 음식코드 FROM COMPANY, CATEGORY, INVENTORY WHERE INVENTORY.FOOD_CODE = COMPANY.CODE AND CATEGORY.CODE = INVENTORY.CATEGORY_CODE;
-- 만들어진 뷰 조회(뷰 이름 : ALL_INFO)
SELECT * FROM ALL_INFO;
-- 회사별 상품 종류
SELECT COMPANY, COUNT(*) 상품종류 FROM ALL_INFO GROUP BY COMPANY;
-- 회사별 상품이 3개 종류 이상 출력
SELECT COMPANY, COUNT(*) 상품종류 FROM ALL_INFO GROUP BY COMPANY HAVING COUNT(*) >= 3;
-- 특정 이름을 검색 후(EX.딸기) 음식코드 ,종류 ,음식명 ,가격 ,재고량 ,제조사 출력하기
SELECT * FROM ALL_INFO WHERE NAME LIKE '%딸기%'; 
-- 제일 낮은 가격의 상품 정보를 출력하기 (중첩질의문 사용)
SELECT * FROM ALL_INFO WHERE PRICE = (SELECT MIN(PRICE) FROM ALL_INFO);
-------------------------- 수정-----------------------------------------
-- 1. 품목 새로 생길때 INVENTORY 테이블에 insert 하는 2개 프로시저 만들기 
-- 주의 생성할때 프로시저 두개다 만들어야함 한개만하면 바코드 꼬인다
-- COMPANY는 되는데 INVENTORY가 안된다

-- COMPANY 테이블 데이터 추가
CREATE OR REPLACE PROCEDURE INSERT_COMPANY
(
    INSERT_CODE INT,
    INSERT_COMPANY VARCHAR2
)
IS BEGIN
INSERT INTO COMPANY (CODE,COMPANY) VALUES(INSERT_CODE,INSERT_COMPANY);
END INSERT_COMPANY;
/

-- 프로시저 호출
EXEC INSERT_COMPANY(FOOD_BARCODE.NEXTVAL,'테스트회사');

-- 확인 출력
SELECT * FROM COMPANY;

-- 프로시저 삭제
DROP PROCEDURE INSERT_COMPANY;

-- INVENTORY가 안된다 
-- INVENTORY 테이블 데이터 추가
CREATE OR REPLACE PROCEDURE INSERT_INVENTORY
(
    INSERT_NAME VARCHAR2,   -- 상품명
    INSERT_CGCODE VARCHAR2, -- 카테고리코드 분류코드
    INSERT_FCODE INT,       -- 상품코드
    INSERT_CNT INT,         -- 재고량
    INSERT_PRICE INT        -- 가격
)
IS BEGIN
INSERT INTO INVENTORY (NAME,CATEGORY_CODE,FOOD_CODE,CNT,PRICE) VALUES(INSERT_NAME,INSERT_CGCODE,INSERT_FCODE,INSERT_CNT,INSERT_PRICE);
END INSERT_INVENTORY;
/
-- INVENTORY 테이블에 데이터 추가하는 프로시저 호출 
EXEC INSERT_INVENTORY('테스트까까','AB01',INVENTORY_BARCODE.NEXTVAL,1,3000);


-- 프로시저 삭제
DROP PROCEDURE INSERT_INVENTORY;


-- 2. 재고 수정
-- 어떤 상품의 재고를 수정 할 것인가? 이름쳐서 재고수정
CREATE OR REPLACE PROCEDURE UPDATE_CNT
(
    UPDATE_CNT INT,
    SEARCH_NAME VARCHAR2
)    
IS BEGIN 
UPDATE INVENTORY SET CNT = UPDATE_CNT WHERE NAME = SEARCH_NAME;
END UPDATE_CNT;
/
-- 상품의 이름이 조건에 맞을때에 재고량을 수정하는 프로시저 호출 수정할 재고량, 검색할 제품명
EXEC UPDATE_CNT(2,'후라이드치킨'); 

-- 재고 확인 출력
SELECT NAME,CNT FROM INVENTORY;

-- 프로시저 삭제
DROP PROCEDURE UPDATE_CNT;

-- 3. 가격 수정
-- 어떤 상품 가격을 수정 할 것인가?
-- 상품의 이름이 조건에 맞을때에 가격을 수정
CREATE OR REPLACE PROCEDURE UPDATE_PRICE
(
    UPDATE_PRICE INT,
    SEARCH_NAME VARCHAR2
)
IS BEGIN 
UPDATE INVENTORY SET PRICE = UPDATE_PRICE WHERE NAME = SEARCH_NAME;
END UPDATE_PRICE;
/

-- 상품의 이름이 조건에 맞을때에 가격을 수정하는 프로시저 호출
EXEC UPDATE_PRICE(9000,'후라이드치킨'); -- 수정할가격, 검색할제품명

-- 재고 확인 출력
SELECT NAME,PRICE FROM INVENTORY;

-- 프로시저 삭제
DROP PROCEDURE UPDATE_PRICE;

---------------------- 삭제 ------------------------------------
-- 1. 전체 데이터 삭제
CREATE OR REPLACE PROCEDURE DELETE_ALL
IS BEGIN
    DELETE FROM INVENTORY;
END DELETE_ALL;
/
-- 전체데이터(INVENTORY) 삭제 프로시저 호출
EXEC DELETE_ALL();
-- INVENTORY 확인 출력
SELECT * FROM INVENTORY;
-- 프로시저 삭제 
DROP PROCEDURE DELETE_ALL;

-- 2. 제품 데이터삭제 - 이름으로
CREATE OR REPLACE PROCEDURE DELETE_NAME(
    DEL_NAME IN VARCHAR2
)
IS BEGIN
    DELETE FROM INVENTORY WHERE NAME = DEL_NAME;
END DELETE_NAME;
/
--상품명 삭제 프로시저 호출
-- 데이터 임의로 넣어놓음
EXEC DELETE_NAME('후라이드치킨'); 
-- INVENTORY 확인 출력
SELECT * FROM INVENTORY;
--프로시저 삭제
DROP PROCEDURE DELETE_NAME;

------------------ 트리거 ------------------------------
-- 1. 각각 추가될때 '데이터 추가되었습니다.'
-- COMPANY 테이블 추가
CREATE OR REPLACE TRIGGER ALARM_INSERT_COMPANY
BEFORE INSERT ON COMPANY     
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 추가되었습니다.');
END; 
/
DROP TRIGGER ALARM_INSERT_COMPANY;

-- IVENTORY 테이블 추가
CREATE OR REPLACE TRIGGER ALARM_INSERT_INVENTORY
BEFORE INSERT ON INVENTORY    
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 추가되었습니다.');
END; 
/
DROP TRIGGER ALARM_INSERT_INVENTORY;

-- 2. 각각 수정될떄 '데이터 수정되었습니다.'
-- COMPANY 테이블 수정
CREATE OR REPLACE TRIGGER ALARM_UPDATE_COMPANY
BEFORE UPDATE ON COMPANY     
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 수정되었습니다.');
END; 
/
DROP TRIGGER ALARM_UPDATE_COMPANY;
-- IVENTORY 테이블 수정
CREATE OR REPLACE TRIGGER ALARM_UPDATE_INVENTORY
BEFORE UPDATE ON INVENTORY    
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 수정되었습니다.');
END; 
/
DROP TRIGGER ALARM_UPDATE_INVENTORY;

-- 3. 각각 삭제될때 '데이터 삭제되었습니다.'
-- COMPANY 테이블 삭제
CREATE OR REPLACE TRIGGER ALARM_DELETE_COMPANY
BEFORE DELETE ON COMPANY     
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 삭제되었습니다.');
END; 
/
DROP TRIGGER ALARM_DELETE_COMPANY;
-- IVENTORY 테이블 삭제
CREATE OR REPLACE TRIGGER ALARM_DELETE_INVENTORY
BEFORE DELETE ON INVENTORY    
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('데이터가 삭제되었습니다.');
END; 
/
DROP TRIGGER ALARM_DELETE_INVENTORY;

COMMIT;