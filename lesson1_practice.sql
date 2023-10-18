SELECT *
FROM classicmodels.customers;

SELECT customerNumber
	, customerName
    , phone
FROM classicmodels.customers
WHERE creditLimit BETWEEN 50000 AND 100000;

SELECT customerNumber
	, creditLimit		as once
    , creditLimit*2		as twice
    , creditLimit*3		as third
    , 'Poxos'			as name
FROM classicmodels.customers
where country = "USA";

SELECT customerNumber
	, contactFirstName
FROM classicmodels.customers
WHERE country = 'France'
order  by customerNumber desc,contactFirstName ;

Select contactFirstName
	, contactLastName
	, creditLimit
From classicmodels.customers
Where country = 'USA'
Order by creditLimit Desc
Limit 5;

select count(distinct uniq.city)
From classicmodels.customers as uniq
where uniq.country = 'USA' and uniq.creditLimit >= 100000;

select Distinct C.city
From classicmodels.customers 		as C
where C.country = 'USA' and C.country in ('USA','Australia','France') and C.contactFirstName like '%A'