# restaurant_business_intelligence

As part of the Business Intelligence team for a multi-location restaurant brand, this project focuses on building a performance dashboard to provide insights into operational areas: Orders, Inventory, and Staff Management. Our goal is to support leadership with data-driven decision-making on product costs, staff efficiency, and sales performance.

This analysis combines SQL-based data extraction and transformation with Power BI visual storytelling to monitor performance, detect inefficiencies, and identify cost-saving opportunities.

## Projcet Objectives

- Track order performance: Volume, revenue, order value, and product trends.
- Analyze ingredient usage and costs: Identify high-cost items, quantity ordered, and potencial savings.
- Evaluate staff cost and hours: Understand staffing levels, work shifts, and payroll implications.
- Build an interactive dashboard: Enable dynamic exploration by filters.

## Executive Summary
- **Orders**
  
  - Total Sales **$48,740** from **1,000 orders** and **5,012 items**.
  - The Average order values is **$48.74**.
  - The best-selling items are **Pizza Diavola Regular** and **Pizza Hawaiian Large**.
  - 60.5% of orders were **delivery**.
  
- **Inventory**
  
  - Over **43,000** units of ingredients used in January.
  - Top-cost ingredients were **Bread** and **Pizza Base**.
  - Total inventory cost for the month: **$2.62M**.
    
- **Staff**:

  - 992 Total hours worked.
  - Total Staff cost is **$16,802**.
  - Top contributors in hours and cost are **Arran Hodgson, Faraz Peck, Seren Lindsey**.
    

## Project Breakdown

We were provided with 10 datasets with all the information to be able to break it down and analyze. Some of them were connected in order to know anything related to orders, ingredients and inventory, and information about the team and their shifts. They were connected through some primary keys from each table as shown in this **ERD (Entity Relationship Diagram)**:

![ERD](https://github.com/user-attachments/assets/374362e4-faf3-4704-8313-1b08d5942899)

- **Orders**: For the order details, we joined tables with the tool MySQL to connect **quantities, item names, delivery mode**, and with this information we used some functions such as the **Total Sales and the Average Order Value**.
- **Inventory**: The ingredients and recipe tables were donnected to calculate the **ingredient cost per item** and identify **top performers**.
- **Staff**: Calculated the **Total hours worked per employee** based on their **shifts and the start/end** time and obtained the **Total staff costs** using the **hourly rate**.

## SQL Data Cleaning and Transformation (ETL)

To analyze the data, SQL queries were structured in modular CTEs, Joins, Group By, Round, and others to obtain basic information like:

**1. Ingredient Aggregation**: Aggregations were created to calculate the **Total ordered quantity** per ingredient, the **Total cost per ingredient**, and the **Remaining weight** for inventory monitoring.
**2. Recipe Cost Calculation**: Common Table Expressions (CTE) were built to calculte some functions like: **Unit cost** and **Ingredient cost**.
**3. Order Analysis**: Using joins between Orders and Items to obtain the **Total Sales**, **Average Order Value** and the **Category breakdown**.
**4. Staff Shift Calculation**: To obtain the **Hours worked** and the **Staff Cost**.

The detailed SQL query was created as follows:
![1](https://github.com/user-attachments/assets/aa9059a8-07e4-420f-b6c7-617248c2f122)
![2](https://github.com/user-attachments/assets/576c57ef-b591-415c-8928-c77a7a3cbfdc)
![3](https://github.com/user-attachments/assets/de6d5389-567b-4c96-ad3f-c569edb3a51f)
![4](https://github.com/user-attachments/assets/042ab6aa-6cde-4888-b8a7-849b957767b1)
![5](https://github.com/user-attachments/assets/2c544ab9-b341-4eea-af10-c0ddf91783f9)

## Dashboard





## Conclusions





## Recommendations






