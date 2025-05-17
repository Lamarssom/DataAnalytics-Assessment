SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.plan_id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    SUM(s.confirmed_amount) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON u.id = p.owner_id AND p.is_fixed_investment = 1
WHERE s.confirmed_amount > 0
GROUP BY u.id, u.name
ORDER BY total_deposits DESC;