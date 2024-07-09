# Parking Management and Ticketing System

## Overview

This project involves creating a comprehensive database and web application to manage car parking lots for a hypothetical large company. It covers the management of parking lots, blocks, stalls, customer passes, daily parking, tickets, and receipts. The system delivers a robust solution utilizing MySQL, PHP, WAMP Server, and a modern web interface, ensuring efficient and effective management of parking operations.

## Technology Stack

- **Database:** MySQL
- **Server-Side Scripting:** PHP
- **Frontend:** Web application (HTML, CSS, JavaScript)
- **Tools:** WAMP Server (Windows, Apache, MySQL, PHP)

## Database Details

### Database Schema

The database schema is designed using MySQL and includes tables for the following entities:

1. **Parking Lot**
   - Identified by a unique ID
   - Can have one or more blocks/parking grounds

2. **Block**
   - Identified by a block code
   - Contains many parking stalls

3. **Stall**
   - Identified by a number
   - Size (small cars/large cars)
   - Type (for handicaps, for bicycles, reserved for police, etc.)

4. **Customer**
   - Can have weekly, monthly, or yearly passes (regular passes)
   - For daily parking, vehicle’s license plate number and duration of parking are required

5. **Pass**
   - Total cost
   - Duration of the pass

6. **Receipt**
   - Shows cost, duration, and license plate of the parked vehicle for daily customers

7. **Ticket**
   - Issued if a car is parked in a stall without a valid pass
   - Includes date, time, car info, stall number, fine amount, and employee ID of the issuer

## Relationships and Cardinality

- **Parking Lot** to **Block**: One-to-Many
- **Block** to **Stall**: One-to-Many
- **Customer** to **Pass**: Many-to-Many
- **Customer** to **Receipt**: One-to-Many (partial participation)
- **Car** to **Ticket**: One-to-Many
- **Pass** to **Customer**: Many-to-Many
- **Receipt** to **Customer**: Many-to-One

### Participation Assumptions

- Every parking lot must have at least one block.
- Every block must belong to a parking lot.
- Every block must have at least one stall.
- Every stall must belong to a block.
- Passes can be assigned to multiple customers.
- Each ticket is specific to one car.
- A car can have multiple tickets issued.
- Customers can receive multiple receipts but not all customers will have receipts.
- Receipts are linked to one customer.
- Customers can have multiple passes but not all customers will have passes.

## SQL Scripts

The SQL scripts for creating the tables and performing various operations are included in the project files. These scripts cover:

- Database creation
- Table creation
- Inserting sample data
- Deleting records
- Querying data
- Creating views
- Updating records

For more details, refer to the `MySQL Scripts` folder included in this project.

## PHP Scripts

PHP scripts are used to interact with the MySQL database and perform various operations, such as:

- Connecting to the database
- Creating tables
- Inserting data
- Updating and deleting records
- Querying data

These scripts enable seamless interaction with the database and ensure efficient data management.

## Web Application

A web application was created to provide a user-friendly interface for interacting with the database. The web application allows users to:

- Add new parking lots, blocks, stalls, customers, passes, and receipts
- Update and delete records
- Query data
- Generate reports

The web application is built using HTML, CSS, and JavaScript, ensuring a responsive and intuitive user experience.

## Using WAMP Server

WAMP Server is used to host the MySQL database and PHP scripts locally. It provides an all-in-one solution for setting up the necessary server environment on a Windows machine, which includes:

- **Apache:** The web server
- **MySQL:** The database management system
- **PHP:** The server-side scripting language

To get started with WAMP Server:

1. Download and install WAMP Server from [WAMP Server's official website](http://www.wampserver.com/).
2. Place the `CustomerVehicleDB` folder (which contains alll PHP scripts) in the `www` directory of your WAMP installation.
3. Start the WAMP Server and type `localhost/CustomerVehicleDB` the browser to access the web application.

## Contributers
This project was made by Saif Ali, and Karen Yao.

Personal Github links:

Saif: https://github.com/safesaif21

Karen: https://github.com/karyao


