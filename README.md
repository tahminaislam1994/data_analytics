# Data Analytics SQL Project

This repository contains a SQL-based sales analysis project built around a retail dataset. It demonstrates data cleaning, table joining, transformation, and business reporting using PostgreSQL-style SQL queries.

## Project Overview

The project analyzes sales performance using four dataset files:

- `Geo - Geo.csv`
- `People - People.csv`
- `Products - Products.csv`
- `Sales - Sales.csv`

These files are loaded into PostgreSQL tables and joined together to build a master sales dataset for reporting and trend analysis.

## Repository Structure

- `Sales Analysis Project.sql` – Contains the SQL queries used for data transformation and analysis
- `Geo - Geo.csv` – Geographic information
- `People - People.csv` – Salesperson and location details
- `Products - Products.csv` – Product metadata
- `Sales - Sales.csv` – Transaction-level sales records

## Main SQL Tasks Included

The SQL script covers the following:

- Loading and reviewing source tables
- Creating a master sales table using joins
- Calculating `Amount per Box`
- Yearly sales summary
- Monthly sales summary
- Month and region-wise sales report
- Top salespeople by sales volume

## Example Data Model

The analysis combines records from the following tables:

- `Geo`
- `People`
- `Products`
- `Sales`

The script creates a `Master_Table` using a `WITH` CTE and joins the dimension tables to the sales fact table.

## Business Questions Answered

This SQL project helps answer questions such as:

- What is the overall sales trend over time?
- Which months perform best?
- Which regions generate the most revenue?
- Who are the top-performing salespeople?
- How much revenue is generated per box sold?

## How to Use This Project

1. Import the CSV files into PostgreSQL.
2. Create the corresponding tables in the `public` schema.
3. Run the SQL script in `Sales Analysis Project.sql`.
4. Review the output of each query to explore the sales insights.

## Notes

- The script uses PostgreSQL functions such as `ROUND`, `NULLIF`, `EXTRACT`, and `TO_CHAR`.
- A synthetic `Order_Id` is created because the original sales table does not include a primary key.
- The project is designed for learning and experimentation with SQL-based analytics workflows.

## License

This project is for personal data analytics practice and portfolio use.

## Author

Created as part of a personal data analytics and SQL learning repository.
