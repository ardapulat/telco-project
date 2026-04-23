# Telecom Database Project

## Introduction

For this project, I developed a basic telecom database via Oracle XE.

The project consists of the development of SQL queries, table creation, and the preparation of an environment with Docker.

The objective was to work with the data analysis of customers' consumption habits and payments, as well as analyze tariff distribution.

## Project Structure

- TABLE_CREATION_SCRIPTS.sql → table creation

- SOLUTIONS.sql → queries for the dataset

- New_user.sql → new DB user creation

- docker-compose.yml → Oracle XE container run

## Technologies

- Oracle XE

- Docker & Docker Compose

- SQL

- DBeaver

## SQL Queries

This project consists of 11 SQL queries that help to analyze the dataset.

Among them – customers' selection based on different criteria, selection of the most recent and oldest data, tariff distribution check, null values detection, comparison between consumption and tariff limit, payments' analysis, etc.

## How to Run

1. Run docker compose file:

docker compose up -d

2. Create the connection in DBeaver:

Host: localhost

Port: 1521

Username: system

Password: your password

3. Run New_user.sql

4. Run TABLE_CREATION_SCRIPTS.sql

5. Load CSV files to tables

6. Run SOLUTIONS.sql

7. Stop docker compose container (if needed):

docker compose down
