CREATE OR ALTER PROCEDURE sp_AddNewBorrower (@first_name VARCHAR(20), @last_name VARCHAR(20),
	@email VARCHAR(50), @date_of_birth DATE, @membership_date DATE) 
AS BEGIN

    IF EXISTS (SELECT Email FROM Borrowers WHERE Email = @Email)
    BEGIN
        PRINT 'Error: A borrower with this email address already exists';
    END
    ELSE
    BEGIN
        INSERT INTO Borrowers (First_Name, Last_Name, Email, Date_of_Birth, Membership_Date)
        VALUES (@first_name, @last_name, @Email, @date_of_birth, @membership_date);
        PRINT 'New borrower added successfully.';
    END
END
GO

-- Execution
EXEC sp_AddNewBorrower 
    @first_name = 'Hiba',
    @last_name = 'Doe',
    @Email = 'Hiba@Foothill.com',
    @date_of_birth = '1999-03-30',
    @membership_date = '2024-09-15';

Select * from Borrowers where Email =  'Hiba@Foothill.com'
