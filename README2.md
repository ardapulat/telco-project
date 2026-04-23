# Telecom Database Project

## Introduction
This project focuses on building a telecom database using Oracle XE. The goal was to analyze customer data, tariff usage, and payment behavior using SQL queries.

## Environment
The database environment was set up using Docker, and DBeaver was used as the database client for managing and querying data.

## Project Structure
- TABLE_CREATION_SCRIPTS.sql → database tables creation  
- SOLUTIONS.sql → SQL queries  
- New_user.sql → new database user creation  
- docker-compose.yml → Oracle XE container setup  

## Technologies
- Oracle XE → relational database  
- Docker & Docker Compose → environment setup  
- SQL → data querying and analysis  
- DBeaver → database management tool  

## Database Design
The database consists of three main tables: TARIFFS (tariff data), CUSTOMERS (customer data), and MONTHLY_STATS (monthly usage and payment statistics). Tables were created in a logical order: first TARIFFS, then CUSTOMERS with a foreign key referencing TARIFFS, and finally MONTHLY_STATS with a foreign key referencing CUSTOMERS. This structure ensures correct relationships and data consistency.

## Data Import
Data was imported using DBeaver. During this process, special attention was given to data types, date formats, and handling null values.

## SQL Queries
This project includes multiple SQL queries for data analysis such as filtering customers by tariffs, finding newest and oldest customers, analyzing tariff distribution using GROUP BY, detecting missing records, comparing usage with tariff limits, identifying high-usage customers, and analyzing unpaid or delayed payments. Various SQL techniques were used including JOIN, GROUP BY, ORDER BY, subqueries, and conditional expressions.

## How to Run
Start the database:
docker compose up -d

Connect via DBeaver:
Host: localhost  
Port: 1521  
Username: system  
Password: your password  

Steps:
1. Run New_user.sql  
2. Run TABLE_CREATION_SCRIPTS.sql  
3. Import CSV files  
4. Run SOLUTIONS.sql  

## Why I Built This
This project was built to understand how telecom companies manage customer data, tariffs, and usage statistics. It also helped me gain hands-on experience in database design and SQL-based data analysis.

## What I Learned
I learned how to design relational databases using primary and foreign keys, write efficient SQL queries with JOIN, GROUP BY, and subqueries, understand data relationships and consistency, use Docker to deploy and manage a database environment, and import and handle real-world data from CSV files.

## Challenges
During the project, I faced challenges such as handling incorrect date formats and missing values during data import, designing correct relationships between tables, debugging SQL errors, and improving query logic to match real-world scenarios.

## Future Improvements
In the future, I plan to add more advanced queries for deeper data analysis, create a simple frontend interface, and expand the dataset for more realistic scenarios.

## Conclusion
This project provided practical experience in database design and SQL. It helped me understand how data can be structured, analyzed, and used in real-world systems.
