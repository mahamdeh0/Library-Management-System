CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport @StartDate DATE, @EndDate DATE
AS
BEGIN

	SELECT B.Title , B.Author ,BOR.First_Name, BOR.Last_Name, L.Date_Borrowed ,L.Due_Date
    FROM Loans AS L

    JOIN Books AS B ON L.BookID = B.BookID
    JOIN Borrowers AS BOR ON L.BorrowerID = BOR.BorrowerID
    WHERE L.Date_Borrowed BETWEEN @StartDate AND @EndDate

    ORDER BY L.Date_Borrowed;
END;
GO

-- Executeing
EXEC sp_BorrowedBooksReport '2023-08-01', '2023-09-17';
