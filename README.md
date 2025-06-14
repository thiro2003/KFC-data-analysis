#  KFC Retail Data Analysis Using SQL

##  Project Overview

This project involves a comprehensive analysis of a KFC retail dataset using SQL. The goal is to extract business insights related to **sales**, **profitability**, **shipping**, **discount effectiveness**, and **product performance** across various dimensions such as location, product type, customer segment, and freight mode.

## 🛠 Tools Used

- **MySQL**
- **SQL Joins, CTEs, Aggregations, Window Functions**
- **Data Cleaning using SQL**
- **Business Intelligence (BI) concepts**

##  Dataset Description

The dataset includes transactional-level data with the following key fields:

- `Order_Priority` – Order urgency
- `Discount_Offered`, `Unit_Price`, `Freight_Expenses`
- `Freight_Mode`, `Segment`, `Product_Type`, `Product_Sub_Category`
- `Product_Container`, `State`, `City`, `Region`, `Country`
- `Order_Date`, `Ship_Date`, `Profit`, `QtyOrdered`, `Sales`

The raw data was cleaned and transformed before inserting it into a table named `retail`.

##  Key Business Questions & Insights

###  Sales & Profitability
- **Top States & Cities by Sales and Profit**
- **Average Profit Margin by Product Type/Sub-Category**
- **Impact of Order Priority on Profit Margins**

###  Discount Impact
- **Correlation between Discount Offered and Profit**
- **Discount Ranges that Drive Sales**

###  Shipping & Operations
- **Lowest Average Freight Expense per Unit Sold by Freight Mode**
- **Average Delivery Time by Region**

###  Product Analytics
- **Most Popular Product Sub-Categories**
- **Profitability by Product Container Type**

###  Segment Insights
- **Top Performing Customer Segments by Revenue**

##  Data Cleaning & Transformation Steps

1. **Converted date formats** from string to `DATE` type using `STR_TO_DATE()`
2. **Created a new clean table** called `retail`
3. **Handled division by zero** using `NULLIF()` in margin calculations
4. **Added derived columns** like `discount_per_unit`

##  Sample Insights

- **City with highest profit:** _[Result based on your data]_
- **Segment with highest revenue:** _[Result based on your data]_
- **Strong negative correlation between discounts and profit:** `-0.73` (example)

##  File Structure

- `KFC Data Analysis.sql`: Contains all SQL queries from cleaning to analysis.

##  Learnings

- Practice with real-world BI questions
- Mastery of SQL transformations and aggregations
- Deep understanding of retail KPIs and how to derive them

##  How to Run

1. Create a MySQL database and import the dataset.
2. Run the `KFC Data Analysis.sql` script step-by-step.
3. Modify queries for specific explorations or visualizations.

##  Author

**Rohit Sul**  
Data Analyst Aspirant_

---

