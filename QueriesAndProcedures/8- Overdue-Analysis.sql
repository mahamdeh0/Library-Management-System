SELECT 
    B.BookID,
    B.Title,
    L.Date_Borrowed,
    L.Due_Date,
    L.Date_Returned,
    BOR.BorrowerID,
    BOR.First_Name,
    BOR.Last_Name
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
JOIN 
    Borrowers BOR ON l.BorrowerID = BOR.BorrowerID
WHERE 
    (
        l.Date_Returned IS NOT NULL 
        AND DATEDIFF(DAY, l.Due_Date, l.Date_Returned) > 30
    )
    OR
    (
        l.Date_Returned IS NULL 
        AND DATEDIFF(DAY, l.Due_Date, GETDATE()) > 30
    );
