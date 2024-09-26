-- This sql command will delete all duplicated records from table db.tbl (ROWID is a default autoincrementing id in sqlite)
-- این کد اس کیو ال تمام رکوردهای تکراری را از جدول حذف می کند

WITH temporaryTable (ROWID, code, description, makhaz, VAT, olaviat, valid, sazman, standard, RN) AS (
    SELECT ROWID, code, description, makhaz, VAT, olaviat, valid, sazman, standard, ROW_NUMBER() OVER (PARTITION BY code ORDER BY code) AS RN
	FROM tbl1  
)DELETE FROM tbl1 WHERE ROWID IN (SELECT ROWID FROM temporaryTable WHERE RN > 1);
