/*
Q4 The team at Chinook would like to identify all the customers who listen to Rock music. Write a query to return the email, first name, last name, and Genre of all Rock Music listeners. Return your list ordered alphabetically by email address starting with 'A'.
*/

select distinct Customer.Email, Customer.FirstName, Customer.LastName, Genre.Name as Genre
from Customer
join Invoice on Customer.CustomerId = Invoice.CustomerId
join InvoiceLine on InvoiceLine.InvoiceId = Invoice.InvoiceId
join Track on Track.TrackId = InvoiceLine.TrackId
join Genre on Genre.GenreId = Track.GenreId
where Genre.Name = 'Rock'
order by Email