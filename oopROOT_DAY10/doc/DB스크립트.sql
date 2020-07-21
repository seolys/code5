ALTER TABLE FW_CONTROLLER ADD SESSION_CHECK_YN;

UPDATE FW_CONTROLLER SET SESSION_CHECK_YN = 'Y' WHERE SESSION_CHECK_YN IS NULL;


UPDATE FW_SQL SET SQL = 'SELECT
KEY
, CLASS_NAME
, METHOD_NAME
, SESSION_CHECK_YN
FROM FW_CONTROLLER
WHERE KEY = [KEY]
'
WHERE KEY = 'MASTERCONTROLLERD_01';



CREATE TABLE BZ_ID (
ID PRIMARY KEY
, PIN
, AUTH
, FAIL_CNT
, LAST_LOGIN_DTM
);


INSERT INTO BZ_ID values (
'id01'
, 'abcd1111'
, 'A0'
, '0'
, ''
);


INSERT INTO FW_SQL values (
'COM003D_01'
, 'SELECT 
ID
, PIN
, AUTH
, FAIL_CNT
, LAST_LOGIN_DTM 
FROM 
BZ_ID
WHERE ID = [ID] 
');

INSERT INTO FW_SQL values (
'COM003D_02'
, 'UPDATE BZ_ID
SET FAIL_CNT = FAIL_CNT + 1
WHERE ID = [ID] 
');

INSERT INTO FW_SQL values (
'COM003D_03'
,'UPDATE BZ_ID
SET FAIL_CNT = 0
, LAST_LOGIN_DTM = [LAST_LOGIN_DTM]
WHERE ID = [ID]
');

INSERT INTO FW_CONTROLLER VALUES (
'com00310'
,'com.code5.biz.com003.Com003'
,'com00310'
,'N' 
);

INSERT INTO FW_CONTROLLER VALUES (
'com00311'
,'com.code5.biz.com003.Com003'
,'com00311'
,'N'
);


INSERT INTO FW_CONTROLLER VALUES (
'com00320'
,'com.code5.biz.com003.Com003'
,'com00320'
,'Y'
);

INSERT INTO FW_VIEW VALUES (
'com00320'
, '/WEB-INF/classes/com/code5/biz/com003/jsp/com00320.jsp'
);


INSERT INTO FW_VIEW VALUES (
'com00310'
, '/WEB-INF/classes/com/code5/biz/com003/jsp/com00310.jsp'
);
