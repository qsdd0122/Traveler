DROP SEQUENCE ACC_BNO;
DROP TABLE ACCOMPANY_BOARD;

CREATE SEQUENCE ACC_BNO
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE;

CREATE TABLE ACCOMPANY_BOARD (
    ACC_BNO NUMBER,
    PLANNO NUMBER, 
    HOSTID VARCHAR2(50),
    BOARD_TITLE VARCHAR2(200),
    TITLE VARCHAR2(200),
    REG_DATE  VARCHAR2(30) default to_char(sysdate,'yyyy.mm.dd hh24:mi'),   
    PRIMARY KEY(ACC_BNO,PLANNO, HOSTID, TITLE),
    CONSTRAINT ACCBOARD_FK_ACC_HOST FOREIGN KEY(PLANNO, HOSTID, TITLE)
    REFERENCES ACC_HOST(PLANNO, HOSTID, TITLE) ON DELETE CASCADE
    );