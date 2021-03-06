


-- UNDO content
 select count(segment_name),sum(bytes/1024/1024),status 
 from dba_undo_extents 
 group by status
/

COUNT(SEGMENT_NAME) SUM(BYTES/1024/1024) STATUS
------------------- -------------------- ---------
1                        8                ACTIVE
1116                  3599.67578         EXPIRED
601                    153.375         UNEXPIRED

8M = (Active) + 153M(Unexpired) = 161M Busy

3599M = (Expired)= Free, and can be reutilized.


-- Recreate UNDO
create undo tablespace UNDOTBS2 datafile  '/apps/oracledata/ODB1WDR0/osys2/undo03.dbf' size 500M;

alter system set UNDO_TABLESPACE=UNDOTBS2;

drop tablespace UNDOTBS1 including contents and datafiles;

create undo tablespace UNDOTBS1 datafile  '/apps/oracledata/ODB1WDR0/data0001/undo01.dbf' size 1024M AUTOEXTEND ON MAXSIZE 2048M;
ALTER DATABASE DATAFILE '/apps/oracledata/ODB1WDR0/data0001/undo01.dbf' AUTOEXTEND ON NEXT 100M;

ALTER TABLESPACE "UNDOTBS1" ADD DATAFILE '/apps/oracledata/ODB1WDR0/data0001/undo02.dbf' SIZE 1024M AUTOEXTEND ON NEXT 100M MAXSIZE 10000M;

alter system set UNDO_TABLESPACE=UNDOTBS1;

drop tablespace UNDOTBS2 including contents and datafiles;



drop tablespace UNDOTBS1 including contents and datafiles
*
ERROR at line 1:
ORA-01548: active rollback segment '_SYSSMU13_1568003414$' found, terminate
dropping tablespace

alter system set undo_management='MANUEL' scope=spfile;


select 
segment_name, 
status 
from 
dba_rollback_segs 
where 
tablespace_name='UNDOTBS1'
and
status = 'NEEDS RECOVERY';

_offline_rollback_segments=(_SYSSMU13_1568003414$,_SYSSMU14_1698948724$,_SYSSMU15_530686930$,_SYSSMU16_1469781637$,_SYSSMU17_1057324931$,_SYSSMU18_2689531718$,_SYSSMU19_4223166696$,_SYSSMU20_3455246255$,_SYSSMU21_171180133$,_SYSSMU22_3522077044$)
