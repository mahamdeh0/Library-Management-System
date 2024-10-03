DROP TABLE IF EXISTS #OverdueBorrowers
GO

CREATE TABLE #OverdueBorrowers (
        BorrowerID INT PRIMARY KEY,
        First_Name VARCHAR(30),
        Last_Name VARCHAR(30),
        Email VARCHAR(50)
);
GO

CREATE or ALTER  PROCEDURE GetOverdueBook
AS
BEGIN
    INSERT INTO #OverdueBorrowers (BorrowerID, First_Name, Last_Name, Email)
    SELECT DISTINCT b.BorrowerID, b.First_Name, b.Last_Name, b.Email
    FROM Borrowers AS b
    INNER JOIN Loans AS l ON b.BorrowerID = l.BorrowerID
    WHERE l.Due_Date < GETDATE() AND l.Date_Returned IS NULL;

    SELECT o.BorrowerID, o.First_Name, o.Last_Name, o.Email, l.BookID, b.Title,
        l.Date_Borrowed, l.Due_Date, l.Date_Returned
    FROM #OverdueBorrowers AS o
    INNER JOIN Loans AS l ON o.BorrowerID = l.BorrowerID
    INNER JOIN Books AS b ON l.BookID = b.BookID
    WHERE l.Due_Date < GETDATE() AND l.Date_Returned IS NULL
END;
GO

--Execution
EXEC GetOverdueBook;
