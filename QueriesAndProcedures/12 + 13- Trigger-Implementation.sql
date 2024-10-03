CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    StatusChange VARCHAR(30),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

CREATE OR ALTER TRIGGER trg_LogStatusChange
ON Books AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange)
    SELECT i.BookID,
        CASE 
            WHEN d.Current_Status = 'Available' AND i.Current_Status = 'Borrowed' THEN 'Available to Borrowed'
            WHEN d.Current_Status = 'Borrowed' AND i.Current_Status = 'Available' THEN 'Borrowed to Available'
            ELSE NULL
        END
    FROM inserted i
    INNER JOIN deleted d ON i.BookID = d.BookID
    WHERE (d.Current_Status = 'Available' AND i.Current_Status = 'Borrowed') OR (d.Current_Status = 'Borrowed' AND i.Current_Status = 'Available');
END;
GO

--Execution
select * from books where BookID = 10;

UPDATE Books
SET Current_Status = 'Borrowed'
WHERE BookID = 10;
UPDATE Books
SET Current_Status = 'Available'
WHERE BookID = 10;

--Execution
SELECT * FROM AuditLog;
