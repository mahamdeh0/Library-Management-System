CREATE OR ALTER PROCEDURE PopularGenreByMonth (@month INT) AS 
BEGIN
    SELECT TOP 1 FIRST_VALUE(genre) OVER (ORDER BY [Number of borrowings] DESC) AS [Popular Genre], [Number of Borrowings]
    FROM (
        SELECT COUNT(genre) AS [Number of borrowings], genre 
        FROM Loans AS L
        JOIN Books AS B 
		ON L.bookid = B.bookid
        WHERE MONTH(date_borrowed) = @month
        GROUP BY genre
    ) AS [Borrowings Per Genre]
END
GO

--Execution
EXEC PopularGenreByMonth 9;
