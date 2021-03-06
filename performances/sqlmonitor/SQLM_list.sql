REPORT_SQL_MONITOR_LIST

The REPORT_SQL_MONITOR_LIST function was added in Oracle 11g Release 2 to generate a summary screen,
similar to that on the "Monitored SQL Executions" page of Enterprise Manager. 
There are a number of parameters to filer the content of the report (shown here), 
but most of the time you will probably only use the TYPE and REPORT_LEVEL parameters, 
similar to those in the REPORT_SQL_MONITOR function. The query below shows how the function can be used.

Examples of the output for each available TYPE are displayed below.

TEXT
HTML
XML

SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET LINESIZE 1000
SET PAGESIZE 0
SET TRIM ON
SET TRIMSPOOL ON
SET ECHO OFF
SET FEEDBACK OFF

SPOOL sqlout.txt
SELECT DBMS_SQLTUNE.report_sql_monitor_list(
  type         => 'TEXT',
  report_level => 'ALL') AS report
FROM dual;
SPOOL OFF



                                                                                SQL Monitoring List
                                                                               =====================


===================================================================================================================================================================================
|       Status        | Duration |       SQL Id        | Exec Id  |        Start        |        User         |    Module/Action    | Dop | DB Time |  IOs  |      SQL Text       |
===================================================================================================================================================================================
| EXECUTING           |      22s |    6x2y9kdw40jwz    | 16777216 | 06/25/2015 08:28:51 | EIM_BATCH           | bsh@parva4sd/-   |     |     19s |   989 | DELETE FROM SIEBEL. |
|                     |          |                     |          |                     |                     |                     |     |         |       | S_SRV_REQ1_FNX      |
|                     |          |                     |          |                     |                     |                     |     |         |       | WHERE               |
|                     |          |                     |          |                     |                     |                     |     |         |       | (AF_FN_ACCNT_ID IN  |
|                     |          |                     |          |                     |                     |                     |     |         |       | (SELECT             |
|                     |          |                     |          |                     |                     |                     |     |         |       | T_DELETED_ROW_ID    |
|                     |          |                     |          |                     |                     |                     |     |         |       | FROM                |
|                     |          |                     |          |                     |                     |                     |     |         |       | SIEBEL.EIM_ASSET    |
|                     |          |                     |          |                     |                     |                     |     |         |       | WHERE               |
|                     |          |                     |          |                     |                     |                     |     |         |       | (IF_ROW_BATCH_NUM = |
|                     |          |                     |          |                     |                     |                     |     |         |       | :V1 AND             |
|                     |          |                     |          |                     |                     |                     |     |         |       | T_DELETED_ROW_ID IS |
|                     |          |                     |          |                     |                     |                     |     |         |       | NOT NULL AND        |
|                     |          |                     |          |                     |                     |                     |     |         |       | T_DELETED_ROW_I...  |
| EX
