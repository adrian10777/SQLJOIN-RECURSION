--1. List all customers who live in Texas (use JOINs)
--texas is a state and located in the adress table as district
select first_name, last_name, district
from address
join customer
on address.address_id = customer.address_id
where district = 'Texas';
--answer= Jennifer, Kim, Richard, Bryan, and Ian

--2. Get all payments above $6.99 with the Customer's Full Name
--payments, where >6.99, customers full name

select amount, first_name, last_name
from payment
join customer
on payment.customer_id = customer.customer_id
where amount > 6.99;
--answer --200 people


--3.Show all customers names who have made payments over $175(use
--subqueries)

-- why use subquery? 

select amount, first_name, last_name
from customer
join payment
on customer.customer_id = payment.customer_id
where amount > 175;
--200 customers

--4. List all customers that live in Nepal (use the city table)
-- customers, live in nepal, city table
select * from customer;
select * from address;
select * from city;
select * from country;

select customer.first_name, customer.last_name, country.country
from customer 
join address
on customer.address_id = address.address_id
join city
on city.city_id = address.city_id
join country
on country.country_id = city.country_id
where country= 'Nepal';
 -- answer kevin schuler nepal
--not working?


--5. Which staff member had the most transactions?
select * from staff;
select * from payment;

select staff.first_name, staff.last_name, payment.staff_id, count(payment.staff_id)
from staff
join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name, payment.staff_id 
order by staff_id desc;
--Jon Stephens

--6. How many movies of each rating are there?
select count(rating), rating
from film
group by rating 
order by rating asc;

--answer 178:G, 194:PG, 223: PG-13, 195: R, 210: NC-17

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

select amount, first_name, last_name
from payment
join customer
on payment.customer_id = customer.customer_id
where amount > 6.99;

-- 8. How many free rentals did our stores give away?
select * from rental;
select * from payment;

select payment.amount, rental.rental_id
from rental
join payment
on payment.rental_id = rental.rental_id
where rental = 0;