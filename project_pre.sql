DROP TABLE FOOD;
DROP TABLE PRODUCT;
DROP TABLE JAEGO;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

CREATE TABLE PRODUCT( -- ǰ�� ���̺�
    CODE VARCHAR2(10) PRIMARY KEY, -- ǰ��з��ڵ� 
    KINDOF VARCHAR2(20) -- ǰ�� ����
);
CREATE TABLE JAEGO( -- ������̺�
    CODE VARCHAR2(10) PRIMARY KEY, -- ���� �ڵ�
    NAME VARCHAR2(50)              -- ���� �̸� 
   
);
CREATE TABLE FOOD(                  -- ���� ���̺� 
    FCODE VARCHAR2(10),             -- ǰ��з��ϱ����� �ڵ�
    JCODE VARCHAR2(10) PRIMARY KEY, -- ���� �ڵ�
    CNT INT,                        -- ���
    PRICE INT,                      -- ���� ����
    COMPANY VARCHAR2(30)            -- ������
);

ALTER TABLE FOOD ADD CONSTRAINT FK_FCODE FOREIGN KEY(FCODE) REFERENCES PRODUCT(CODE);   -- �������̺��� ǰ��з��ϱ������ڵ�(FCODE)�� 
                                                                                        -- ǰ�����̺��� ǰ��з��ڵ�(CODE)�� ������
ALTER TABLE FOOD ADD CONSTRAINT FK_JCODE FOREIGN KEY(JCODE) REFERENCES JAEGO(CODE);     -- �������̺��� �����ڵ�(JCODE)��
                                                                                        -- ������̺��� ����ڵ带 ������
--  ǰ�� ���̺� ������ �߰�. ǰ��з��ڵ�(CODE), ǰ������(KINDOF) 
INSERT INTO PRODUCT VALUES ('AB01', '����Ļ�');
INSERT INTO PRODUCT VALUES ('AB02', '����');
INSERT INTO PRODUCT VALUES ('AB03', '���̽�ũ��');
INSERT INTO PRODUCT VALUES ('AB04', '��ǰ');
INSERT INTO PRODUCT VALUES ('AB05', '����');

-- ǰ�� ���̺� ���
SELECT * FROM PRODUCT;

-- ��� ���̺� ������ �߰� �����ڵ�(CODE), �����̸�(NAME)
INSERT INTO JAEGO VALUES ('111', '�޹�');
INSERT INTO JAEGO VALUES ('222', '�Ź�');
INSERT INTO JAEGO VALUES ('333', '��īĨ');
INSERT INTO JAEGO VALUES ('444', '����Ĩ');
INSERT INTO JAEGO VALUES ('555', '���');

-- ��� ���̺� ���
SELECT * FROM JAEGO;

-- ���� ���̺� ������ �߰� ǰ��з������ڵ�(FCODE), �����ڵ�(JCODE), ���(CNT), ���İ���(PRICE), ������(COMPANY)
INSERT INTO FOOD VALUES ('AB01', '111', 10, 1500, 'CJ');
INSERT INTO FOOD VALUES ('AB01', '222', 20, 2000, '���ѱ�');
INSERT INTO FOOD VALUES ('AB02', '333', 30, 3000, '���');
INSERT INTO FOOD VALUES ('AB02', '444', 40, 4000, '�Ե�');
INSERT INTO FOOD VALUES ('AB04', '555', 50, 5000, 'PB');
INSERT INTO FOOD VALUES ('AB01', '111', 10, 1500, 'CJ');


-- ���� ���̺� ���
SELECT * FROM FOOD;


-------------------------------------��ȸ-------------------------------------
-- 1. ��� ���̺� JOIN�ؼ� ��� ��ȸ
SELECT PRODUCT.CODE ��ǰ�ڵ�, PRODUCT.KINDOF ��ǰ�з�,
JAEGO.CODE �����ڵ�, FOOD.CNT ���,
 JAEGO.NAME ���ĸ�, FOOD.PRICE ����, FOOD.COMPANY ������ 
FROM PRODUCT, JAEGO, FOOD 
WHERE FOOD.fcode = PRODUCT.code and FOOD.jcode = jaego.code; 
commit;

-- 2.ȸ�纰 ���� ��� ��ǰ ȸ���, ��ǰ�̸�, ���� ����ϱ�
SELECT COMPANY ������, JAEGO.NAME ��ǰ��, MAX(PRICE) �ְ��� FROM FOOD,JAEGO WHERE FOOD.jcode = jaego.code
GROUP BY COMPANY, NAME ;
COMMIT;

-- 3. �̸����� ''�� ��� �˻� �� �����ڵ�,���ĸ�,����,���,������ ����ϱ�

-- 4. �����ڵ带 �˻��� ���ĸ�, ����, 
