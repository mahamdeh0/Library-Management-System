
SELECT B.First_Name,B.Last_Name, COUNT(l.LoanID) AS BorrowingFrequency,
RANK() OVER (ORDER BY COUNT(l.LoanID) DESC) AS BorrowingRank
from Loans as L 
inner join Borrowers AS B  on L.BorrowerID = B.BorrowerID
GROUP BY B.First_Name,B.Last_Name
ORDER BY BorrowingFrequency DESC
