declare @TotalBorrowedBooks int =2;

With Active_Borrowers AS(

SELECT B.First_Name, B.Last_Name , L.BorrowerID,COUNT(*) AS TotalBorrowedBooks FROM Borrowers AS B
INNER JOIN Loans AS L ON L.BorrowerID = B.BorrowerID
WHERE L.Date_Returned IS NULL
GROUP BY first_name, last_name, L.BorrowerID

)

SELECT * FROM Active_Borrowers
WHERE totalBorrowedBooks >= @TotalBorrowedBooks;
