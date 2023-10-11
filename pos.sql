create database if not exists pos;
use pos;

create table if not exists customer(
	customer_id int auto_increment primary key,
    customer_name varchar(40),
    customer_contact varchar(15)
);

create table if not exists cart(
	cart_id int auto_increment primary key,
    creation_date date,
    status varchar(20),
    customer_id int,
    foreign key(customer_id) references customer(customer_id)
);

create table if not exists category(
	category_id int auto_increment primary key,
    category_name varchar(40),
    category_description varchar(100)
);

create table if not exists employee(
	employee_id int auto_increment primary key,
    employee_name varchar(40),
    employee_contact varchar(150),
    employee_gender varchar(10),
    employee_role varchar(20)
);

create table if not exists orders(
	order_id int auto_increment primary key,
    order_date date,
    order_status varchar(20),
    order_amount int,
    customer_id int,
    employee_id int,
    foreign key(customer_id) references customer(customer_id),
    foreign key(employee_id) references employee(employee_id)
);

create table if not exists product(
	product_id int auto_increment primary key,
    product_name varchar(40),
    product_description varchar(100),
    product_price int,
    stock_quantity int,
    barcode int,
    category_id int,
    cart_id int,
    foreign key(category_id) references category(category_id),
    foreign key(cart_id) references cart(cart_id)
);

