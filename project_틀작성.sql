DROP TABLE CATEGORY;
DROP TABLE FOOD;
DROP TABLE INVENTORY;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

DROP SEQUENCE FOOD_BARCODE;         -- ��ǰ�ڵ� ������ 
DROP SEQUENCE INVENTORY_BARCODE;    -- �κ��丮 ������

CREATE SEQUENCE FOOD_BARCODE START WITH 846543 INCREMENT BY 17; -- ��ǰ�ڵ� 846543���� �����ؼ� 17�� ����
CREATE SEQUENCE INVENTORY_BARCODE START WITH 846543 INCREMENT BY 17; -- �κ��丮�ڵ� 846543���� �����ؼ� 17�� ����

CREATE TABLE CATEGORY(              -- ǰ�� ���̺� (�� ���̺��� �����Ͱ��� ����)
    CODE VARCHAR2(10) PRIMARY KEY,  -- ǰ��з��ڵ� 
    KIND VARCHAR2(20)               -- ǰ�� �з�
);
CREATE TABLE FOOD(                  -- ��ǰ ���̺�
    CODE INT DEFAULT FOOD_BARCODE.NEXTVAL PRIMARY KEY,  -- ��ǰ �ڵ�(��ǰ���� �ٸ�, ������ ���)
    NAME VARCHAR2(50),              -- ��ǰ�� 
    COMPANY VARCHAR2(30)            -- ����ȸ���
);
CREATE TABLE INVENTORY(             -- ���� ���̺� 
    CATEGORY_CODE VARCHAR2(10),     -- ǰ��з��ϱ����� �ڵ� (�ܷ�Ű) -- CATEGORY ���̺��� CODE�� ����
    FOOD_CODE INT DEFAULT INVENTORY_BARCODE.NEXTVAL, -- ��ǰ �ڵ�(�ܷ�Ű) -- FOOD ���̺��� CODE�� ����
    CNT INT,          -- ���
    PRICE INT                     -- ���� ����
);
-- CATEGORY ���̺��� CODE�� �����Ͽ� INVENTORY ���̺��� CATEGORY_CODE�� �ܷ�Ű�� ����
ALTER TABLE INVENTORY ADD CONSTRAINT FK_CATEGORY_CODE FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CODE);   
                                                                                                           
 -- FOOD ���̺��� CODE�� �����Ͽ� INVENTORY ���̺��� FOOD_CODE�� �ܷ�Ű�� ����                                                                                      
ALTER TABLE INVENTORY ADD CONSTRAINT FK_FOOD_CODE FOREIGN KEY(FOOD_CODE) REFERENCES FOOD(CODE);     
                                                                                       
-- CATEGORY ���̺� ������ �߰�/ ǰ��з��ڵ�(CODE), ǰ�� �з�(KIND) 
INSERT INTO CATEGORY VALUES ('AB01', '����Ļ�');    -- ����
INSERT INTO CATEGORY VALUES ('AB02', '����');       -- ȿ��
INSERT INTO CATEGORY VALUES ('AB03', '���̽�ũ��');   -- ����
INSERT INTO CATEGORY VALUES ('AB04', '��ǰ');       --ȿ��
INSERT INTO CATEGORY VALUES ('AB05', '����');        -- ����

-- CATEGORY ���̺� ���
SELECT * FROM CATEGORY;

-- FOOD ���̺� ������ �߰�/ ��ǰ��(NAME), ȸ���(COMPANY)
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹�' ,'ȸ���̸�');

-- FOOD ���̺� ���
SELECT * FROM FOOD;

-- ���� ���̺� ������ �߰�/ ǰ�� �ڵ�(FOOD_CODE), ���(CNT), ����(PRICE), 
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

-- ���� ���̺� ���
SELECT * FROM INVENTORY;

COMMIT;
-------------------------------------��ȸ-------------------------------------
-- 1. ��� ���̺� JOIN�ؼ� ��� ��ȸ
--SELECT CATEGORY.CODE ��ǰ�ڵ�, CATEGORY.KIND ��ǰ�з�,
--INVENTORY.CODE �����ڵ�, FOOD.CNT ���,
-- INVENTORY.NAME ���ĸ�, FOOD.PRICE ����, FOOD.COMPANY ������ 
--FROM CATEGORY, INVENTORY, FOOD 
--WHERE FOOD.FOOD_CODE = CATEGORY.code and FOOD.CATEGORY_CODE = INVENTORY.code; 
--commit;
--
---- 2.ȸ�纰 ���� ��� ��ǰ ȸ���, ��ǰ�̸�, ���� ����ϱ�
--SELECT COMPANY ������, INVENTORY.NAME ��ǰ��, MAX(PRICE) �ְ��� FROM FOOD,INVENTORY WHERE FOOD.CATEGORY_CODE = INVENTORY.code
--GROUP BY COMPANY, NAME ;
--COMMIT;

-- 3. �̸����� ''�� ��� �˻� �� �����ڵ�,���ĸ�,����,���,������ ����ϱ�

-- 4. �����ڵ带 �˻��� ���ĸ�, ����, 
