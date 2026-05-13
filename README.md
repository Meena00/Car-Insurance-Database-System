# Car Insurance Database System

A relational database system designed to manage customer insurance information, policies, premium payments, and accident reports. This project demonstrates database schema design, relationship modeling, and SQL implementation for an insurance management environment.

## Overview

This project was built to organize and manage car insurance records using a normalized relational database structure. The system stores customer information, insurance policies, payment records, and accident participation data while maintaining data integrity through primary and foreign key constraints.

The database supports structured data storage and retrieval for common insurance-related operations and reporting scenarios.

## Features

- Stores customer and vehicle information
- Manages insurance policy records
- Tracks premium payment history and due dates
- Records accident reports and participation details
- Implements relational database constraints to maintain data integrity
- Supports SQL-based reporting and analytics queries

## Database Schema

The database contains the following tables:

- `customer` — stores customer and vehicle information
- `policy` — stores insurance policy records
- `covers` — links customers to insurance policies
- `premium_payment` — tracks payment history and billing information
- `accidents` — stores accident report information
- `participated` — records customer involvement in accidents

## Technologies Used

- SQL
- MySQL

## SQL Concepts Demonstrated

- Table creation using `CREATE TABLE`
- Primary and foreign key constraints
- Relational schema design
- Many-to-many relationship implementation
- Data integrity enforcement
- Structured querying for insurance data management

## Example Use Cases

The database can support queries such as:

- Retrieving customer insurance policy information
- Tracking overdue premium payments
- Identifying customers involved in accidents
- Connecting accident reports with participating customers
- Managing policy coverage relationships

## Author

Meena Anwar

## License

This project is intended for educational and portfolio purposes.
