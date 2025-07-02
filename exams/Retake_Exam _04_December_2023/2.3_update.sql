UPDATE products
SET
    price = price * 1.1
WHERE
    id IN
        (SELECT product_id FROM feedbacks WHERE rate > 8);