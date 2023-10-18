
select A.*
	, Lag(A.montly_sales,1) Over() 														as first_month_sales
	, A.montly_sales - Lag(A.montly_sales ,1) Over()									as month_sales_differnce
    , (A.montly_sales - Lag(A.montly_sales,1) Over()) / Lag(A.montly_sales,1) Over()	as precent
from 
(
	select Last_day(O.orderdate)														as month_
		, Sum(Od.quantityOrdered*Od.priceEach)                             				as montly_sales
	from classicmodels.orders as O
	join classicmodels.orderdetails as Od On O.orderNumber = Od.OrderNumber
	Group by  Last_day(O.orderdate)
	Order by Last_day(O.orderdate)
    ) as A;



Select A.*
	, Lead(A.montly_sum,12) Over() 												as year_lead
    , Lead(A.montly_sum,12) Over() - A.montly_sum								as yera_defference
    ,(Lead(A.montly_sum,12) Over() - A.montly_sum) / montly_sum					as precent_towards_first_year
from
	(
	select last_day(O.orderdate)												as motnh_
		, Sum(Od.quantityOrdered*Od.PriceEach)									as montly_sum
	from classicmodels.Orders as O
	join classicmodels.orderdetails as Od On Od.orderNumber = O.orderNumber	
	Group by last_day(O.orderdate)
	Order By last_day(O.orderDate)
		) as A;
        
-- row number
select A.*
	, row_number() Over(Partition by A.date_  Order By A.sales desc)               as	rank_
from(
	select O.orderdate																as date_
		, Od.productCode															as productcode
		, Sum(Od.quantityOrdered*Od.PriceEach)										as sales
		from classicmodels.Orders as O
		join classicmodels.orderdetails as Od On Od.orderNumber = O.orderNumber	
		GROUP BY O.orderDate, OD.productCode
		Order By O.orderDate, OD.productCode
       ) as A
Order by A.date_,A.productCode;

select A.*
	, Rank() Over( Order by A.sales)

from(
	select O.orderdate												
	, Sum(Od.quantityOrdered*Od.PriceEach)									as sales
	from classicmodels.Orders as O
	join classicmodels.orderdetails as Od On Od.orderNumber = O.orderNumber	
	Group by O.orderdate
	Order By O.orderDate
	) as A;
    
    
SELECT A.orderDate
	, ROW_NUMBER() OVER(ORDER BY A.orderDate)							AS row_number_
    , RANK() OVER(ORDER BY A.orderDate)									AS rank_
    , DENSE_RANK() OVER(ORDER BY A.orderDate)							AS dense_rank_		
FROM
(
	SELECT O.orderDate
	FROM classicmodels.orders AS O
) AS A;

 select *
from classicmodels.products;

 -- List all the order dates in descending order for orders for the 1940 Ford Pickup Truck”
 select O.orderdate
from classicmodels.orders as O
join classicmodels.orderdetails as Od on Od.orderNumber = O.orderNumber
join classicmodels.products as P On P.productCode = Od.productCode
where P.productName ='1940 Ford Pickup Truck'
order by O.orderdate desc;

 -- Which shipped orders have a value greater than $5,000?
select O.OrderNumber
	, Sum(Od.quantityOrdered*Od.priceEach)									as order_sum
from classicmodels.orders as O
join classicmodels.orderdetails as Od on Od.orderNumber = O.orderNumber
Where O.status = 'shipped'
Group by Od.ordernumber
Having order_sum > 50000 ;

-- List the names of products sold at less than 85% of the MSRP (MSRP*0.85) for shipped orders.
select distinct P.productname
from classicmodels.orderdetails as Od
join classicmodels.orders as O On O.orderNumber = Od.orderNumber
join classicmodels.products as P on P.productCode = Od.productCode
where o.status = 'Shipped' and Od.priceEach < 0.85*P.MSRP;

-- Report products and their buy prices that have been sold with a markup of 100% or more
-- (i.e., where the priceEach is at least twice the buy Price)
SELECT DISTINCT P.productName
	, P.buyPrice
FROM classicmodels.orderdetails AS OD
JOIN classicmodels.orders AS O ON OD.orderNumber = O.orderNumber
JOIN classicmodels.products AS P ON OD.productCode = P.productCode
WHERE OD.priceEach >= P.buyPrice*2;