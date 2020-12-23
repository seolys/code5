cd C:\public\sqlite
sqlite3 C:\public\sqlite\code5.db

DROP TABLE EMP ;

CREATE TABLE EMP (
EMP_N PRIMARY KEY
, EMP_NM
, HP_N
, DEPT_N
);

INSERT INTO EMP VALUES ('N0001','ABC','','D01');
INSERT INTO EMP VALUES ('N0002','ZZZ','','D01');
INSERT INTO EMP VALUES ('N0003','ABC','','D02');



DROP TABLE FW_SQL;

CREATE TABLE FW_SQL (
KEY PRIMARY KEY
, SQL
);


INSERT INTO FW_SQL VALUES ('SQLRUNNER_TEST_01', 'SELECT EMP_N, EMP_NM, DEPT_N FROM EMP WHERE EMP_NM = [EMP_NM] ORDER BY EMP_N');

INSERT INTO FW_SQL VALUES ('SQLRUNNER_TEST_02', 'UPDATE EMP SET HP_N = [HP_N] WHERE EMP_N =[EMP_N]');


