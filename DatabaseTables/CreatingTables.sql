
CREATE TABLE Books (

    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(15) UNIQUE NOT NULL,
    PublishedDate DATE,
    Genre VARCHAR(100),
    Shelf_Location VARCHAR(50),
    Current_Status VARCHAR(10) CHECK (Current_Status IN ('Available', 'Borrowed'))
);

GO


CREATE TABLE Borrowers (

    BorrowerID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Date_of_Birth DATE,
    Membership_Date DATE NOT NULL
);

GO

CREATE TABLE Loans (

    LoanID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL Foreign Key References Books (BookID),
	BorrowerID INT NOT NULL Foreign Key References Borrowers (BorrowerID),
    Date_Borrowed DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Date_Returned DATE NULL,
);