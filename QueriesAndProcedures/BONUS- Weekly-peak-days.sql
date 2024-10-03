DECLARE @TotalLoans FLOAT= (SELECT COUNT(*) FROM Loans);

SELECT TOP 3 FORMAT(Date_Borrowed, 'ddd') AS DayOfWeekName, 
    ROUND((COUNT(*) * 100.0 / @TotalLoans), 2) AS LoanPercentage 
FROM Loans
GROUP BY FORMAT(Date_Borrowed, 'ddd')
ORDER BY LoanPercentage DESC;
