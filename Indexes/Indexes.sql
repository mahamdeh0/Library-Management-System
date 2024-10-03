CREATE INDEX idx_Loan_BorrowerID ON Loans (BorrowerID);
CREATE INDEX idx_Loan_LoanID ON Loans (LoanID);
CREATE INDEX idx_Loan_BookID ON Loans (BookID);
CREATE INDEX idx_Loan_DateBorrowed ON Loans (Date_Borrowed);
CREATE INDEX idx_Loan_BorrowerID_DateReturned ON Loans (BorrowerID, Date_Returned);
CREATE INDEX idx_Loan_DateReturned_DueDate ON Loans (Date_Returned, Due_Date); 
CREATE INDEX idx_Loan_DateBorrowed ON Loans (Date_Borrowed);
CREATE NONCLUSTERED INDEX idx_Loans_DateReturned_BorrowerID ON Loans (Date_Returned) INCLUDE (BorrowerID);

CREATE INDEX idx_BookID ON Books (BookID);
CREATE INDEX idx_Book_Author ON Books (Author);
CREATE INDEX idx_Book_CurrentStatus ON Books (Current_Status);

CREATE INDEX idx_BorrowerID ON Borrowers (BorrowerID);
CREATE INDEX idx_Borrower_Email ON Borrowers (Email);





