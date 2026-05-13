# Author: Meena Anwar
# Database Schema Implementation 
CREATE SCHEMA IF NOT EXISTS CarInsuranceDB;

USE CarInsuranceDB;

CREATE TABLE IF NOT EXISTS customer (
    customer_id INT,
    name VARCHAR(50),
    address VARCHAR(100),
    license_no VARCHAR(20),
    model VARCHAR(30),
    PRIMARY KEY (customer_id));
CREATE TABLE IF NOT EXISTS policy (
    policy_id INT,
    PRIMARY KEY (policy_id)
);
CREATE TABLE IF NOT EXISTS covers (
    customer_id INT,
    policy_id INT,
    PRIMARY KEY (customer_id, policy_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (policy_id)
        REFERENCES policy (policy_id)
);
CREATE TABLE IF NOT EXISTS premium_payment (
    policy_id INT,
    payment_no INT,
    due_date DATE,
    amount DECIMAL(10,2),
    received_on DATE,
    PRIMARY KEY (policy_id, payment_no),
    FOREIGN KEY (policy_id)
        REFERENCES policy (policy_id)
);
CREATE TABLE IF NOT EXISTS accidents (
    report_id INT,
    date DATE,
    place VARCHAR(50),
    PRIMARY KEY (report_id)
);
CREATE TABLE IF NOT EXISTS participated (
    customer_id INT,
    report_id INT,
    PRIMARY KEY (customer_id, report_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (report_id)
        REFERENCES accidents (report_id)
);