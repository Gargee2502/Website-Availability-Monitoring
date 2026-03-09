#!/bin/bash

sqlite3 ../database/monitor.db <<EOF
SELECT website,
COUNT(*) as checks,
SUM(CASE WHEN http_status IN (200,301,302,304) THEN 1 ELSE 0 END)*100.0/COUNT(*) as uptime
FROM monitor
GROUP BY website;
EOF
