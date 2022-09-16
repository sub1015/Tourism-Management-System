drop database tourism;
create database tourism;

\c tourism

CREATE TABLE destination
(
    dest_id VARCHAR(15) NOT NULL,
    place char(30),
    country char(15),
    PRIMARY KEY(dest_id)
);

CREATE TABLE agency
(
    agency_id VARCHAR(15) NOT NULL,
    agency_name CHAR(30),
    PRIMARY KEY(agency_id)
);

CREATE TABLE customer
(
    customer_id VARCHAR(15) NOT NULL,
    customer_name CHAR(15) NOT NULL,
    customer_email VARCHAR(40),
    dest_id VARCHAR(15),
    agency_id VARCHAR(15),
    PRIMARY KEY(customer_id),
    FOREIGN KEY(dest_id) REFERENCES destination(dest_id),
    FOREIGN KEY(agency_id) REFERENCES agency(agency_id)
);



CREATE TABLE agent
(
        agent_id VARCHAR(15) NOT NULL,
        agent_name CHAR(15) ,
        availibility CHAR(15) DEFAULT 'yes',
        PRIMARY KEY(agent_id)
);

CREATE TABLE transportation
(
    vehicle_id VARCHAR(15) NOT NULL,
    rate DECIMAL(10,2) default 2500,
    vehicle_type char(15) default 'car',
    PRIMARY KEY(vehicle_id)
);



CREATE TABLE hotels
(
    hotel_id VARCHAR(15) NOT NULL,
    hotel_name CHAR(20) NOT NULL,
    hotel_stars INT,
    hotel_rent DECIMAL(10,2) check(hotel_rent>0),
    dest_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(hotel_id),
    FOREIGN KEY(dest_id) REFERENCES destination(dest_id)
);

CREATE TABLE payment
(
    payment_id VARCHAR(15) NOT NULL,
    payment_date DATE,
    amount DECIMAL(10,2),
    customer_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(payment_id,customer_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)

);

CREATE TABLE staff
(
    staff_id VARCHAR(15) NOT NULL,
    username VARCHAR(15),
    staff_email VARCHAR(40),
    staff_password VARCHAR(15),
    PRIMARY KEY(staff_id)
);

CREATE TABLE feedback
(
    feedback_no VARCHAR(15) NOT NULL,
    rating INT check(rating<6 and rating>0),
    customer_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(feedback_no,customer_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE adverstisement
(
    ad_id VARCHAR(15) NOT NULL,
    agency_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(ad_id,agency_id),
    FOREIGN KEY(agency_id) REFERENCES agency(agency_id)
);

CREATE TABLE agency_staff
(
    agency_id VARCHAR(15) NOT NULL,
    staff_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(agency_id,staff_id),
    FOREIGN KEY(agency_id) REFERENCES agency(agency_id),
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)

);

CREATE TABLE agency_agent
(
    agency_id VARCHAR(15) NOT NULL,
    agent_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(agency_id,agent_id),
    FOREIGN KEY(agency_id) REFERENCES agency(agency_id),
    FOREIGN KEY(agent_id) REFERENCES agent(agent_id)
    
);

CREATE TABLE agent_contact
(
    contact_no  VARCHAR(15),
    agent_id VARCHAR(15) NOT NULL,
    PRIMARY KEY(agent_id),
    FOREIGN KEY(agent_id) REFERENCES agent(agent_id)
);

CREATE TABLE customer_contact
(
    contact_no  VARCHAR(15),
    customer_id VARCHAR(15),
    PRIMARY KEY(customer_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE agent_transport
(
    agent_id VARCHAR(15),
    vehicle_id VARCHAR(15),
    PRIMARY KEY(agent_id,vehicle_id),
    FOREIGN KEY(agent_id) REFERENCES agent(agent_id),
    FOREIGN KEY(vehicle_id) REFERENCES transportation(vehicle_id)

);




