#Q1. Create a table called employees with the following structure?
#Write the SQL query to create the above table with all constraint

cREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL CHECK (age >= 18),
    email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) DEFAULT 30000
);

#Q2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provideexamples of common types of constraints.

#Purpose of Constraints
#Constraints are rules enforced on a database's table columns to ensure the validity, accuracy, and consistency of the data. They help maintain data integrity by restricting the types of data that can be stored in the database and defining relationships between tables.
#How Constraints Maintain Data Integrity
#1.Prevent Invalid Data Entry: Constraints ensure only valid data can be inserted into a table (e.g., no null values in mandatory fields).
#2.Enforce Business Rules: Constraints implement rules that align with business logic, such as ensuring an age is at least 18 for employment.
#3.Maintain Relationships Between Tables: Constraints like foreign keys enforce referential integrity, ensuring relationships between tables remain consistent.
#4.Promote Unique Identification: Primary and unique keys ensure that no duplicate records exist where they shouldn't.
#Examples of Common Types of Constraints

#NOT NULL Constraint: Ensures a column cannot have null (empty) values.
#Example:Example: emp_id INTEGER NOT NULL - Ensures that every employee must have an ID.

#PRIMARY KEY:Purpose: Uniquely identifies each row in a table.
#Example: emp_id INTEGER PRIMARY KEY - Ensures that each employee has a unique ID.

#UNIQUE:Purpose: Ensures that values in a column are unique, but not necessarily the primary key.
#Example: email TEXT UNIQUE - Ensures that each employee has a unique email address.

#FOREIGN KEY:Purpose: Establishes a relationship between two tables by referencing the primary key of another table.
#Example: In a "orders" table, customer_id could be a foreign key referencing the customer_id in the "customers" table.

#CHECK:Purpose: Validates that data in a column meets specific conditions.
#Example: age INTEGER CHECK (age >= 18) - Ensures that the age of an employee is 18 or older.

#DEFAULT:Purpose: Specifies a default value for a column if no value is provided.
#Example: salary DECIMAL DEFAULT 30000.00 - Assigns a default salary of 30000.00 if no salary is specified for a new employee.

#Q3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

#The NOT NULL constraint ensures that a column must have a value and cannot store NULL. This is used when data is mandatory for a column.
#A Primary Key cannot contain NULL values because it uniquely identifies each row in a table, and NULL represents an unknown or missing value, which would violate uniqueness.
#Ensures Data Completeness: By enforcing NOT NULL, you guarantee that essential data is always present. This is crucial for data integrity and accurate reporting. For example, in an "employees" table, emp_id and emp_name should be NOT NULL as they are fundamental for identifying and managing employees.
#Prevents Errors: Missing data can lead to errors in calculations, data analysis, and business processes. NOT NULL helps prevent such errors by ensuring that required information is always available.
#Enforces Business Rules: In many cases, business rules dictate that certain fields cannot be empty. For instance, a customer's email address might be required for account creation and communication, so it should be NOT NULL.

#Can a primary key contain NULL values?
#No. A primary key, by definition, uniquely identifies each row in a table.
#Null values are not unique. If a column allows NULL values, multiple rows could have NULL in that column, making it impossible to distinguish between them. This violates the fundamental principle of a primary key, which is to provide a unique identifier for every row

#Q4.  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.

#Adding a Constraint:
#Correct: The ALTER TABLE command is indeed used to modify the structure of an existing table, including adding constraints.
#Example:
ALTER TABLE employees ADD CONSTRAINT chk_age CHECK (age >= 18); 
#Removing a Constraint:
#Correct: The ALTER TABLE command is used to drop a constraint.
#Example:
ALTER TABLE employees DROP CONSTRAINT chk_age;

#Q5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.

#When a constraint is violated, the database rejects the operation, and an error is returned.
#Example: If a user tries to insert a record with a NULL value in a NOT NULL column:
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (1, NULL, 25, 'john@example.com', 40000);
#Error Message:
ERROR: null value in column "emp_name" violates not-null constraint

#Q6.  You created a products table without constraints as follows:
#Now, you realise that?
#: The product_id should be a primary keyQ
#: The price should have a default value of 50.00

#To modify the products table and apply the constraints:
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

#Q7. You have two tables: Write a query to fetch the student_name and class_name for each student using an INNER JOIN

SELECT 
    Students.student_name,
    Classes.class_name
FROM 
    Students
INNER JOIN 
    Classes
ON 
    Students.class_id = Classes.class_id;

#Q8. Consider the following three tables:
#Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order 
#Hint: (use INNER JOIN and LEFT JOIN)

SELECT 
    o.order_id, 
    c.customer_name, 
    p.product_name
FROM 
    Orders o
LEFT JOIN 
    Customers c ON o.customer_id = c.customer_id
LEFT JOIN 
    Products p ON o.order_id = p.order_id;

#Q9. Given the following tables:
#Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT 
    p.product_name, 
    SUM(s.amount) AS total_sales 
FROM 
    Products p
INNER JOIN 
    Sales s ON p.product_id = s.product_id
GROUP BY 
    p.product_name;

#10. You are given three tables:
#Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

SELECT
    o.order_id,
    c.customer_name,
    SUM(od.quantity) AS total_quantity
FROM
    Orders o
INNER JOIN
    Customers c ON o.customer_id = c.customer_id
INNER JOIN
    Order_Details od ON o.order_id = od.order_id
GROUP BY
    o.order_id,
    c.customer_name;

#  SQL Commands

#Q1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences

#Primary Key: A unique identifier for each row in a table. It ensures data integrity and prevents duplicate entries.
#Foreign Key: A column in one table that references the primary key of another table. It establishes a relationship between two tables.
#To identify these in the maven movies database, we would need to examine the schema and table definitions.

# Q2.  List all details of actors
SELECT * FROM actor;

#Q3. List all customer information from DB.
SELECT * FROM customer;

#Q4 List different countries.
SELECT DISTINCT country FROM country;

#Q5 Display all active customers.
SELECT * FROM customer WHERE active = 1;

#Q6 List of all rental IDs for customer with ID 1.
SELECT rental_id FROM rental WHERE customer_id = 1;

#Q7 Display all the films whose rental duration is greater than 5 .
SELECT * FROM film WHERE rental_duration > 5;

#Q8 List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

#Q9 Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) FROM actor;

#Q10 Display the first 10 records from the customer table .
SELECT * FROM customer LIMIT 10;

#Q11  Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer WHERE first_name LIKE 'b%' LIMIT 3;

#Q12 Display the names of the first 5 movies which are rated as ‘G’.
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

#Q13 Find all customers whose first name starts with "a".
SELECT * FROM customer WHERE first_name LIKE 'a%';

#Q14 Find all customers whose first name ends with "a".
SELECT * FROM customer WHERE first_name LIKE '%a';

#Q15 Display the list of first 4 cities which start and end with ‘a’ .
SELECT city FROM city WHERE city LIKE 'a%' AND city LIKE '%a' LIMIT 4;

#Q16 Find all customers whose first name have "NI" in any position.
SELECT * FROM customer WHERE first_name LIKE '%NI%';

#Q17 Find all customers whose first name have "r" in the second position .
SELECT * FROM customer WHERE first_name LIKE '_r%';

#Q18  Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT * FROM customer WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

#Q19 Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer WHERE first_name LIKE 'a%' AND first_name LIKE '%o';

#Q20  Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

#Q21  Get the films with length between 50 to 100 using between operator.
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

#Q22  Get the top 50 actors using limit operator.
SELECT * FROM actor LIMIT 50;

#Q23  Get the distinct film ids from inventory table.
SELECT DISTINCT film_id FROM inventory;

## Functions
## Basic Aggregate Functions:

#Question 1: Retrieve the total number of rentals made in the Sakila database.
#Hint: Use the COUNT() function.
SELECT COUNT(*) AS total_rentals
FROM rental;

#Question 2:Find the average rental duration (in days) of movies rented from the Sakila database.
#Hint: Utilize the AVG() function.
SELECT AVG(DATEDIFF(rental_date, return_date)) AS avg_rental_duration
FROM rental;

#String Functions:

#Question 3:Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER () function.
SELECT UPPER(first_name), UPPER(last_name)
FROM customer;

#Question 4:Extract the month from the rental date and display it alongside the rental ID.
#Hint: Employ the MONTH() function.
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

#GROUP BY:

#Question 5:Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
#Hint: Use COUNT () in conjunction with GROUP BY.
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

#Question 6:Find the total revenue generated by each store.
#Hint: Combine SUM() and GROUP BY.
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

#Question 7:Determine the total number of rentals for each category of movies.
#Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

#Question 8:Find the average rental rate of movies in each language.
#Hint: JOIN film and language tables, then use AVG () and GROUP BY.
SELECT l.name, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

##  Joins

#Questions 9: Display the title of the movie, customer s first name, and last name who rented it.
#Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT f.title, c.first_name, c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

#Question 10:Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
#Hint: Use JOIN between the film actor, film, and actor tables.
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

#Question 11:Retrieve the customer names along with the total amount they've spent on rentals.
#Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

#Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
#Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.film_id
ORDER BY c.last_name, f.title;

## Advanced Joins and GROUP BY:

#Question 13:Display the top 5 rented movies along with the number of times they've been rented.
#Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

#Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
#Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

##  Windows Function:

#Q1. Rank the customers based on the total amount they've spent on rentals.
SELECT customer_id, SUM(amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS customer_rank
FROM payment
GROUP BY customer_id;

#Q2. Calculate the cumulative revenue generated by each film over 
SELECT f.title, r.rental_date,
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id;

#Q3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT f.title, f.length,
    AVG(DATEDIFF(r.return_date, r.rental_date)) OVER (PARTITION BY f.length) AS avg_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id;

#Q4. Identify the top 3 films in each category based on their rental counts.
SELECT c.name AS category_name, f.title,
COUNT(r.rental_id) AS rental_count,
    RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS film_rank
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name, f.film_id, f.title
HAVING film_id <= 3;

#Q5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS rental_difference
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

#Q6. Find the monthly revenue trend for the entire rental store over time.
SELECT 
    DATE_FORMAT(r.rental_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue,
    SUM(SUM(p.amount)) OVER (ORDER BY DATE_FORMAT(r.rental_date, '%Y-%m')) AS cumulative_revenue
FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY DATE_FORMAT(r.rental_date, '%Y-%m')
ORDER BY month;

#Q7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        PERCENT_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS percentile_rank
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_spending
WHERE percentile_rank >= 0.8;

#Q8. Calculate the running total of rentals per category, ordered by rental count.
SELECT 
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS running_total
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name, f.film_id;

#Q9. Find the films that have been rented less than the average rental count for their respective categories.
WITH rental_data AS (
    SELECT 
        f.title,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.category_id) AS avg_rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, c.category_id, c.name
)
SELECT *
FROM rental_data
WHERE rental_count < avg_rental_count;

#Q10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
    DATE_FORMAT(r.rental_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue
FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY DATE_FORMAT(r.rental_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 5;

##  Normalisation & CTE

#Q1. First Normal Form (1NF): a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

#Example: The customer table violates 1NF if it contains a multi-valued attribute (e.g., storing multiple phone numbers in a single column as comma-separated values).
#Normalization to 1NF:Create a separate table called customer_phone with columns customer_id and phone_number.
#Each phone number would occupy a new row associated with the corresponding customer_id.

#Q2. Second Normal Form (2NF):a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.

#Example: The film_actor table could violate 2NF if there are partial dependencies. 
#For example, storing film_title or actor_name in this table would mean that these attributes are dependent only on film_id or actor_id, not the composite key (film_id, actor_id).
#Steps to Normalize:
#Split the table into:
#1.film_actor (composite key with film_id and actor_id).
#2.film (storing film_id and film_title).
#3.actor (storing actor_id and actor_name)

#Q3. Third Normal Form (3NF):a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
#Example: The rental table could violate 3NF if it stores customer_address along with customer_id, because customer_address is functionally dependent on customer_id.
#Steps to Normalize:
# * Remove the transitive dependency by creating a customer_address table with columns customer_id and address.
# * Modify the rental table to only reference customer_id and join with customer_address when needed.

#Q4. Normalization Process:a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
#Initial Unnormalized Form (Hypothetical): Assume the film table had a column actors storing a list of actor names (e.g., "Tom Hanks, Julia Roberts"). This would violate 1NF.
#Normalization to 1NF: We would create a new table, film_actors, with columns film_id and actor_id. The actors column in the film table would be removed, and the film-actor relationships would be stored in the film_actors table.
#Normalization to 2NF: Since the film table now only has columns directly related to the film_id (e.g., title, description, rental_rate), it is already in 2NF.

#Q5. CTE Basics:a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
WITH actor_film_count AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)
SELECT *
FROM actor_film_count;

#Q6. CTE with Joins:a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
WITH film_language AS (
    SELECT 
        f.film_id,
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT *
FROM film_language;

#Q7. CTE for Aggregation:a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;

#Q8. CTE with Window Functions:a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
WITH RankedFilms AS (
    SELECT film_id, title, rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS 'rank'
    FROM
        film
)
SELECT 'rank' , film_id, title, rental_duration
FROM
    RankedFilms
ORDER BY
    'rank';
    
#Q9. CTE and Filtering:a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
WITH FrequentRenters AS (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 2)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN FrequentRenters fr ON c.customer_id = fr.customer_id;

#Q10. CTE for Date Calculations:a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
WITH MonthlyRentals AS (
    SELECT
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,  -- Format as 'YYYY-MM'
        COUNT(*) AS total_rentals
    FROM
        rental
    GROUP BY
        rental_month
)
SELECT rental_month, total_rentals
FROM MonthlyRentals
ORDER BY rental_month DESC;

#Q11. CTE and Self-Join:a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
WITH ActorPairs AS (
    SELECT a1.actor_id AS actor1_id, a2.actor_id AS actor2_id
    FROM film_actor a1
    JOIN film_actor a2 ON a1.film_id = a2.film_id AND a1.actor_id < a2.actor_id
)
SELECT * FROM ActorPairs;

#Q12. CTE for Recursive Search:a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Select employees who directly report to a specific manager
    SELECT staff_id, first_name, last_name, address_id
    FROM staff
    WHERE address_id = 1  -- Replace '1' with the specific manager_id you're interested in

    UNION ALL

    -- Recursive case: Select employees who report to the staff in the previous level
    SELECT s.staff_id, s.first_name, s.last_name, s.address_id
    FROM staff s
    JOIN EmployeeHierarchy eh ON s.address_id = eh.staff_id
)
SELECT * FROM EmployeeHierarchy;

