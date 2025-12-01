--liquibase formatted sql

--changeset asmith:1
create table sales (
    id int,
    first_name varchar (50),
    last_name varchar (50)
);
-- rollback drop table sales
