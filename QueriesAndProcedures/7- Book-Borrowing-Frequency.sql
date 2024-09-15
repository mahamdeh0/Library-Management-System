CREATE OR ALTER FUNCTION fn_BookBorrowingFrequency( @BookID INT )
RETURNS INT
AS
BEGIN
    DECLARE @BorrowingCount INT;

    SELECT @BorrowingCount = COUNT(*)
    FROM Loans
    WHERE BookID = @BookID;

    RETURN @BorrowingCount;
END;
GO

--Execution
SELECT dbo.fn_BookBorrowingFrequency(54) AS BorrowingCount;
