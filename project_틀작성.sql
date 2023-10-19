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
-- 간편식사 데이터 추가
INSERT INTO FOOD(NAME,COMPANY) VALUES ('후라이드치킨' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('소시지바' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('브라우니쿠키' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('글레이즈드도넛' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('뉴자이언트지파이' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('크로와상' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('곰돌이치킨바' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('통살닭다리꼬치' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('소보로빵' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('핫아메리카노L' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ICE아메리카노L' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('단팥빵' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('슈크림빵' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('사각꼬치어묵' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('고구마빵' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('치즈볼' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('통새우꼬치' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('자이언트통다리' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('치즈피자' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('애플파이' ,'PB');

-- 과자 데이터 추가
INSERT INTO FOOD(NAME,COMPANY) VALUES ('콘칩', '크라운');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('다이제' , '오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('화이트하임', '크라운');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('버터링쿠키', '해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('프링글스오리지널', '프링글스');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('참깨스틱', '청우');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('쫀득초코칩바나나' ,'청우');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('포스틱', '농심');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('포켓몬밀크초코슈', '삼립');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('23피자호빵', '삼립');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('옥수수꿀호떡요요', '삼립');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('와우아이셔사과껌', '오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('졸음번쩍코팅컵', '롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('자일리톨용기껌', '롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('아카시아껌1000', '해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('리츠샌드레몬', '동서');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('바나나킥', '농심');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('에이스', '해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('후렌치파이사과', '해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('마켓오브라우니6입', '오리온');
-- 아이스크림 데이터 추가

INSERT INTO FOOD(NAME,COMPANY) VALUES ('스크류바' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('떡붕어싸만코' ,'빙그레');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('옥동자딸기' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('딸기초코바' ,'허쉬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('피치리치바' ,'서주');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('나초코' ,'서주');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('탱크보이' ,'해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('폴라포포도' ,'해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('다쿠아즈딸기' ,'나뚜루');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('녹차마루바' ,'해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('호두마루바' ,'해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('요맘때딸기바' ,'빙그레');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('초코마시멜로콘' ,'허쉬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('누가바' ,'해태');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('부드러운빵또아' ,'빙그레');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('수박바' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('초코앤쿠키콘' ,'허쉬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('월드콘' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('설레임밀크쉐이크' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('더블비얀코' ,'롯데');
-- 식품 데이터 추가
INSERT INTO FOOD(NAME,COMPANY) VALUES ('맵탱청양대파라면컵', '삼양');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('컵누들소컵', '오뚜기');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('열라면봉지', '오뚜기');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('라면왕김통깨사발', '농심');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('간짬뽕컵', '삼양');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반현미쌀밥', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('고메탕수육', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('콕콕콕치즈게티컵', '오뚜기');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('참깨라면볶음면컵', '오뚜기');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('할라피뇨불닭컵', '삼양');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('짜파게티큰사발', '농심');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('닭가슴살바페퍼', '삼립');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('불닭볶음탕면', '삼양');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('햇반흑미밥130g*3입', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('배홍동쫄쫄면', '농심');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('한입에치즈쏙육포', '영찬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('먹기좋은통육포', '영찬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('오리지널육포채', '영찬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('오리지널구운육포', '영찬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('짜파게티만능소스', '농심');
-- 음료 데이터 추가
--콜라
INSERT INTO FOOD(NAME,COMPANY) VALUES ('코크제로레전드355' ,'코카콜라');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('코카콜라제로캔355' ,'코카콜라');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('펩시콜라제로캔355' ,'롯데');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('펩시콜라캔350' ,'롯데');
--커피
INSERT INTO FOOD(NAME,COMPANY) VALUES ('덴마크커피우유' ,'동원');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('콜드브루커피우유' ,'연세유업');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('커피우유300' ,'서울우유');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('강릉커피너티크250' ,'서울우유');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('프라푸치노커피병281' ,'스타벅스');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('초코크림라떼250' ,'서울우유');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('셀렉트바닐라라떼300' ,'스타벅스');
--프로틴음료
INSERT INTO FOOD(NAME,COMPANY) VALUES ('단백질바나나팩' ,'오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES('단백질프로팩250','오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES('닥터유단백질카페','오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES('단백질바나나240','오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES('단백질초코240','오리온');
INSERT INTO FOOD(NAME,COMPANY) VALUES('프로틴밸런스190','일동후디스');
INSERT INTO FOOD(NAME,COMPANY) VALUES('프로틴밸런스저당','일동후디스');
INSERT INTO FOOD(NAME,COMPANY) VALUES('프로틴액티브밀크','일동후디스');
INSERT INTO FOOD(NAME,COMPANY) VALUES('프로틴액티브초코','일동후디스');

-- FOOD 테이블 출력
SELECT * FROM FOOD;

-- 관리 테이블 데이터 추가/ 품목 코드(FOOD_CODE), 재고(CNT), 가격(PRICE), 
-- 간편식사 데이터 입력
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 3, 9900); -- 후라이드치킨
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 2, 2400); -- 소시지바
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1000); -- 브라우니쿠키
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1300); -- 글레이즈드도넛
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 4, 2900); -- 뉴자이언트지파이
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1300); -- 크로와상
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 14, 2200); -- 곰돌이치킨바
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 1400); -- 통살닭다리꼬치
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500); -- 소보로빵
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 20, 1500); -- 핫아메리카노L
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 20, 1500); -- ICE아메리카노L
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1400); -- 단팥빵
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1400); -- 슈크림빵
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 12, 1000); -- 사각꼬치어묵
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 2000); -- 고구마빵
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 30, 500); -- 치즈볼
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 2000); -- 통새우꼬치
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 4500); -- 자이언트통다리
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 7200); -- 치즈피자
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 12, 1700); -- 애플파이

-- 과자 데이터 추가
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 15, 3000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 13, 2000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 42, 3300);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 18, 1700);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 24, 4000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 30, 2000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 18, 2000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 22, 1700);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 5, 2000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 20, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 16, 2500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 26, 500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 25, 1200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 30, 6000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 30, 1000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 16, 2200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 28, 1700);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 24, 1700);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 27, 4200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB02', 32, 3000);

-- 아이스크림 데이터 추가
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 13, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 18, 2200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 21, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 14, 2500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 6, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 7, 400);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 20, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 11, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 12, 4500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 10, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 22, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 29, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 31, 2500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 17, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 15, 2200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 25, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 23, 2500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 28, 2200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 16, 2200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB03', 12, 2200);
-- 식품 데이터 추가
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 20, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 25, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 18, 1500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 18, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 7, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 30, 2800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 20, 2300);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 15, 2300);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 31, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 26, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 15, 2300);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 27, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 22, 1800);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 26, 5950);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 29, 1700);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 18, 4000);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 23, 4200);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 14, 2500);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 16, 5900);
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB04', 13, 6000);

-- 음료 데이터 추가
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 코크제로레전드
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 코카콜라제로
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 19000); -- 펩시콜라 제로
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 19000); -- 펩시콜라
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 덴마크커피우유
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 1800); -- 콜드브루커피우유
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 커피우유 서울
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2700); -- 강릉커피너티크
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 3000); -- 프라푸치노 스타벅스
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 초코크림라떼
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2800); -- 셀렉트바닐라라떼
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- 단백질바나나팩
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- 단백질프로팩
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- 닥터유단백질라떼
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 단백질바나나240
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 단백칠초코
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 프로틴밸런스190
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- 프로틴밸런스저당
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- 프로틴액티브밀크
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- 프로틴액티브초코

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
