WITH BorrowerAgeGroups AS (
    SELECT  BOR.BorrowerID,
        CASE 
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
            WHEN DATEDIFF(YEAR, BOR.Date_of_Birth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
            ELSE 'more than 50'
        END AS AgeGroup,

    L.BookID FROM Borrowers AS BOR
    INNER JOIN Loans L ON BOR.BorrowerID = L.BorrowerID
),

GenreBorrowCounts AS (
    SELECT BAG.AgeGroup, B.Genre , COUNT(*) AS BorrowCount
    FROM BorrowerAgeGroups AS BAG
    INNER JOIN Books AS B ON BAG.BookID = B.BookID
    GROUP BY BAG.AgeGroup, B.Genre
),

MaxBorrowCounts AS (
    SELECT AgeGroup, MAX(BorrowCount) AS MaxCount
    FROM GenreBorrowCounts
    GROUP BY AgeGroup
)

SELECT GBC.AgeGroup, GBC.Genre, GBC.BorrowCount
FROM GenreBorrowCounts AS GBC
INNER JOIN MaxBorrowCounts AS MB ON GBC.AgeGroup = MB.AgeGroup AND GBC.BorrowCount = MB.MaxCount
ORDER BY GBC.AgeGroup;
