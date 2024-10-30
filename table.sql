create table user(
    id int primary key AUTO_INCREMENT,
    name varchar(250),
    contactNumber varchar(20),
    email varchar(50),
    password varchar(250),
    status varchar(20),
    role varchar(20),
    UNIQUE (email)
);

insert into user(name,contactNumber,email,password,status,role) values('Admin','1231231231','admin@gmail.com','admin','true','admion');

create table category(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    primary key(id)
);

create table product (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    categoryId integer NOT NULL,
    description varchar(255),
    price integer,
    status varchar(20),
    primary key(id)
);

create table bill (
     id int NOT NULL AUTO_INCREMENT,
     uuid varchar(255) NOT NULL,
     name varchar(255) NOT NULL,
     email varchar(255) NOT NULL,
     contactNumber varchar(255) NOT NULL,
     paymentMethod varchar(255) NOT NULL,
     total int NOT NULL,
     productDetails JSON DEFAULT NULL,
     createdBy varchar(255) NOT NULL,
     primary key (id)
);