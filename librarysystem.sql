create database librarysystem;
use librarysystem;

drop database librarysystem;

select * from author;

use librarysystem;

ALTER TABLE book
ADD CONSTRAINT catalogid
FOREIGN KEY (catalogid)
REFERENCES catalog(catalogid);


ALTER TABLE book
drop
column catalog_catalogid;

select * from book;

ALTER TABLE book
DROP FOREIGN KEY FKfsperwqw436p247ee8oevj4w;

ALTER TABLE book
DROP COLUMN catalog_catalogid;


CREATE TABLE new_catalog (
    catalogid INT AUTO_INCREMENT PRIMARY KEY,
    catalog_name VARCHAR(45)
);

drop table new_catalog;

INSERT INTO new_catalog (catalog_name)
SELECT catalog_name
FROM catalog;

RENAME TABLE catalog TO catalog_old;

RENAME TABLE new_catalog TO catalog;

select * from catalog;

insert into catalog (catalogid, catalog_name)
values 
(7, "Super Hero"),
(8, "Cop"),
(9, "Reality");

drop table catalog_old;

select * from book;
