CREATE UNIQUE INDEX idx_Books_ISBN ON Books(ISBN);
CREATE INDEX idx_Books_Genre ON Books(Genre);
CREATE INDEX idx_Books_CurrentStatus ON Books(Current_Status);

CREATE UNIQUE INDEX idx_Borrowers_Email ON Borrowers(Email);
CREATE INDEX idx_Borrowers_DateOfBirth ON Borrowers(Date_Of_Birth);

CREATE INDEX idx_Loans_BookID ON Loans(BookID);
CREATE INDEX idx_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX idx_Loans_DateBorrowed ON Loans(Date_Borrowed);
CREATE INDEX idx_Loans_DueDate ON Loans(Due_Date);
CREATE INDEX idx_Loans_DateReturned ON Loans(Date_Returned);
