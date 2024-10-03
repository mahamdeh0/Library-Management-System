CREATE OR ALTER FUNCTION fn_CalculateOverdueFees( @LoanID INT )
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @DueDate DATE;
    DECLARE @ReturnDate DATE;
    DECLARE @OverdueDays INT;
    DECLARE @Fee DECIMAL(10, 2);

    SELECT @DueDate = Due_Date, @ReturnDate = Date_Returned
    FROM Loans
    WHERE LoanID = @LoanID;

    IF @ReturnDate IS NULL
    BEGIN
        SET @ReturnDate = GETDATE();
    END

    SET @OverdueDays = DATEDIFF(DAY, @DueDate, @ReturnDate);

    IF @OverdueDays > 0
    BEGIN
        IF @OverdueDays <= 30
        BEGIN
            SET @Fee = @OverdueDays * 1.00; 
        END
        ELSE
        BEGIN
            SET @Fee = (30 * 1.00) + ((@OverdueDays - 30) * 2.00); 
        END
    END
    ELSE
    BEGIN
        SET @Fee = 0.00;
    END

    RETURN @Fee;
END;
GO

--Execution

select * from Loans where LoanID = 1005

SELECT dbo.fn_CalculateOverdueFees(1005) AS OverdueFee;
