

-- Execution Time Of SQL_ID By Date Using Active Session History (ASH)



SELECT TRUNC(h.sample_time) "Execution Date",
  h.sql_id,
  h.sql_child_number,
  h.sql_plan_hash_value,
  h.module,
  SUM(h.wait_time + h.time_waited) / 1000 "Total Wait Time (Sec)"
FROM dba_hist_active_sess_history h --alternative table is v$active_session_history
WHERE h.sql_id = '&sql_id'
  --AND h.module = 'XLAACCPB'
  --AND h.sample_time BETWEEN sysdate - 1/24 AND sysdate --event in the last hour
GROUP BY TRUNC(h.sample_time),
  h.sql_id,
  h.sql_child_number,
  h.sql_plan_hash_value,
  h.module
ORDER BY TRUNC(h.sample_time),
  SUM(h.wait_time + h.time_waited) DESC;
