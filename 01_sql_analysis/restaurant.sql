/*Clean column names from tables*/
 
ALTER TABLE address
RENAME COLUMN `ï»¿address_id` TO address_id

SELECT *
FROM address

ALTER TABLE customers
RENAME COLUMN `ï»¿customer_id` TO customer_id

SELECT *
FROM customers

ALTER TABLE ingredients
RENAME COLUMN `ï»¿ing_id` TO ingredients_id

SELECT *
FROM ingredients

ALTER TABLE inventory
RENAME COLUMN `ï»¿inv_id` TO inventory_id

SELECT *
FROM inventory

ALTER TABLE items
RENAME COLUMN `items_id` TO item_id

SELECT *
FROM items

ALTER TABLE orders
RENAME COLUMN `ï»¿row_id` TO orders_id

SELECT *
FROM orders

ALTER TABLE recipe
RENAME COLUMN `ï»¿row_id` TO row_id

SELECT *
FROM recipe

ALTER TABLE rotations
RENAME COLUMN `ï»¿row_id` TO row_id

SELECT *
FROM rotations

ALTER TABLE shifts
RENAME COLUMN `ï»¿shift_id` TO shift_id

SELECT *
FROM shifts

ALTER TABLE staff
RENAME COLUMN `ï»¿staff_id` TO staff_id

SELECT *
FROM staff

ALTER TABLE orders
RENAME COLUMN `add_id` TO address_id

SELECT *
FROM orders

/* PART 1: This restaurant requires general information for the past sales, specifically:
1. Total orders
2. Total sales
3. Total items
4. Average order values
5. Sales by category
6. Top selling items
7. orders by hour
8. Sales by hour
9. Order by address
10. Orders by delivery or pick up
*/

/*Join tables*/
SELECT
	o.orders_id,
    i.item_price,
    o.quantity,
    i.item_category,
    i.item_name,
    o.created_date,
    o.created_at,
    a.delivery_address1,
    a.delivery_address2,
    a.delivery_city,
    a.delivery_zipcode,
    o.delivery
FROM orders AS o
	LEFT JOIN items AS i
		ON o.item_id = i.item_id
	LEFT JOIN address AS a
		ON o.address_id = a.address_id
        
/* PART 2:
1. Total quantity by ingredient
2. Total cost of ingredients
3. Calculated cost of pizza
4. Percentage stock remaining by ingredient
*/

/*Total quantity by ingredient*/
WITH unitary_costs AS (

SELECT
	s1.item_name,
    s1.ing_id,
    s1.ing_name,
    s1.ing_weight,
    s1.ing_price,
    s1.recipe_quantity,
    s1.order_quantity,
	s1.recipe_quantity * s1.order_quantity AS ordered_weight,
    ROUND((s1.ing_price / s1.ing_weight), 2) AS unit_cost,
    ROUND((s1.recipe_quantity * s1.order_quantity) * (s1.ing_price / s1.ing_weight), 2) AS ingredient_cost
FROM (
	SELECT
		o.item_id,
		i.item_sku,
		i.item_name,
		r.ing_id,
		ing.ing_name,
		ing.ing_weight,
		ing.ing_price,
		r.quantity AS recipe_quantity,
		SUM(o.quantity) AS order_quantity
	FROM orders AS o
	LEFT JOIN items AS i 
		ON o.item_id = i.item_id
	LEFT JOIN recipe AS r
		ON r.recipe_id = i.item_sku
	LEFT JOIN ingredients AS ing
		ON ing.ingredients_id = r.ing_id
	GROUP BY
		o.item_id,
		i.item_sku,
		i.item_name,
		r.ing_id,
		ing.ing_name,
		ing.ing_weight,
		ing.ing_price,
		r.quantity) AS s1
		)

/* Select columns from cte to calculate:
a. Total weight ordered
b. Inventory amount
c. Inventory remaining per ingredient
*/

SELECT 
	s2.ing_name,
    s2.ordered_weight,
    ing.ing_weight,
    inv.quantity,
    ing.ing_weight * inv.quantity AS total_inv_weight,
    (ing.ing_weight * inv.quantity) - (s2.ordered_weight) AS remaining_weight
FROM (
	SELECT
		ing_id,
		ing_name,
		SUM(ordered_weight) AS ordered_weight
	FROM unitary_costs
	GROUP BY 
		ing_id,
		ing_name ) AS s2
	LEFT JOIN inventory AS inv
		ON inv.item_id = s2.ing_id
	LEFT JOIN ingredients AS ing
		ON ing.ingredients_id = s2. ing_id
;
        
/* PART 3. Staff and shifts */
SELECT
	rot.date,
	st.fist_name AS first_name,
	st.last_name,
	st.hourly_rate,
    sh.start_time,
    sh.end_time,
    ROUND((((hour(timediff(sh.end_time, sh.start_time)) * 60) + (minute(timediff(sh.end_time, sh.start_time)))) / 60), 2) AS hours_shift,
    ROUND((((hour(timediff(sh.end_time, sh.start_time)) * 60) + (minute(timediff(sh.end_time, sh.start_time)))) / 60 * st.hourly_rate), 2) AS staff_cost
FROM rotations AS rot
LEFT JOIN staff AS st
	ON st.staff_id = rot.staff_id
LEFT JOIN shifts AS sh
	ON sh.shift_id = rot.shift_id


