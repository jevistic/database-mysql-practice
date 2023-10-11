CREATE DATABASE librarymanagement;

USE librarymanagement;

CREATE TABLE Book (
	ISBN int AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(50),
    PublicationDate DATE,
    AuthorID INT,
    GenreID INT,
    Language VARCHAR(30),
    NumOfPages INT,
    Price float4
    );

DROP TABLE Book;

DROP TABLE LibraryMember;
CREATE TABLE LibraryMember (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    MembershipType VARCHAR(20),
    RegistrationDate DATE
);

CREATE TABLE LibraryStaff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Username VARCHAR(20) NOT NULL,
    Password VARCHAR(100) NOT NULL
);

DROP TABLE Genre;
CREATE TABLE Genre (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(30) NOT NULL,
    Description varchar(80)
);

CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Biography TEXT,
    Nationality VARCHAR(50),
    DateOfBirth DATE
);

CREATE TABLE MembershipPayment (
    FeeID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    PaymentStatus BOOLEAN DEFAULT 0,
    MembershipPeriod VARCHAR(50),
    ReceiptNumber VARCHAR(20)
    );
    

ALTER TABLE Book
ADD CONSTRAINT FK_Author FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID);

ALTER TABLE Book
ADD CONSTRAINT FK_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID);

ALTER TABLE MembershipPayment
ADD CONSTRAINT FK_Member FOREIGN KEY (MemberID) REFERENCES LibraryMember(MemberID);

SELECT * FROM MembershipPayment;
  
SELECT * FROM Book;


INSERT INTO Genre (GenreName, Description)
VALUES ('Mystery', 'Books that involve solving a mystery or crime.'),
  ('Science Fiction', 'Fictional stories based on scientific and technological concepts.'),
  ('Romance', 'Books centered around romantic relationships.'),
  ('Fantasy', 'Books set in fantastical or imaginary worlds.'),
  ('History', 'Books that explore historical events and periods.');

SELECT * FROM Genre;



DROP TABLE Author;
INSERT INTO Author (AuthorName, Biography, Nationality, DateOfBirth)
VALUES ('Harper Lee', 'Nelle Harper Lee was an American novelist. She is best known for her novel "To Kill a Mockingbird", which won the Pulitzer Prize in 1961.', 'American', '1926-04-28'),
  ('George Orwell', 'Eric Arthur Blair, known by his pen name George Orwell, was an English novelist and essayist. He is best known for his dystopian novel "1984."', 'British', '1903-06-25'),
  ('J.D. Salinger', 'Jerome David Salinger was an American writer best known for his novel "The Catcher in the Rye."', 'American', '1919-01-01'),
  ('Jane Austen', 'Jane Austen was an English novelist known primarily for her six major novels, including "Pride and Prejudice."', 'British', '1775-12-16'),
  ('F. Scott Fitzgerald', 'Francis Scott Fitzgerald was an American novelist and short story writer, known for his novel "The Great Gatsby."', 'American', '1896-09-24');

SELECT * FROM Author;

INSERT INTO Book (Title, PublicationDate, AuthorID, GenreID, Language, NumOfPages, Price)
VALUES ('To Kill a Mockingbird', '1960-07-11', 1, 1, 'English', 281, 9.99),
  ('1984', '1949-06-08', 2, 2, 'English', 328, 12.99),
  ('The Catcher in the Rye', '1951-07-16', 3, 1, 'English', 224, 8.99),
  ('Pride and Prejudice', '1813-01-28', 4, 3, 'English', 279, 7.99),
  ('The Great Gatsby', '1925-04-10', 5, 1, 'English', 180, 10.99);
  
  SELECT * FROM Book;
  

INSERT INTO LibraryMember (Name, Address, Phone, Email, MembershipType, RegistrationDate)
VALUES ('John Doe', '123 Main St, City', '555-1234', 'john@example.com', 'Student', '2023-01-15'),
  ('Jane Smith', '456 Elm St, Town', '555-5678', 'jane@example.com', 'Faculty', '2023-01-20'),
  ('Bob Johnson', '789 Oak St, Village', '555-9876', 'bob@example.com', 'Community', '2023-01-10'),
  ('Alice Brown', '101 Pine St, Suburb', '555-4321', 'alice@example.com', 'Student', '2023-01-25'),
  ('Eve Green', '202 Cedar St, County', '555-8765', 'eve@example.com', 'Guest', '2023-01-12');

SELECT * FROM LibraryMember;



INSERT INTO LibraryStaff (Name, Role, Phone, Email, Username, Password)
VALUES ('Admin User', 'Librarian', '555-1000', 'admin@example.com', 'admin', 'adminpassword'),
  ('Library Assistant 1', 'Clerk', '555-2000', 'assistant1@example.com', 'assistant1', 'password1'),
  ('Library Assistant 2', 'Clerk', '555-2001', 'assistant2@example.com', 'assistant2', 'password2'),
  ('Manager', 'Manager', '555-3000', 'manager@example.com', 'manager', 'managerpassword'),
  ('Cataloger', 'Clerk', '555-2002', 'cataloger@example.com', 'cataloger', 'password3');
  
  SELECT * FROM LibraryStaff;


INSERT INTO MembershipPayment (MemberID, PaymentDate, Amount, PaymentMethod, PaymentStatus, MembershipPeriod, ReceiptNumber)
VALUES (1, '2023-09-01', 50.00, 'Online', 1, 'Annual', 'MP20230001'),
  (2, '2023-09-05', 30.00, 'Online', 1, 'Quarterly', 'MP20230002'),
  (3, '2023-09-10', 20.00, 'Cash', 0, 'Monthly', 'MP20230003'),
  (4, '2023-09-15', 40.00, 'Online', 1, 'Annual', 'MP20230004'),
  (5, '2023-09-20', 25.00, 'Cash', 1, 'Quarterly', 'MP20230005');

  SELECT * FROM MembershipPayment;
  
  SELECT librarymanagement;
  
  
  
  
 -- Group By practice

 SELECT * FROM book;
 
 -- Total Books written by each Author
 SELECT AuthorID, count(Title) AS TotalBooks FROM book group by Title, AuthorID;
 
 -- Total Books in each genre
 SELECT GenreID, count(GenreID) as TotalBooks from book group by GenreID;
 
 -- total number of books published in each language
 SELECT Language, count(Title) as TotalBooks from book group by Language;
 
 -- average number of pages for books in each genre
 SELECT GenreID, avg(NumOfPages) AS "Average NumberOfPages" from book group by GenreID;
 
 -- total price of all books in each language
 SELECT Language, SUM(Price) AS TotalBooksPrice from book group by Language;
 
 -- the author with the highest number of books
 SELECT AuthorID, count(Title) AS TotalBooks from book group by AuthorID order by TotalBooks Desc limit 1;
 
 --  total revenue generated from book sales in each genre
 SELECT GenreID, SUM(Price) AS TotalRevenue from book group by GenreID;
 
 
 
 
 
 
 -- Joins Practice
 
 select * from book;
 select * from genre;
 
 delete from book where ISBN > 5;
 
-- list of books (title and author) in a specific genre 
 SELECT b.Title, a.AuthorName, g.GenreName
 FROM genre g 
 INNER JOIN book b ON g.GenreID = b.GenreID 
 INNER JOIN author a ON b.AuthorID = a.AuthorID
 WHERE  g.GenreName = "Mystery";
 
 --  total number of books authored by a specific author (e.g., J.K. Rowling)
 Select a.AuthorName, count(b.ISBN) as TotalBooks 
 from book b 
 INNER JOIN author a on b.AuthorID = a.AuthorID 
 where a.AuthorName like "Harper Lee" 
 group by a.AuthorName;
 
 -- most popular genre (the one with the most books) in the library.
 select g.GenreName, count(b.ISBN) AS TotalBooks 
 from genre g 
 INNER JOIN book b ON g.GenreID=b.GenreID 
 group by g.GenreName 
 order by TotalBooks DESC 
 LIMIT 1;
 
 
 -- LEFT JOIN
 SELECT * FROM genre g LEFT JOIN book b ON b.GenreID=g.GenreID;

-- list of authors and their books, including authors with no books
SELECT author.AuthorName, book.Title
FROM author
LEFT JOIN authorbook ON author.AuthorID = authorbook.author_AuthorID
LEFT JOIN book ON authorbook.book_ISBN = book.ISBN;


-- RIGHT JOIN

-- list of books and their authors, including authors without books.
SELECT author.AuthorName, book.Title
FROM book
RIGHT JOIN authorbook ON book.ISBN = authorbook.book_ISBN
RIGHT JOIN author ON authorbook.author_AuthorID = author.AuthorID;



-- Removing foreign key authorID
 select * from book;
 alter table book drop foreign key FK_Author;
  alter table book drop column AuthorID;
  
  -- Removing foriegn key GenreID
  select * from book;
  alter table book drop foreign key FK_Genre;
  alter table book drop column GenreID;
  
  -- Adding foreign key catalog
  select * from catalog;
  alter table book add constraint catalog_catalogID foreign key (catalog_catalogID) references catalog(catalogID);
  select * from book;
  alter table book add column catalog_catalogID int;
  
  -- Adding data to catalog
  insert into catalog (CatalogID, CatalogName)
  Values 
  (1, "Fiction"),
  (2, "Mystery"),
  (3, "Romantic");
  
  -- Adding catalogID to book table
  Update book
  set catalog_catalogID = 1
  where ISBN < 4;
  
Update book
  set catalog_catalogID = 2
  where ISBN > 3;
  
  
  -- Adding bookID as a fireign key in bookissue
  select * from librarymember;
  select * from bookissue;
  
  alter table bookissue
  add column book_ISBN int;
  
  alter table bookissue
  add constraint book_ISBN
  foreign key(book_ISBN) references book(ISBN);
  
  -- Adding FeeID ias a foreign key in library staff table
  select * from librarystaff;
  select * from membershippayment;
  
  alter table librarystaff
  add column membershippayment_FeeID int;
  
  alter table librarystaff
  add constraint membershipPayment_FeeID
  foreign key (membershipPayment_FeeID) references membershippayment(FeeID);
  
  update librarystaff
  set membershipPayment_FeeID = 1;
  
  
  use librarymanagement;
  alter table librarystaff
  drop column membershippayment_FeeID;
  
  alter table membershippayment
  add column librarystaff_StaffID int;
  alter table membershippayment
  add constraint foreign key(librarystaff_StaffID) references librarystaff(StaffID);
  
  






 
 -- Joins Practice with new schema
 
 select * from authorbook;
 select * from bookgenre;
 select * from author;
 
 delete from book where ISBN > 5;
 
-- list of books (title and author) in a specific genre 
select
	b.Title,
    a.AuthorName,
    g.GenreName
from 
	book b
inner join
	authorbook ab on b.ISBN = ab.book_ISBN
inner join
	author a on a.AuthorID = ab.author_AuthorID
inner join 
	bookgenre bg on bg.book_ISBN = b.ISBN
inner join 
	genre g on g.GenreID = bg.genre_GenreID
where
	g.GenreName like "Fantasy";


 
 --  total number of books authored by a specific author
 select
	a.AuthorName,
    count(b.ISBN) as TotalBooks
from
	book b
inner join 
	authorbook ab on ab.book_ISBN = b.ISBN
inner join 
	author a on a.AuthorID = ab.author_AuthorID
group by
	a.AuthorID
having
	a.AuthorName like "George Orwell";
 
 
 
 -- most popular genre (the one with the most books) in the library.
 select
	g.GenreName,
    count(b.ISBN) as TotalBooks
from
	book b
inner join 
	bookgenre bg on bg.book_ISBN = b.ISBN
inner join 
	genre g on g.GenreID = bg.genre_GenreID
group by
	g.GenreID
order by
	TotalBooks desc
limit
	1;
 
 
 
 
 -- LEFT JOIN

-- list of authors and their books, including authors with no books
select 
	a.AuthorName,
    b.Title
from
	author a
left join
	authorbook ab on a.AuthorID = ab.author_AuthorID
left join
	book b on ab.book_ISBN = b.ISBN;




-- RIGHT JOIN

-- list of books and their authors, including authors without books.
select
	a.AuthorName,
    b.Title
from
	book b
right join
	authorbook ab on b.ISBN = ab.book_ISBN
right join
	author a on ab.author_AuthorID = a.AuthorID;





use librarymanagement;

-- functions

-- function to add author in author table
select * from author;

delimiter //
create function addAuthor(
	authorName varchar(40),
    biograpgy varchar(100),
    nationality varchar(30),
    dob date
)
returns varchar(1000)
DETERMINISTIC
begin
	DECLARE sqlStatement VARCHAR(1000);
    
    set sqlStatement = concat('insert into author (AuthorName, Biography, Nationality, DateOfBirth) values ( ',
		qoute(authorname), ', ',
        qoute(biograpghy), ', ',
        qoute(nationality), ', ',
        qoute(dob), '); '
    );
    return sqlStatement;
end //
delimiter;

-- Call the function and execute the SQL statement to add a new author
SET @sql = CALL addAuthor('John Doe', 'John Doe is a prolific author.', 'American', '1980-01-15');

-- Execute the generated SQL statement
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

DROP FUNCTION addAuthor;



-- Stored procedure

-- to search books by title, authornamne, genre, ISBN

delimiter //
create procedure searchBooks(
	in searchKeyword varchar(100)
)
begin
	declare searchQuery varchar(150);
    set searchQuery = concat('%', searchKeyword, '%');

		select
			b.ISBN,
			b.Title,
			a.AuthorName,
			g.GenreName,
            b.Language,
            b.Price
            
		from 
			book b
		inner join
			authorbook ab on b.ISBN = ab.book_ISBN
		inner join
			author a on a.AuthorID = ab.author_AuthorID
		inner join 
			bookgenre bg on bg.book_ISBN = b.ISBN
		inner join 
			genre g on g.GenreID = bg.genre_GenreID
		where 
			b.Title LIKE searchQuery
			OR a.AuthorName LIKE searchQuery
			OR g.GenreName LIKE searchQuery
			OR b.ISBN LIKE searchQuery;
end //
delimiter ;

select * from authorbook;
CALL SearchBooks('1984'); -- book title
CALL SearchBooks('Jane'); -- book author name


select * from author;



-- Subqueries

 -- all books published by a specific author.
select Title
from book
where ISBN = (
	select book_ISBN
    FROM authorbook
    WHERE author_AuthorID = (
		select AuthorID 
        from author 
        where AuthorName = 'Harper Lee'
	)
);

