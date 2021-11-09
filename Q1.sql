/*
Q1 Use the Invoice table to determine the countries that have the most invoices. Provide a table of BillingCountry and Invoices ordered by the number of invoices for each country. The country with the most invoices should appear first.
*/

select BillingCountry, COUNT(*) as NumberOfInvoices
from Invoice
group by BillingCountry
order by NumberOfInvoices desc