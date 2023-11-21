use libraryapp;

CREATE TABLE author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100),
    Biography TEXT,
    Nationality VARCHAR(50),
    DateOfBirth DATE
);

CREATE TABLE catalog (
    CatalogID INT auto_increment PRIMARY KEY,
    CatalogName VARCHAR(45)
);

ALTER TABLE catalog
MODIFY COLUMN CatalogID INT AUTO_INCREMENT;


CREATE TABLE book (
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(50),
    PublicationDate DATE,
    Language VARCHAR(30),
    NumOfPages INT,
    Price FLOAT,
    catalog_catalogID INT,
    FOREIGN KEY (catalog_catalogID) REFERENCES catalog(CatalogID)
);

-- drop table book;

-- select * from book;
-- ALTER TABLE book
-- DROP FOREIGN KEY catalog_catalogID;

-- DESCRIBE book;

-- ALTER TABLE book
-- ADD CONSTRAINT constraint_name
-- FOREIGN KEY (new_column) REFERENCES referenced_table(referenced_column);



CREATE TABLE authorbook (
    AuthorBookId INT PRIMARY KEY,
    author_AuthorID INT,
    book_ISBN INT,
    FOREIGN KEY (author_AuthorID) REFERENCES author(AuthorID),
    FOREIGN KEY (book_ISBN) REFERENCES book(ISBN)
);

CREATE TABLE genre (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(30),
    Description VARCHAR(80)
);

CREATE TABLE bookgenre (
    BookGenreID INT PRIMARY KEY,
    genre_GenreID INT,
    book_ISBN INT,
    FOREIGN KEY (genre_GenreID) REFERENCES genre(GenreID),
    FOREIGN KEY (book_ISBN) REFERENCES book(ISBN)
);

CREATE TABLE librarymember (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    MembershipType VARCHAR(20),
    RegistrationDate DATE
);

CREATE TABLE librarystaff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(20),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Username VARCHAR(20),
    Password VARCHAR(100)
);

CREATE TABLE membershippayment (
    FeeID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus TINYINT(1),
    MembershipPeriod VARCHAR(50),
    ReceiptNumber VARCHAR(20),
    librarystaff_StaffID INT,
    FOREIGN KEY (MemberID) REFERENCES librarymember(MemberID),
    FOREIGN KEY (librarystaff_StaffID) REFERENCES librarystaff(StaffID)
);

select * from membershippayment;

CREATE TABLE bookissue (
    BookIssueID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATETIME,
    librarymember_MemberID INT,
    librarystaff_StaffID INT,
    book_ISBN INT,
    FOREIGN KEY (librarymember_MemberID) REFERENCES librarymember(MemberID),
    FOREIGN KEY (librarystaff_StaffID) REFERENCES librarystaff(StaffID),
    FOREIGN KEY (book_ISBN) REFERENCES book(ISBN)
);



INSERT INTO author (AuthorName, Biography, Nationality, DateOfBirth)
VALUES ('John Doe', 'A famous author', 'American', '1990-01-15');

INSERT INTO catalog (CatalogID, CatalogName)
VALUES (1, 'Fiction');

INSERT INTO book (title, publicationDate, language, numOfPages, price, catalog)
VALUES ('Sample Book', '2023-09-15', 'English', 300, 19.99, 1);

INSERT INTO genre (GenreName, Description)
VALUES ('Mystery', 'Books of mystery and suspense');

INSERT INTO bookgenre (BookGenreID, genre_GenreID, book_ISBN)
VALUES (1, 1, 1);

INSERT INTO librarymember (Name, Address, Phone, Email, MembershipType, RegistrationDate)
VALUES ('Alice Smith', '123 Main St', '555-123-4567', 'alice@example.com', 'Premium', '2023-09-20');

INSERT INTO librarystaff (Name, Role, Phone, Email, Username, Password)
VALUES ('Jane Johnson', 'Librarian', '555-987-6543', 'jane@example.com', 'jane', 'hashed_password');


INSERT INTO membershippayment (MemberID, PaymentDate, Amount, PaymentMethod, PaymentStatus, MembershipPeriod, ReceiptNumber, librarystaff_StaffID)
VALUES (1, '2023-book09-20', 50.00, 'Credit Card', 1, 'Annual', '12345', 1);

INSERT INTO bookissue (Date, librarymember_MemberID, librarystaff_StaffID, book_ISBN)
VALUES ('2023-09-21 10:00:00', 1, 1, 1);

INSERT INTO authorbook (AuthorBookId, author_AuthorID, book_ISBN)
VALUES (1, 1, 1);

describe book;




select * from book;
select * from catalog;
select * from author;
select * from authorbook;
select * from genre;
select * from bookgenre;
select * from librarymember;
select * from librarystaff;
select * from membershippayment;
select * from bookissue;

drop table librarymember;
