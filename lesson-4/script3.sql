/* MS SQL */

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE status = 404
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 485 ms,  elapsed time = 496 ms.
*/

CREATE INDEX Log_status ON Log (status);
DROP INDEX Log_status ON Log;

/*
 SQL Server Execution Times:
   CPU time = 62 ms,  elapsed time = 52 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE clientIP = '135.4.34.30'
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 1250 ms,  elapsed time = 1263 ms.
*/

CREATE INDEX Log_clientIP ON Log (clientIP);
DROP INDEX Log_clientIP ON Log;

/*
 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE httpMethod = 'POST' AND status = 404
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 547 ms,  elapsed time = 574 ms.
*/

CREATE INDEX Log_httpMethod_status ON Log (httpMethod, status);
DROP INDEX Log_httpMethod_status ON Log;

/*
 SQL Server Execution Times:
   CPU time = 15 ms,  elapsed time = 8 ms.
*/

CREATE INDEX Log_status_httpMethod ON Log (status, httpMethod);
DROP INDEX Log_status_httpMethod ON Log;

/*
 SQL Server Execution Times:
   CPU time = 16 ms,  elapsed time = 8 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE status = 404
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 47 ms,  elapsed time = 38 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE httpMethod = 'POST'
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 1125 ms,  elapsed time = 1120 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE requestTime >= '2023-04-06T18:50:41.543Z'
  AND requestTime < '2023-05-23T02:12:13.150Z'
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 875 ms,  elapsed time = 877 ms.
*/

CREATE INDEX Log_requestTime ON Log (requestTime);
DROP INDEX Log_requestTime ON Log;

/*
 SQL Server Execution Times:
   CPU time = 531 ms,  elapsed time = 538 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE requestTime >= DATEADD(DAY, -7, '2023-04-25T12:00:00.000Z')
  AND requestTime < '2023-04-25T12:00:00.000Z'
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 594 ms,  elapsed time = 598 ms.
*/

SET STATISTICS TIME ON
SELECT COUNT(*)
FROM Log
WHERE requestTime >= DATEADD(DAY, -7, '2023-04-25T12:00:00.000Z')
  AND requestTime < '2023-04-25T12:00:00.000Z'
  AND status = 404
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 547 ms,  elapsed time = 544 ms.
*/

CREATE INDEX Log_requestTime_status ON Log (requestTime, status);
DROP INDEX Log_requestTime_status ON Log;

/*
 SQL Server Execution Times:
   CPU time = 63 ms,  elapsed time = 61 ms.
*/

CREATE INDEX Log_status_requestTime ON Log (status, requestTime);
DROP INDEX Log_status_requestTime ON Log;

/*
 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 6 ms.
*/

SET STATISTICS TIME ON
SELECT path
FROM Log
WHERE requestTime >= DATEADD(DAY, -7, '2023-04-25T12:00:00.000Z')
  AND requestTime < '2023-04-25T12:00:00.000Z'
  AND status = 404
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 656 ms,  elapsed time = 889 ms.
*/

CREATE INDEX Log_status_requestTime_path ON Log (status, requestTime, path);
DROP INDEX Log_status_requestTime_path ON Log;

/*
 SQL Server Execution Times:
   CPU time = 47 ms,  elapsed time = 409 ms.
*/

SET STATISTICS TIME ON
SELECT path
FROM Log
WHERE requestTime >= DATEADD(DAY, -7, '2023-04-25T12:00:00.000Z')
  AND requestTime < '2023-04-25T12:00:00.000Z'
  AND status = 404
ORDER BY path
SET STATISTICS TIME OFF

/*
 SQL Server Execution Times:
   CPU time = 687 ms,  elapsed time = 1120 ms.
*/

/*
 SQL Server Execution Times:
   CPU time = 203 ms,  elapsed time = 631 ms.
*/

CREATE INDEX Log_status_requestTime__path ON Log (status, requestTime) INCLUDE (path);
DROP INDEX Log_status_requestTime__path ON Log;

/*
 SQL Server Execution Times:
   CPU time = 203 ms,  elapsed time = 578 ms.
*/