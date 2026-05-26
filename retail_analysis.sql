Use retail_analysis;


-- Rename the table
Select * from retail_2009_2010;

alter table retail_2009_2010 rename to retail_2010_2011;

-- Merge both the table
Select * from retail_2009_2010;
Select COUNT(*) from retail_2010_2011;

create view retail_all as
select * from retail_2009_2010
union
select * from retail_2010_2011;


select Count(*) from retail_all;

-- Top 10 products by total revenue
select Count(distinct StockCode) from retail_all;
select
Description,
sum(Quantity*Price) as total_revenue
from retail_all
group by Description
order by total_revenue desc
limit 10;

-- Monthly Sales Trend 
select 
Month(str_to_date(InvoiceDate,'%m/%d/%Y %H:%i')) as month,
Year(str_to_date(InvoiceDate,'%m/%d/%Y %H:%i')) as Year,
sum(Quantity*Price) as total_revenue
from retail_all
Group by year, month
order by total_revenue desc;

-- Top 10 Customers by total spend 


Select 
CustomerId,
sum(Quantity*Price) as total_revenue
from retail_all
group by CustomerID
order by total_revenue desc
limit 10;

-- Top 10 countries by total spend 

Select 
country,
sum(Quantity*Price) as total_revenue
from retail_all
group by Country
order by total_revenue desc
limit 10;

-- average countries by total spend 

Select 
country,
Avg(Quantity*Price) as total_revenue
from retail_all
group by Country
order by total_revenue desc
limit 10;

-- Which month had the most number of orders
select 
Month(str_to_date(InvoiceDate,'%m/%d/%Y %H:%i')) as month,
Year(str_to_date(InvoiceDate,'%m/%d/%Y %H:%i')) as Year,
Count(Invoice) as NOO
from retail_all
Group by year, month
order by NOO desc;

-- which country has the most number of unique customers?

Select 
Country,
count(distinct(CustomerId)) as Unique_customer
from retail_all
group by country
order by unique_customer desc;	


-- Total revenue by year — which year performed better?
select 
Year(str_to_date(InvoiceDate,'%m/%d/%Y %H:%i')) as Year,
sum(Quantity*Price) as amount
from retail_all
Group by year
order by amount desc;


