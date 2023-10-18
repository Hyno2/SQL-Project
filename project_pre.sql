DROP TABLE UMSIK;
DROP TABLE FOOD;
DROP TABLE JAEGO;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

CREATE TABLE FOOD(
    CODE VARCHAR2(10) PRIMARY KEY,
    KINDOF VARCHAR2(20)
);
CREATE TABLE JAEGO(
    CODE VARCHAR2(10) PRIMARY KEY,
    CNT INT
);
CREATE TABLE UMSIK(
    FCODE VARCHAR2(10),
    JCODE VARCHAR2(10),
    NAME VARCHAR2(50),
    PRICE INT,
    COMPANY VARCHAR2(30)
);

ALTER TABLE UMSIK ADD CONSTRAINT FK_FCODE FOREIGN KEY(FCODE) REFERENCES FOOD(CODE);
ALTER TABLE UMSIK ADD CONSTRAINT FK_JCODE FOREIGN KEY(JCODE) REFERENCES JAEGO(CODE);

INSERT INTO FOOD VALUES ('AB01', '°£Æí½Ä»ç');
INSERT INTO FOOD VALUES ('AB02', '°úÀÚ');
INSERT INTO FOOD VALUES ('AB03', '¾ÆÀÌ½ºÅ©¸²');
INSERT INTO FOOD VALUES ('AB04', '½ÄÇ°');
INSERT INTO FOOD VALUES ('AB05', 'À½·á');

SELECT * FROM FOOD;

INSERT INTO JAEGO VALUES ('111', '100');
INSERT INTO JAEGO VALUES ('222', '200');
INSERT INTO JAEGO VALUES ('333', '300');
INSERT INTO JAEGO VALUES ('444', '400');
INSERT INTO JAEGO VALUES ('555', '500');

SELECT * FROM JAEGO;

INSERT INTO UMSIK VALUES ('AB01', '111', 'ÇÞ¹Ý', 1500, 'CJ');
INSERT INTO UMSIK VALUES ('AB01', '111', 'ÄÅ¹ä', 2000, '¿À¶Ñ±â');
INSERT INTO UMSIK VALUES ('AB02', '222', 'Æ÷Ä«Ä¨', 3000, '³ó½É');
INSERT INTO UMSIK VALUES ('AB02', '222', '½ºÀ®Ä¨', 4000, '·Ôµ¥');
INSERT INTO UMSIK VALUES ('AB04', '444', '±è¹ä', 5000, 'PB');
INSERT INTO UMSIK VALUES ('AB01', '111', 'ÇÞ¹Ý1', 15000, 'CJ');
INSERT INTO UMSIK VALUES ('AB01', '111', 'ÄÅ¹ä2', 20000, '¿À¶Ñ±â');
INSERT INTO UMSIK VALUES ('AB02', '222', 'Æ÷Ä«Ä¨3', 30000, '³ó½É');
INSERT INTO UMSIK VALUES ('AB02', '222', '½ºÀ®Ä¨4', 40000, '·Ôµ¥');
INSERT INTO UMSIK VALUES ('AB04', '444', '±è¹ä5', 50000, 'PB');


SELECT * FROM UMSIK;

SELECT * FROM FOOD, JAEGO, UMSIK WHERE umsik.fcode = food.code and umsik.jcode = jaego.code; 
commit;

SELECT COMPANY, MAX(PRICE) FROM UMSIK GROUP BY COMPANY;
COMMIT;
