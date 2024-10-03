
declare  @BorrowerID int = 100

select BO.First_Name AS [Borrower first name] , BO.Last_Name AS [Borrower Last name] , 
L.BorrowerID , B.Title , B.Author ,L.Date_Borrowed as [Date Borrowd]
from Books as B 
INNER JOIN Loans as L ON B.BookID = l.BookID
INNER JOIN Borrowers AS BO ON BO.BorrowerID = L.BorrowerID
WHERE  L.BorrowerID = @BorrowerID;
