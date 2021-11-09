/*
Q3 The customer who has spent the most money will be declared the best customer. Build a query that returns the person who has spent the most money. I found the solution by linking the following three: Invoice, InvoiceLine, and Customer tables to retrieve this information, but you can probably do it with fewer!
*/

select Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(total) as Total
from Customer
join Invoice on Invoice.CustomerId = Customer.CustomerId
group by Customer.CustomerId, Customer.FirstName, Customer.LastName
order by Total desc
limit 1