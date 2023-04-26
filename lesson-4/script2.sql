TRUNCATE TABLE Log;

BULK INSERT Log
FROM 'C:\Users\mark\source\studying-sql\lesson-4\log.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
);

SELECT COUNT(*) FROM Log;