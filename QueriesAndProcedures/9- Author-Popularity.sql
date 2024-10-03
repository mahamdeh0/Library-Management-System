WITH AuthorBorrowingFrequency AS(
    SELECT
        b.Author AS Author,
        COUNT(l.LoanID) AS BorrowingFrequency
    FROM
        Books b
    LEFT JOIN
        Loans l ON b.BookID = l.BookID
    GROUP BY
        b.Author
),
RankedAuthors AS(
    SELECT
        Author,
        BorrowingFrequency,
        RANK() OVER (ORDER BY BorrowingFrequency DESC) AS AuthorRank
    FROM
        AuthorBorrowingFrequency
)
SELECT
    Author,
    BorrowingFrequency,
    AuthorRank
FROM
    RankedAuthors;
