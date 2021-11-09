/*
Q5 Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.

You should only need to use the Customer and Invoice tables.
*/

with spentPerCustomer as
	(
	select Invoice.CustomerId cu1, Invoice.BillingCountry co1, SUM(invoice.total) as totals1
	from Invoice
	group by CustomerId, BillingCountry
	),
spentPerCountry as
	(
	select co1 as co2, MAX(totals1) totals2
	from 
		(
		select Invoice.CustomerId cu1, Invoice.BillingCountry co1, SUM(invoice.total) as totals1
		from Invoice
		group by CustomerId, BillingCountry
		) q1
	group by co1
	)
select spentPerCustomer.cu1, Customer.FirstName, Customer.LastName, spentPerCustomer.co1,  spentPerCustomer.totals1
from spentPerCustomer
join spentPerCountry on spentPerCountry.co2 = spentPerCustomer.co1 and spentPerCountry.totals2 = spentPerCustomer.totals1
join Customer on spentPerCustomer.cu1 = Customer.CustomerId