cd C:\public\sqlite
sqlite3 C:\public\sqlite\code5.db

DELETE FROM FW_SQL WHERE KEY IN ('EMP001D_01', 'EMP001D_02');

INSERT INTO FW_SQL VALUES ('EMP001D_01', 'SELECT EMP_N, EMP_NM, DEPT_N FROM EMP WHERE EMP_NM = [EMP_NM] ORDER BY EMP_N');
INSERT INTO FW_SQL VALUES ('EMP001D_02', 'UPDATE EMP SET HP_N = [HP_N] WHERE EMP_N =[EMP_N]');


DROP TABLE FW_CONTROLLER;

DROP TABLE FW_VIEW;

CREATE TABLE FW_CONTROLLER (
KEY PRIMARY KEY
, CLASS_NAME
, METHOD_NAME
);

CREATE TABLE FW_VIEW (
KEY PRIMARY KEY
, JSP
);



INSERT INTO FW_CONTROLLER VALUES ('emp00101','com.code5.biz.emp.Emp001','emp00101');
INSERT INTO FW_CONTROLLER VALUES ('emp00102','com.code5.biz.emp.Emp001','emp00102');

INSERT INTO FW_VIEW VALUES ('emp00101','/WEB-INF/classes/com/code5/biz/emp/jsp/emp00101.jsp');


INSERT INTO FW_CONTROLLER VALUES ('login','com.code5.biz.login.Login','login');
INSERT INTO FW_CONTROLLER VALUES ('loginView','com.code5.biz.login.Login','loginView');

INSERT INTO FW_VIEW VALUES ('loginView','/WEB-INF/classes/com/code5/biz/login/jsp/loginView.jsp');


DELETE FROM FW_SQL WHERE KEY IN ('MASTERCONTROLLERD_01','MASTERCONTROLLERD_02'); 

INSERT INTO FW_SQL VALUES (
'MASTERCONTROLLERD_01'
, 'SELECT
KEY
, CLASS_NAME
, METHOD_NAME
FROM FW_CONTROLLER
WHERE KEY = [KEY]'
);

INSERT INTO FW_SQL VALUES (
'MASTERCONTROLLERD_02'
, 'SELECT
KEY
, JSP
FROM FW_VIEW
WHERE KEY = [KEY]'
);

