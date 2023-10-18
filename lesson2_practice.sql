Select AVG(C.quantityinstock*C.buyprice) as AVG
from classicmodels.products as C
where C.quantityInStock >= 5000 and C.productline = "Classic Cars";

SELECT P.productLine
	, P.productScale
	, COUNT(P.productCode)								AS total_products
    , SUM(P.quantityInStock)							AS total_qty_in_stock
    , CAST(AVG(P.buyPrice) AS DECIMAL(10,2))			AS avg_price
FROM classicmodels.products AS P
GROUP BY P.productLine, P.productScale
ORDER BY P.productLine, P.productScale Desc;

select *
From classicmodels.products;

SELECT P.productLine
	, COUNT( Distinct P.productLine)			AS total_row
FROM classicmodels.products AS P
GROUP BY P.productLine;

select Count(E.employeeNumber) as Count
	, Sum(E.officeCode) as Sum
    , jobTitle
    , Cast(Sum(E.officeCode)/Count(employeeNumber) as decimal(10,2))
From classicmodels.employees as E
Group by E.jobTitle;

select *
from classicmodels.employees;

SELECT DISTINCT E.jobTitle
	, COUNT(E.employeeNumber)														AS total_employees
	, SUM(E.officeCode)																AS salary
	, CAST(SUM(E.officeCode)/COUNT(E.employeeNumber) AS DECIMAL(10,2))				AS weight_salary
    , AVG(E.officeCode)																AS avg_salary
FROM classicmodels.employees AS E
GROUP BY E.jobTitle
Having salary >= 2;


SELECT DISTINCT E.jobTitle
		, COUNT(E.employeeNumber)														AS total_employees
		, SUM(E.officeCode)																AS salary
		, CAST(SUM(E.officeCode)/COUNT(E.employeeNumber) AS DECIMAL(10,2))				AS weight_salary
		, AVG(E.officeCode)																AS avg_salary
	FROM classicmodels.employees AS E
	GROUP BY E.jobTitle
    ;
    
select *
from classicmodels.orderdetails;

select OrderNumber
	,Count(productCode)
	, Sum(quantityOrdered)
    , Min(priceEach)
    , Max(priceEach)
    , Avg(priceEach)
From classicmodels.orderdetails
Group by orderNumber;

Select *
From classicmodels.payments;

select CustomerNumber
	, count(checkNumber)
    , sum(amount)
    , cast(sum(amount)/count(checkNumber) AS Decimal(10,2))
    ,AVG(amount)
from classicmodels.payments
Group By CUstomerNumber;
