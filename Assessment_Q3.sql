SELECT 
    s.plan_id,
    s.owner_id,
    'Savings' AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM savings_savingsaccount s
WHERE s.confirmed_amount > 0
GROUP BY s.plan_id, s.owner_id
HAVING MAX(s.transaction_date) < CURDATE() - INTERVAL 365 DAY

UNION

SELECT 
    p.id AS plan_id,
    p.owner_id,
    'Investment' AS type,
    MAX(sa.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(sa.transaction_date)) AS inactivity_days
FROM plans_plan p
JOIN savings_savingsaccount sa ON sa.plan_id = p.id
WHERE p.is_fixed_investment = 1 AND sa.confirmed_amount > 0
GROUP BY p.id, p.owner_id
HAVING MAX(sa.transaction_date) < CURDATE() - INTERVAL 365 DAY;