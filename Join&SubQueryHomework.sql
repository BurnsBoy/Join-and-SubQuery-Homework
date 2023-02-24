--Q1
select first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id 
where district = 'Texas';

--Q2
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99;

--Q3
select first_name, last_name
from customer
where customer_id in(
	select customer_id 
	from payment
	where amount > 175
);

--Q4
select first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id 
where address.city_id in(
	select city_id
	from city
	inner join country
	on city.country_id = country.country_id 
	where country = 'Nepal'
);

--Q5
select first_name, last_name
from staff
where staff.staff_id in(
	select staff_id 
	from payment
	group by staff_id
	order by COUNT(staff_id) desc 
	limit 1
);

--Q6
select rating, count(rating)
from film
group by rating  
order by rating;

--Q7
select first_name, last_name 
from customer
where customer_id in(
	select customer_id 
	from payment
	where amount > 6.99
)

--Q8
select COUNT(rental)
from rental
inner join payment
on rental.rental_id = payment.rental_id
where payment.amount = 0.00
