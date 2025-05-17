WITH user_monthly_tx AS (
    SELECT 
        owner_id,
        DATE_FORMAT(transaction_date, '%Y-%m') AS month,
        COUNT(*) AS tx_count
    FROM savings_savingsaccount
    GROUP BY owner_id, month
),
avg_tx_per_user AS (
    SELECT 
        owner_id,
        AVG(tx_count) AS avg_tx_per_month
    FROM user_monthly_tx
    GROUP BY owner_id
),
categorized_users AS (
    SELECT 
        CASE
            WHEN avg_tx_per_month >= 10 THEN 'High Frequency'
            WHEN avg_tx_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_tx_per_month
    FROM avg_tx_per_user
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_tx_per_month), 1) AS avg_transactions_per_month
FROM categorized_users
GROUP BY frequency_category
ORDER BY 
    CASE frequency_category
        WHEN 'High Frequency' THEN 1
        WHEN 'Medium Frequency' THEN 2
        ELSE 3
    END;