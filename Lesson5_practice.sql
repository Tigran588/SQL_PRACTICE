Select E1. *
	, E2.lastname
    ,E2.firstName
    ,E2.officecode
from classicmodels.employees as E1
Join classicmodels.employees as E2 On E1.employeeNumber = E2.employeeNumber;

-- Sales amount by order date, for USA, from earliest to 
select B.orderDate
, Sum(A.quantityOrdered*A.priceEach)
from classicmodels.orderdetails 			as A
join classicmodels.orders as B on A.orderNumber = B.orderNUmber
join classicmodels.customers as C on B.customerNumber = C.customerNumber
Where C.country = "USA"
Group By B.orderDate
Order by B.orderDate;

-- Sales amount by country, status, ordered alphabetically by country
select C.country
	, O.status
    , Sum(Od.quantityOrdered*Od.priceeach) 										as Sales_amount
from classicmodels.orders														as O
Join classicmodels.orderdetails As Od on Od.orderNumber = O.orderNumber
Join classicmodels.customers as C on C.customerNumber = O.customerNumber
Group By C.country,O.status
Order by C.country;


-- Top 5 customers (customer number) by sales amount

select C.customerName
	,Sum(Od.quantityordered*OD.priceEach)							as Sales
from classicmodels.orderdetails                   					as Od
join classicmodels.orders as O on O.orderNumber = od.OrderNumber
join classicmodels.customers as C on C.customerNumber  = O.customerNumber
Group By C.customerName
Order By Sales Desc
Limit 5;

 -- amenashat 10 caxvogh produktnery (product name)
select P.productName
	,Sum(Od.quantityOrdered)                          as quantity
from classicmodels.products as P
join classicmodels.orderdetails as Od On Od.productCode = P.productCode
Group by P.productname
Order by quantity Desc
Limit 10; 

-- by country average order amount, order from max to min
select	C.country 
	,Sum(Od.quantityOrdered*Od.priceeach)                              		as Sum
	, Count(distinct Od.ordernumber)									 		as Coount
    , Sum(Od.quantityOrdered*Od.priceeach) / Count(distinct Od.ordernumber)		as Average
from classicmodels.orderdetails 												as Od
join classicmodels.orders as O On O.orderNumber = Od.orderNumber
join classicmodels.customers as C On C.customerNumber = O.customerNumber
Group by C.Country
Order by Average Desc;


-- count of customers who never did order

select  count(C.CustomerNumber)
from classicmodels.customers	as C
left join classicmodels.orders as O On O.customerNumber = C.customerNumber
where o.customerNumber is Null;

-- divide amount by 3 groups, <1000 low, >= 1000 & < 10000 medium, >=10000 high

select *
	, CASE
		WHEN P.amount < 2000 Then 'low'
        When P.amount > 2000 and P.amount <4000 Then 'medium'
        When P.amount > 4000 Then "High"  							
	End																as Segment
from classicmodels.payments as P;
        