# Telecom Database Project

 This project is about creating a database for a telecom company using Oracle XE. The main goal of this project is to look at customer information how tariffs are used and how payments are made by using SQL queries.

## Environment

To set up the database I used Docker and DBeaver as the database client to manage and query the data.

## Project Structure

- TABLE_CREATION_SCRIPTS.sql is used to create the database tables

- SOLUTIONS.sql has all the SQL queries

- New_user.sql is used to create a database user

- docker-compose.yml is used to set up the Oracle XE container

## Technologies

- Oracle XE is the relational database

- Docker and Docker Compose are used to set up the environment

- SQL is used to query and analyze the data

- DBeaver is the tool used to manage the database

## Database Design

The database has three main tables: TARIFFS has information about the tariffs CUSTOMERS has information about the customers and MONTHLY_STATS has information about the monthly usage and payment statistics. I created the tables in an order: first TARIFFS, then CUSTOMERS with a reference to TARIFFS and finally MONTHLY_STATS with a reference to CUSTOMERS. This way the relationships between the data are correct and consistent.

## Data Import

I imported the data using DBeaver. I made sure to pay attention to the types of data the formats of the dates and how to handle missing values.

## SQL Queries

This project includes SQL queries to analyze the data, such as finding customers by tariff finding the newest and oldest customers looking at how tariffs are distributed finding missing records comparing usage to tariff limits finding customers who use a lot and looking at unpaid or delayed payments. I used SQL techniques, including JOIN, GROUP BY ORDER BY, subqueries and conditional expressions.

## How to Run

To start the database you need to run this command:

docker compose up -d

Then you can connect to the database using DBeaver with these details:

Host: localhost

Port: 1521

Username: system

Password: your password

Here are the steps to follow:

1. Run New_user.sql

2. Run TABLE_CREATION_SCRIPTS.sql

3. Import the CSV files

4. Run SOLUTIONS.sql

## Why I Built This

I built this project to understand how telecom companies manage their customer data, tariffs and usage statistics. It also helped me get hands-on experience in designing databases and analyzing data with SQL.

## What I Learned

I learned how to design databases using primary and foreign keys how to write efficient SQL queries with JOIN, GROUP BY and subqueries how to understand the relationships between data and keep it consistent how to use Docker to deploy and manage a database environment and how to import and handle real-world data from CSV files.

## Challenges

During the project I faced challenges, such as handling incorrect date formats and missing values when importing data designing the correct relationships between the tables fixing SQL errors and making the query logic match real-world situations.

## Future Improvements

In the future I plan to add advanced queries to analyze the data deeper create a simple interface for users and expand the dataset to make it more realistic.

 This project gave me experience in designing databases and using SQL. It helped me understand how data can be structured, analyzed and used in real-world systems like the Telecom Database Project. The Telecom Database Project was a way for me to learn about database design and SQL and I am happy, with what I achieved with the Telecom Database Project.
