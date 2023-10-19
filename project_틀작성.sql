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
-- ����Ļ� ������ �߰�
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ķ��̵�ġŲ' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ҽ�����' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�������Ű' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�۷�����嵵��' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�����̾�Ʈ������' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ũ�οͻ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������ġŲ��' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ߴٸ���ġ' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Һ��λ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�־Ƹ޸�ī��L' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ICE�Ƹ޸�ī��L' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ϻ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ũ����' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�簢��ġ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ġ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����첿ġ' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���̾�Ʈ��ٸ�' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ġ������' ,'PB');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��������' ,'PB');

-- ���� ������ �߰�
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��Ĩ', 'ũ���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������' , '������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ȭ��Ʈ����', 'ũ���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���͸���Ű', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�����۽���������', '�����۽�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������ƽ', 'û��');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�˵�����Ĩ�ٳ���' ,'û��');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����ƽ', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ϸ��ũ���ڽ�', '�︳');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('23����ȣ��', '�︳');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��������ȣ�����', '�︳');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ϳ���̼Ż����', '������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������½������', '�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ϸ����ⲭ', '�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ī�þƲ�1000', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�������巹��', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ٳ���ű', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���̽�', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ķ�ġ���̻��', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���Ͽ������6��', '������');
-- ���̽�ũ�� ������ �߰�

INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ũ����' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ؾ�θ���' ,'���׷�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�����ڵ���' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�������ڹ�' ,'�㽬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ġ��ġ��' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ũ����' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����������' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����������' ,'���ѷ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���������' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('ȣ�θ����' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�举�������' ,'���׷�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ڸ��ø����' ,'�㽬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ε巯��Ǿ�' ,'���׷�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ڹ�' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ھ���Ű��' ,'�㽬');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�����ӹ�ũ����ũ' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��������' ,'�Ե�');
-- ��ǰ ������ �߰�
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����û����Ķ����', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ŵ������', '���ѱ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��������', '���ѱ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���ձ�������', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��«����', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹����̽ҹ�', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���������', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������ġ���Ƽ��', '���ѱ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������麺������', '���ѱ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ҷ��Ǵ��Ҵ���', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('¥�İ�Ƽū���', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�߰����������', '�︳');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ҵߺ�������', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�޹���̹�130g*3��', 'CJ');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ȫ�����̸�', '���');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('���Կ�ġ�������', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�Ա�����������', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('������������ä', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�������α�������', '����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('¥�İ�Ƽ���ɼҽ�', '���');
-- ���� ������ �߰�
--�ݶ�
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ũ���η�����355' ,'��ī�ݶ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('��ī�ݶ�����ĵ355' ,'��ī�ݶ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����ݶ�����ĵ355' ,'�Ե�');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����ݶ�ĵ350' ,'�Ե�');
--Ŀ��
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����ũĿ�ǿ���' ,'����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ݵ���Ŀ�ǿ���' ,'��������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('Ŀ�ǿ���300' ,'�������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����Ŀ�ǳ�Ƽũ250' ,'�������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����Ǫġ��Ŀ�Ǻ�281' ,'��Ÿ����');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����ũ����250' ,'�������');
INSERT INTO FOOD(NAME,COMPANY) VALUES ('����Ʈ�ٴҶ��300' ,'��Ÿ����');
--����ƾ����
INSERT INTO FOOD(NAME,COMPANY) VALUES ('�ܹ����ٳ�����' ,'������');
INSERT INTO FOOD(NAME,COMPANY) VALUES('�ܹ���������250','������');
INSERT INTO FOOD(NAME,COMPANY) VALUES('�������ܹ���ī��','������');
INSERT INTO FOOD(NAME,COMPANY) VALUES('�ܹ����ٳ���240','������');
INSERT INTO FOOD(NAME,COMPANY) VALUES('�ܹ�������240','������');
INSERT INTO FOOD(NAME,COMPANY) VALUES('����ƾ�뷱��190','�ϵ��ĵ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES('����ƾ�뷱������','�ϵ��ĵ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES('����ƾ��Ƽ���ũ','�ϵ��ĵ�');
INSERT INTO FOOD(NAME,COMPANY) VALUES('����ƾ��Ƽ������','�ϵ��ĵ�');

-- FOOD ���̺� ���
SELECT * FROM FOOD;

-- ���� ���̺� ������ �߰�/ ǰ�� �ڵ�(FOOD_CODE), ���(CNT), ����(PRICE), 
-- ����Ļ� ������ �Է�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 3, 9900); -- �Ķ��̵�ġŲ
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 2, 2400); -- �ҽ�����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1000); -- �������Ű
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1300); -- �۷�����嵵��
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 4, 2900); -- �����̾�Ʈ������
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1300); -- ũ�οͻ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 14, 2200); -- ������ġŲ��
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 1400); -- ���ߴٸ���ġ
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 1500); -- �Һ��λ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 20, 1500); -- �־Ƹ޸�ī��L
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 20, 1500); -- ICE�Ƹ޸�ī��L
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1400); -- ���ϻ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 15, 1400); -- ��ũ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 12, 1000); -- �簢��ġ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 2000); -- ������
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 30, 500); -- ġ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 2000); -- ����첿ġ
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 10, 4500); -- ���̾�Ʈ��ٸ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 5, 7200); -- ġ������
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB01', 12, 1700); -- ��������

-- ���� ������ �߰�
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

-- ���̽�ũ�� ������ �߰�
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
-- ��ǰ ������ �߰�
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

-- ���� ������ �߰�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ��ũ���η�����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ��ī�ݶ�����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 19000); -- ����ݶ� ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 19000); -- ����ݶ�
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ����ũĿ�ǿ���
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 1800); -- �ݵ���Ŀ�ǿ���
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- Ŀ�ǿ��� ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2700); -- ����Ŀ�ǳ�Ƽũ
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 3000); -- ����Ǫġ�� ��Ÿ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ����ũ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2800); -- ����Ʈ�ٴҶ��
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- �ܹ����ٳ�����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- �ܹ���������
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- �������ܹ�����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- �ܹ����ٳ���240
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- �ܹ�ĥ����
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ����ƾ�뷱��190
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2000); -- ����ƾ�뷱������
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- ����ƾ��Ƽ���ũ
INSERT INTO INVENTORY(CATEGORY_CODE,CNT,PRICE) VALUES ('AB05', 13, 2900); -- ����ƾ��Ƽ������

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
