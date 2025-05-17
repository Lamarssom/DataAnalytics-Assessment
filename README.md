# SQL Technical Assessment – Customer and Transaction Analytics

This repository contains my solutions to a 4-part SQL assessment focused on customer behavior, savings, investment patterns, and lifetime value analytics within a financial services context.

Each solution is designed to be scalable, clear, and optimized for performance across common use cases in a financial analytics pipeline.

## File Structure

- `Assessment_Q1.sql` – *Customer Summary Report*  
  Generates a summary of each customer's total confirmed deposits, number of savings plans, and investment products.

- `Assessment_Q2.sql` – *Transaction Frequency Analysis*  
  Categorizes users by transaction activity (High, Medium, Low frequency) and calculates average transactions per month.
`
- `Assessment_Q3.sql` – *Account Inactivity Alert*  
  Identifies savings or investment accounts with no inflow activity in the last 365 days.

- `Assessment_Q4.sql` – *Customer Lifetime Value (CLV) Estimation*  
  Estimates customer lifetime value using tenure, transaction volume, and a simplified profit-per-transaction model.

## How to Run

1. Ensure your MySQL environment is connected to a database with the following tables:
   - `users_customuser`
   - `savings_savingsaccount`
   - `plans_plan`

2. Open each `.sql` file in your preferred SQL IDE (e.g., VS Code with SQL extensions, MySQL Workbench).

3. Execute the queries sequentially or individually depending on the question.

4. Review output in tabular format as per the structure provided in the assessment prompt.

## Key Assumptions

- All monetary values are in *Kobo*, converted to Naira where appropriate for clarity in output.
- Confirmed inflows (`confirmed_amount`) are used to calculate deposits and transactions.
- Tenure is calculated from the user’s `date_joined` to current date.
- CLV is simplified: `(total_transactions / tenure_in_months) * 12 * avg_profit_per_transaction`,with a fixed 0.1% profit rate.

## About the Candidate

Prepared and submitted by: *Godwin Gbarabe*

This project demonstrates a solid grasp of SQL, data transformation, and reporting techniques for practical financial applications. I approached each question with attention to scalability, accuracy, and real-world relevance. 

Thank you for the opportunity.