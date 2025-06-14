create database retail;
use retail;
select * from data;
-- DATA CLEANING AND TRANSFORMATIONS
-- Checking Datatypes of each column and name of columns
desc data; 
-- creating new table data analysis
create table retail (
    Order_Priority text,
    Discount_Offered double,
    Unit_Price double,
    Freight_Expenses double,
    Freight_Mode text,
    Segment text,
    Product_Type text,
    Product_Sub_Category text,
    Product_Container text,
    State text,
    City text,
    Region text,
    Country text,
    Order_Date date,
    Ship_Date date,
    Profit double,
    QtyOrdered int,
    Sales double
);
select * from data;

update data set `Ship Date`=STR_TO_DATE(`Ship Date`, '%d-%m-%Y');
update data set `Order Date`=STR_TO_DATE(`Order Date`, '%d-%m-%Y');
set SQL_SAFE_UPDATES=0;

insert into retail select * from data;
select * from retail;


--  DATA ANALYSIS AND SOLVING BUSINESS PROBLEMS

-- 📌 Sales & Profitability
-- Which cities and states generate the highest total sales and profit?
select State,round(sum(sales),2) as Highest_Sales 
from retail 
group by State 
order by round(sum(sales),2) 
desc;

select City,round(sum(Profit),2) as Highest_Profit 
from retail 
group by City 
order by round(sum(Profit),2) 
desc;


-- What is the average profit margin by product sub-category or product type?
select Product_Type,round(Avg((profit/nullif(Sales, 0))*100),2) 
as Average_Profit_Margin 
from retail 
group by Product_Type 
order by round(Avg((profit/Sales)*100),2) 
desc;

select Product_Sub_Category,round(Avg((profit/nullif(Sales, 0))*100),2) 
as Average_Profit_Margin 
from retail 
group by Product_Sub_Category 
order by round(Avg((profit/Sales)*100),2) 
desc;

-- Which order priority (High, Critical, etc.) leads to the most profit or loss?
select * from retail;
select Order_Priority,round(Avg((profit/nullif(Sales, 0))*100),2) as Average_Profit_Margin 
from retail 
group by Order_Priority
order by round(Avg((profit/Sales)*100),2) 
desc;
-- 📌 Discounts & Impact

-- Is there a correlation between discounts offered and profits made?
select * from retail;
alter table retail add column discount_per_unit int;
update retail set discount_per_unit=(Discount_Offered/100)*Unit_Price;

 select
 round((
        avg(discount_per_unit * Profit) - avg(discount_per_unit) * avg(Profit)
    ) /
    (
        SQRT(
            (avg(discount_per_unit * discount_per_unit) - POWER(avg(discount_per_unit), 2)) *
            (avg(Profit * Profit) - POWER(avg(Profit), 2))
        )
    ),4) as Correlation_betweeen_Profit_Discount from retail;



-- Which discount range (e.g. 0.1-0.10%, 0-11-0.20%) performs best in terms of total sales?
with cte as(

select Sales,
case 
    when Discount_Offered between 0.1 and 0.10 then "low"
    else "high"
end Discount_cat
from retail    
)
select Discount_cat,round(sum(Sales)) as Total_Sales 
from cte 
group by Discount_cat  
order by Discount_cat,round(sum(Sales))  
desc ;




-- 📌 Shipping & Operations

-- Which freight mode has the lowest average freight expense per unit sold?

select Freight_Mode,round(sum(Freight_Expenses) / sum(QtyOrdered), 2) 
as `lowest average freight expense per unit sold` 
from retail  
group by Freight_Mode 
order 
by `lowest average freight expense per unit sold` 
asc limit 1;    

-- What is the average delivery time by region? (Ship Date - Order Date)
select * from retail;
select Region, avg(datediff(Ship_Date,Order_Date)) 
as `Delivery Time` from retail group by Region;

-- 📌 Product Analytics

-- Which product sub-categories are most popular in terms of quantity ordered?
select * from retail;
select Product_Sub_Category,sum(QtyOrdered) as `Total Quantity`
from retail group by Product_Sub_Category 
order by sum(QtyOrdered) desc ;

-- What containers (e.g., Small Box, Wrap Bag) are associated with high or low profits?
select * from data;
select Product_Container,round(sum(Profit),2) as `Total Profit` 
from retail group by  Product_Container;

-- 📌 Segment Insights
-- Which customer segment (e.g., Hotels/Hospitals, Restaurants) brings the most revenue?
select * from retail;
select segment, round(sum(Sales),2) as `Total Revenue` 
from retail group by segment order by `Total Revenue`  desc ;

 



 

