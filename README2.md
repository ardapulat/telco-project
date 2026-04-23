# Telecom Database Project

## Introduction

This project focuses on building a telecom database using Oracle XE.  
The system was designed to analyze customer data, tariff usage, and payment behavior using SQL queries.

The database environment was deployed using Docker, and DBeaver was used as the database client for managing and querying data.

---

## Project Structure

- TABLE_CREATION_SCRIPTS.sql → creates database tables  
- SOLUTIONS.sql → contains all SQL queries  
- New_user.sql → creates database user  
- docker-compose.yml → runs Oracle XE container  

---

## Technologies

- Oracle XE → relational database  
- Docker & Docker Compose → environment setup  
- SQL → data querying and analysis  
- DBeaver → database management tool  

---

## Database Design

The database consists of three main tables:

- TARIFFS → stores tariff details  
- CUSTOMERS → stores customer information  
- MONTHLY_STATS → stores monthly usage and payment data  

Tables were created in a logical order:

1. TARIFFS  
2. CUSTOMERS (linked to TARIFFS via foreign key)  
3. MONTHLY_STATS (linked to CUSTOMERS via foreign key)  

This structure ensures proper relationships and data consistency.

---

## Data Import

Data was imported from CSV files using DBeaver.  
During this process, special attention was given to data types, date formats, and handling missing values to ensure consistency.

---

## SQL Queries

This project includes multiple SQL queries for analyzing the dataset:

- Filtering customers based on tariffs  
- Finding newest and oldest customers  
- Analyzing tariff distribution using GROUP BY  
- Detecting missing records  
- Comparing usage with tariff limits  
- Identifying high usage customers  
- Analyzing unpaid and late payments  

Various SQL techniques were used, including JOIN, GROUP BY, ORDER BY, subqueries, and conditional logic.

---

## How to Run

1. Start the database:
-docker compose up -d
3. Connect via DBeaver:
- Host: localhost  
- Port: 1521  
- Username: system  
- Password: your password  

3. Run:
- New_user.sql  
- TABLE_CREATION_SCRIPTS.sql  
- Import CSV files  
- SOLUTIONS.sql  

---

## Why I Built This

This project was built to understand how telecom companies manage customer data, tariffs, and usage statistics.  
It also helped me gain hands-on experience in database design and SQL-based data analysis.

---

## What I Learned

- Designing relational databases using primary and foreign keys  
- Writing efficient SQL queries using JOIN, GROUP BY, and subqueries  
- Understanding data relationships and consistency  
- Using Docker to deploy and manage a database environment  
- Working with real-world data and handling import issues  

---

## Challenges

- Handling data import issues such as incorrect date formats and missing values  
- Designing correct table relationships  
- Debugging SQL errors and improving query logic  
- Writing queries that reflect real-world scenarios  

---

## Future Improvements

- Adding more advanced queries for deeper analysis  
- Creating a simple frontend interface  
- Expanding the dataset for more realistic results  

---

## Conclusion

This project provided practical experience in database design and SQL.  
It helped me understand how data can be structured, analyzed, and used in real-world systems.
