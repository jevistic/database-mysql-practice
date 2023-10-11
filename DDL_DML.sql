create database lmsdb;
use lmsdb;
SET SQL_SAFE_UPDATES = 0;
create table book (
	isbn int primary key,
    title varchar(50),
    publicationDate date,
    genre varchar(30),
    language varchar(30),
    numOfPages int,
    price float4    
)

-- select statement
select * from book;
-- drop table
drop table book;

-- insert into 
insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) values(
1001, "To Kill a Mockingbird", TIMESTAMP('1960-07-11'), "Fiction", "English", 281 ,10.99
);

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) values(
1002, "The Great Gatsby", TIMESTAMP('1925-04-10'), "Classics", "English", 180, 8.95
);

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) values(
1003, "The Catcher in the Rye", TIMESTAMP('1951-07-16'), "Coming of Age", "English", 224, 9.75
);

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) values(
1004, "Pride and Prejudice", TIMESTAMP('1813-01-28'), "Romance", "English", 279, 11.25
);

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) select 1005, "1984", TIMESTAMP('1949-06-08'), "Dystopian", "English", 328, 12.50;

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) select 1006, "dummy", TIMESTAMP('1949-06-08'), "dummy", "dummy", 328, 12.50;

insert into book (
isbn, title, publicationDate, genre, language, numOfPages, price
) select 1007, "dummy", TIMESTAMP('1949-06-08'), "dummy", "dummy", 328, 12.50;


-- select statement
select * from book;
select title, genre, price from book;
select * from book where price > 10;
select * from book where genre IN ("romance", "classics");
select * from book where numOfPages BETWEEN 200 AND 250;
select * from book where price > 10 OR numOfPages > 200;
select * from book where price > 10 AND numOfPages > 200;
select numOfPages as "Total Pages" from book;
select title, numOfPages as "total pages" from book where genre LIKE "%ance";
select title, numOfPages as "total pages" from book where genre = "Romance";
select title, numOfPages as "total pages" from book where genre NOT LIKE "%ance";

-- DISTINCT
select distinct language from book;
select count(distinct language) as "total languages" from book;

-- Order By
select * from book order by publicationDate DESC, isbn ASC;   -- it orders by pub date and it pub date is same for some rows than it orders by isbn in asc

-- limit
select * from book where language like "english" limit 3;

-- min
select min(price) as cheapest from book;

-- max
select max(price) from book;

-- update statement   -it uses primary key in where clause
update book set title="Pirates of Caribean", genre="Fiction" where isbn = 1006;
update book set language = "Hindi" where title like "Pirates of caribean";   -- error
update book set language = "English" where isbn = 1006;





-- alter statement
alter table book add availability boolean;

alter table book drop availability;

alter table book add availability boolean default true;

alter table book modify column availability boolean;


-- delete row
delete from book where isbn = 1006;
-- delete from book;  -deletes whole table



