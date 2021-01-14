cd C:\public\sqlite
sqlite3 C:\public\sqlite\code5.db

DROP TABLE FW_UPLOAD_FILE; 

CREATE TABLE FW_UPLOAD_FILE (
FILE_ID primary KEY
, SIZE
, CONTENT_TYPE
, FILE_NAME
, FILE_URL
, RG_ID
, RG_DTM
, DEL_Y
, DEL_ID
, DEL_DTM
);


DROP TABLE FW_DOWNLOAD_FILE; 

CREATE TABLE FW_DOWNLOAD_FILE (
FILE_ID
, ID
, DTM
);

DELETE FROM FW_SQL WHERE KEY = 'UPLOADFILEB_01';
insert into FW_SQL (KEY, SQL) VALUES ('UPLOADFILEB_01', 'INSERT INTO FW_UPLOAD_FILE (
FILE_ID
, SIZE
, CONTENT_TYPE
, FILE_NAME
, FILE_URL
, RG_ID
, RG_DTM
) VALUES (
[UPLOADFILEB.FILE_ID]
, [UPLOADFILEB.SIZE]
, [UPLOADFILEB.CONTENT_TYPE]
, [UPLOADFILEB.FILE_NAME]
, [UPLOADFILEB.FILE_URL]
, [SESSIONB__ID]
, [SYSDTM__DTM]
)
');

DELETE FROM FW_SQL WHERE KEY = 'UPLOADFILEB_02';
insert into FW_SQL (KEY, SQL) VALUES ('UPLOADFILEB_02', 'SELECT * FROM FW_UPLOAD_FILE WHERE FILE_ID = [FILE_ID]');

DELETE FROM FW_SQL WHERE KEY = 'UPLOADFILEB_03';
insert into FW_SQL (KEY, SQL) VALUES ('UPLOADFILEB_03', 'UPDATE FW_UPLOAD_FILE
SET DEL_Y =''Y''
, DEL_ID = [SESSIONB__ID]
, DEL_DTM = [SYSDTM__DTM]  
WHERE FILE_ID = [FILE_ID]');


DELETE FROM FW_SQL WHERE KEY = 'MASTERCONTROLLERMULTIPART_01';
insert into FW_SQL (KEY, SQL) VALUES ('MASTERCONTROLLERMULTIPART_01', 'SELECT * FROM FW_UPLOAD_FILE WHERE FILE_ID = [FILE_ID]');

DELETE FROM FW_SQL WHERE KEY = 'DOWNLOADFILE_01';
insert into FW_SQL (KEY, SQL) VALUES ('DOWNLOADFILE_01', 'INSERT INTO FW_DOWNLOAD_FILE (
FILE_ID
, ID
, DTM
) values (
[FILE_ID]
, [SESSIONB__ID]
, [DTM]
)'
);

ALTER TABLE EMP ADD FILE_ID;

UPDATE FW_SQL SET SQL ='SELECT AA.*, BB.FILE_NAME FROM EMP AA LEFT OUTER JOIN FW_UPLOAD_FILE BB ON AA.FILE_ID = BB.FILE_ID WHERE EMP_NM LIKE [EMP_NM]||''%'' ORDER BY EMP_N' WHERE KEY = 'EMP001D_01';
UPDATE FW_SQL SET SQL ='UPDATE EMP 
SET HP_N = [HP_N] 
, FILE_ID = [FILE_ID]
WHERE EMP_N =[EMP_N]' WHERE KEY = 'EMP001D_02';


DELETE FROM FW_CONTROLLER WHERE KEY = 'downloadfile';
INSERT INTO FW_CONTROLLER (KEY, CLASS_NAME, METHOD_NAME, SESSION_CHECK_YN, AUTH) VALUES ('downloadfile','com.code5.fw.web.MasterControllerMultipart','downloadFile','Y','');

DELETE FROM FW_VIEW WHERE KEY = 'downloadFile'; 
INSERT INTO FW_VIEW (KEY, JSP) VALUES ('downloadFile','/WEB-INF/classes/com/code5/fw/web/jsp/downloadFile.jsp');

ALTER TABLE FW_VIEW ADD TMPL_JSP;
ALTER TABLE FW_VIEW ADD TITLE;
ALTER TABLE FW_CONTROLLER ADD ERR_JSP_KEY;


UPDATE FW_SQL SET SQL = 'SELECT * FROM FW_CONTROLLER WHERE KEY = [KEY]' WHERE KEY = 'MASTERCONTROLLERD_01';
UPDATE FW_SQL SET SQL = 'SELECT * FROM FW_VIEW WHERE KEY = [KEY]' WHERE KEY = 'MASTERCONTROLLERD_02';

DELETE FROM FW_CONTROLLER WHERE KEY like 'emp%';


DELETE FROM FW_SQL WHERE KEY= 'SQLRUNNER_TEST_03';
INSERT INTO FW_SQL(KEY, SQL) VALUES ('SQLRUNNER_TEST_03','SELECT
[HP_N] HP_N
, [HP_N] DEC__HP_N2__PRN_HP_N
, [ENC__HP_N] HP_N3
, [SYSDTM.DTM] DTM1
, [SYSDTM.DTM] DTM2__PRN_DTM
, [SESSIONB.ID] SESSION_ID
, [SESSIONB.IP] SESSION_IP
, [SESSIONB.AUTH] SESSION_AUTH
, [PIN__PIN, ID ] PIN
FROM EMP
WHERE 1 = 1

[~ P1 ^ IS_NOT_NULL ^ AND [P1] = [P1] ~]
[~ P2 ^ IS_NULL ^ AND 2 = 2 ~]
[~ P3 ^ Y ^ AND ''Y'' = [P3] ~]

[[ SQLRUNNER_TEST_04 ]]

AND ''FIN''=''FIN''
');

DELETE FROM FW_SQL WHERE KEY= 'SQLRUNNER_TEST_04';
INSERT INTO FW_SQL(KEY, SQL) VALUES ('SQLRUNNER_TEST_04','[~ P1 ^ IS_NOT_NULL ^ AND [P1] = [P1] ~]
[~ P2 ^ IS_NULL ^ AND 2 = 2 ~]
[~ P3 ^ Y ^ AND ''Y'' = [P3] ~]
');

ALTER TABLE FW_SQL ADD TIME_OUT;

ALTER TABLE FW_CONTROLLER ADD SESSION_CHECK_YN;
ALTER TABLE FW_CONTROLLER ADD AUTH;
INSERT INTO FW_SQL(KEY, SQL, TIME_OUT) values ('SQLRUNNER_TEST_10','select count(*) from emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp, emp'
, 2);


DELETE FROM FW_VIEW WHERE KEY LIKE 'emp%';
INSERT INTO FW_VIEW(KEY, JSP, TMPL_JSP,TITLE) VALUES ('emp00101','/WEB-INF/classes/com/code5/biz/emp/emp001/jsp/emp00101.jsp','/WEB-INF/classes/com/code5/biz/emp/jsp/empMain.jsp','EMP ��ȸ');
INSERT INTO FW_VIEW(KEY, JSP, TMPL_JSP,TITLE) VALUES ('emp00201','/WEB-INF/classes/com/code5/biz/emp/emp002/jsp/emp00201.jsp','/WEB-INF/classes/com/code5/biz/emp/jsp/empMain.jsp','EMP ����');

DELETE FROM FW_VIEW WHERE KEY LIKE 'null%';
INSERT INTO FW_VIEW(KEY, JSP, TMPL_JSP,TITLE) VALUES ('nullView','/WEB-INF/classes/com/code5/fw/web/jsp/nullView.jsp','','');

DELETE FROM FW_VIEW WHERE KEY LIKE 'err%';
INSERT INTO FW_VIEW(KEY, JSP, TMPL_JSP,TITLE) VALUES ('errView','/WEB-INF/classes/com/code5/fw/web/jsp/errView.jsp','','');


DELETE FROM FW_CONTROLLER WHERE KEY like 'emp%'; 

INSERT INTO FW_CONTROLLER(KEY,CLASS_NAME,METHOD_NAME, ERR_JSP_KEY,SESSION_CHECK_YN, AUTH) VALUES ('emp00101','com.code5.biz.emp.emp001.Emp001','emp00101','', 'Y', '');
INSERT INTO FW_CONTROLLER(KEY,CLASS_NAME,METHOD_NAME, ERR_JSP_KEY,SESSION_CHECK_YN, AUTH) VALUES ('emp00102','com.code5.biz.emp.emp001.Emp001','emp00102','', 'Y', 'A0');
INSERT INTO FW_CONTROLLER(KEY,CLASS_NAME,METHOD_NAME, ERR_JSP_KEY,SESSION_CHECK_YN, AUTH) VALUES ('emp00201','com.code5.biz.emp.emp002.Emp002','emp00201','nullView', 'Y', '');

DELETE FROM FW_CONTROLLER WHERE KEY like 'admin%'; 

INSERT INTO FW_CONTROLLER(KEY,CLASS_NAME,METHOD_NAME, ERR_JSP_KEY,SESSION_CHECK_YN, AUTH) VALUES ('admin001','com.code5.fw.web.Admin','admin001','','Y','A0');
