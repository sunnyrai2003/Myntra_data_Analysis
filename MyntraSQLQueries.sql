SELECT * FROM geeksforgeeks.data;

-- 1. Find products with the highest rating using a subquery.

SELECT 
    product_name
FROM
    geeksforgeeks.data
WHERE
    product_name > (SELECT 
            MAX(rating)
        FROM
            geeksforgeeks.data);

-- 2. List all products where the discounted price is greater than the average discounted price of all products.
 
SELECT 
    product_name, discount_amount
FROM
    geeksforgeeks.data
WHERE
    discount_amount > (SELECT 
            AVG(discounted_price)
        FROM
            geeksforgeeks.data);
            
-- 3. Get the product with the maximum discount amount using a subquery.
SELECT 
    product_name
FROM
    geeksforgeeks.data
WHERE
    discounted_price = (SELECT 
            MAX(discounted_price)
        FROM
            geeksforgeeks.data);
            
-- 4. Find brands that have at least one product with a rating greater than 4 using a subquery.
SELECT DISTINCT
    brand_name
FROM
    geeksforgeeks.data
WHERE
    brand_name IN (SELECT 
            brand_name
        FROM
            geeksforgeeks.data
        WHERE
            rating > 4);
            
-- 5. Get products whose price is greater than the average marked price of all products using a subquery.
SELECT 
    product_name, brand_name
FROM
    geeksforgeeks.data
WHERE
    marked_price > (SELECT 
            AVG(marked_price)
        FROM
            geeksforgeeks.data);

-- 6. List products whose rating is higher than the average rating for the same brand using a subquery.

with new_table as( select * from geeksforgeeks.data
limit 500)

SELECT 
   *
FROM
    new_table r1
WHERE
    rating > (SELECT 
            AVG(rating)
        FROM
            new_table r2
        GROUP BY brand_name
        HAVING r1.brand_name = r2.brand_name);


-- 7. Find the product(s) with the lowest discount percentage using a subquery.
SELECT 
    product_name
FROM
    geeksforgeeks.data
WHERE
    discount_percent = (SELECT 
            MIN(discount_percent)
        FROM
            geeksforgeeks.data);

-- 8. List products where the discounted price is higher than the minimum discounted price for the same brand using a subquery.

with new_data as(select * from geeksforgeeks.data
limit 100)

SELECT 
   *
FROM
    new_data b1
WHERE
    discount_percent > (SELECT 
            MIN(discounted_price)
        FROM
            new_data b2
        GROUP BY brand_name
        HAVING b1.brand_name = b2.brand_name);

-- 9. Find the product(s) with the most number of ratings using a subquery.
 
SELECT 
    product_name, rating
FROM
    geeksforgeeks.data
WHERE
    rating = (SELECT 
            MAX(rating)	
        FROM
            geeksforgeeks.data);
            
-- 10. List products where the discount percentage is greater than the discount percentage of a specific product (e.g., "Product A") using a subquery.

SELECT 
    *
FROM
    geeksforgeeks.data d1
WHERE
    discount_percent = (SELECT 
            MAX(discount_percent)
        FROM
            geeksforgeeks.data d2
        GROUP BY product_name
        HAVING d1.product_name = d2.product_name);

-- 11. Find products whose rating is higher than the average rating for the same brand using a correlated subquery.

with new_table as( select* from geeksforgeeks.data
limit 500)

SELECT 
    *
FROM
    new_table r1
WHERE
    rating > (SELECT 
            AVG(rating)
        FROM
            new_table r2
        GROUP BY brand_name
        HAVING r1.brand_name = r2.brand_name);

-- 12. List products with a discount percentage greater than the average discount percentage of their brand using a correlated subquery.

SELECT 
	product_name, brand_name
FROM
    geeksforgeeks.data d1
WHERE
    discount_percent > (SELECT 
            AVG(discount_percent)
        FROM
            geeksforgeeks.data d2
        GROUP BY brand_name
        HAVING d1.brand_name = d2.brand_name);

 -- 13. Find products whose discounted price is greater than the discounted price of products from the same brand using a correlated subquery.
 
 SELECT 
    product_name, brand_name
FROM
    geeksforgeeks.data s1
WHERE
    discount_percent = (SELECT 
            MAX(discount_percent)
        FROM
            geeksforgeeks.data s2
        GROUP BY brand_name
        HAVING s2.brand_name = s1.brand_name); 
 
 -- 14. Get products whose rating is higher than the average rating in their category using a correlated subquery.
 
with new_brand as (select product_name from geeksforgeeks.data
 limit 200)

SELECT 
    product_name
FROM
    new_brand d1
WHERE
    rating = (SELECT 
            avg(rating)
        FROM
           new_brand d2
        GROUP BY brand_name
        HAVING d1.brand_name = d2.brand_name);
 
 
 -- 15. Find products whose discount amount is greater than the discount amount of products from the same brand using a correlated subquery. 
 
 with new_brand as (select product_name from geeksforgeeks.data
 limit 200)

SELECT 
    product_name
FROM
    new_brand d1
WHERE
    discount_amount = (SELECT 
            MAX(discount_amount)
        FROM
            new_brand d2
        GROUP BY brand_name
        HAVING d1.brand_name = d2.brand_name);
 
      
 
 

 
 