

select  b.recid,
        to_char(b.first_time, 'dd-mon-yy hh24:mi:ss') start_time, 
        a.recid,
        to_char(a.first_time, 'dd-mon-yy hh24:mi:ss') end_time,
        round(((a.first_time-b.first_time)*25)*60,2) minutes
from    v$log_history a, v$log_history b
where   a.recid = b.recid + 1
order   by a.first_time asc
/


     RECID START_TIME                               RECID END_TIME                               MINUTES
---------- ----------------------------------- ---------- ----------------------------------- ----------
     29795 29-déc. -17 22:05:56                     29796 29-déc. -17 22:35:53                      31,2
     29796 29-déc. -17 22:35:53                     29797 29-déc. -17 23:05:54                     31,27
     29797 29-déc. -17 23:05:54                     29798 29-déc. -17 23:35:53                     31,23
     29798 29-déc. -17 23:35:53                     29799 30-déc. -17 00:05:48                     31,16
     29799 30-déc. -17 00:05:48                     29800 30-déc. -17 00:35:49                     31,27
     29800 30-déc. -17 00:35:49                     29801 30-déc. -17 01:05:49                     31,25
     29801 30-déc. -17 01:05:49                     29802 30-déc. -17 01:35:50                     31,27
     29802 30-déc. -17 01:35:50                     29803 30-déc. -17 02:05:49                     31,23
     29803 30-déc. -17 02:05:49                     29804 30-déc. -17 02:35:51                     31,28
     29804 30-déc. -17 02:35:51                     29805 30-déc. -17 03:05:50                     31,23
     29805 30-déc. -17 03:05:50                     29806 30-déc. -17 03:35:51                     31,27
     29806 30-déc. -17 03:35:51                     29807 30-déc. -17 04:05:52                     31,27
     29807 30-déc. -17 04:05:52                     29808 30-déc. -17 04:35:52                     31,25
     29808 30-déc. -17 04:35:52                     29809 30-déc. -17 05:05:52                     31,25
     29809 30-déc. -17 05:05:52                     29810 30-déc. -17 05:35:52                     31,25
     29810 30-déc. -17 05:35:52                     29811 30-déc. -17 06:05:53                     31,27
     29811 30-déc. -17 06:05:53                     29812 30-déc. -17 06:35:53                     31,25
     29812 30-déc. -17 06:35:53                     29813 30-déc. -17 07:05:54                     31,27
