# restaurant_business_intelligence

As part of the Business Intelligence team for a multi-location restaurant brand, this project focuses on building a performance dashboard to provide insights into operational areas: Orders, Inventory, and Staff Management. Our goal is to support leadership with data-driven decision-making on product costs, staff efficiency, and sales performance.

This analysis combines SQL-based data extraction and transformation with Power BI visual storytelling to monitor performance, detect inefficiencies, and identify cost-saving opportunities.

## Projcet Objectives

- Track order performance: Volume, revenue, order value, and product trends.
- Analyze ingredient usage and costs: Identify high-cost items, quantity ordered, and potencial savings.
- Evaluate staff cost and hours: Understand staffing levels, work shifts, and payroll implications.
- Build an interactive dashboard: Enable dynamic exploration by filters.

## Project Breakdown

We were provided with 10 datasets with all the information to be able to break it down and analyze. Some of them were connected in order to know anything related to orders, ingredients and inventory, and information about the team and their shifts. They were connected through some primary keys from each table as shown in this **ERD (Entity Relationship Diagram)**:

![ERD](https://github.com/user-attachments/assets/374362e4-faf3-4704-8313-1b08d5942899)

- Orders: For the order details, we joined tables with the tool MySQL to connect **quantities, item names, delivery mode**, and with this information we used some functions such as the **Total Sales and the Average Order Value**.
- Inventory: The ingredients and recipe tables were donnected to calculate the **ingredient cost per item** and identify **top performers**.
- Staff: Calculated the **Total hours worked per employee** based on their **shifts and the start/end** time and obtained the **Total staff costs** using the **hourly rate**.
