🦠 COVID-19 Data Analysis Using SQLite
📌 Overview

This project demonstrates how to analyze COVID-19 data using SQLite and DB Browser for SQLite.
It includes database creation, sample dataset insertion, SQL analysis queries, and a summary view.
The goal is to practice SQL skills such as joins, grouping, window logic, and data aggregation.

📖 Project Description

The database contains two tables:

country → Stores country details like name, continent, and population

cases → Stores daily COVID-19 case statistics for each country

Using SQL, the project analyzes trends such as:

Total and new cases

Daily and monthly summaries

Highest spike days

7-day moving average

Cases per million population

Country-wise comparisons

🧰 Tools & Technologies

SQLite

DB Browser for SQLite

SQL Query Language

Sample COVID-19 dataset (manually inserted)

🗂️ Database Schema
1. country table
Field	Type	Description
country_id	INTEGER	Primary key
country	TEXT	Country name
continent	TEXT	Continent
population	INTEGER	Total population
2. cases table
Field	Type	Description
case_id	INTEGER	Primary key
country_id	INTEGER	Foreign key
date	TEXT	Date
total_cases	INTEGER	Total cases till that date
new_cases	INTEGER	New cases that day
total_deaths	INTEGER	Total deaths till that date
new_deaths	INTEGER	New deaths that day
📥 How to Run the Project

Install DB Browser for SQLite

Create a new SQLite database

Run the provided SQL scripts to:

Create tables

Insert sample data

Execute analysis queries

View query results in the application

📊 Key SQL Queries Included

✔ Latest total cases by country
✔ Daily new cases trend
✔ 7-day moving average
✔ Highest spike day
✔ Monthly summary of cases & deaths
✔ Cases per million population
✔ Summary view creation
✔ Aggregation and grouping queries

📈 Sample Insights Generated

India shows a rising trend from March 1–4, 2020

USA has higher case counts during the same period

7-day moving average helps measure infection trend

Cases per million shows the normalized spread

🧾 Summary View

A reusable SQL view country_summary is included to quickly get:

Country

Continent

Population

Latest total cases

Latest total deaths

📌 Project Purpose

This project is ideal for:

SQL beginners

Data analysis practice

Portfolio projects


📚 Conclusion

The COVID-19 SQLite Analytics Project demonstrates how SQL can be used to perform real-world data analysis.
It covers essential SQL operations like joins, grouping, windows, aggregation, and reporting.
This project can be extended easily by adding more datasets, visualizations, or dashboards.
