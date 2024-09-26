-- This sql command will delete all duplicated records from table db.tbl
-- این کد اس کیو ال تمام رکوردهای تکراری را از جدول حذف می کند

WITH temporaryTable (col1, col2, RN) AS (
     SELECT col1, col2, ROW_NUMBER() OVER (PARTITION BY code ORDER BY code) AS RN
 	FROM db.tbl
)DELETE FROM db.tbl WHERE code IN (SELECT code FROM temporaryTable WHERE RN > 1);
