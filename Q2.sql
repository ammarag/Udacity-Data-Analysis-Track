/*
Q2 We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns the 1 city that has the highest sum of invoice totals. Return both the city name and the sum of all invoice totals.
*/

select BillingCity,
SUM(total) as SumOfTotals
from Invoice
group by Invoice.BillingCity
order by SumOfTotals desc
limit 1