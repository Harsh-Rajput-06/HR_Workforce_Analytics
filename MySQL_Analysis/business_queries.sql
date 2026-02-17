CREATE DATABASE hr_analytics;
USE hr_analytics;

SELECT COUNT(*) FROM employees;

DESCRIBE employees;

# Overall Attrition Rate
SELECT ROUND(AVG(attrition_flag)*100,2) AS attrition_rate FROM employees;

# Attrition Rate by Department
SELECT department,ROUND(AVG(attrition_flag)*100,2) AS attrition_rate
FROM employees
GROUP BY department
ORDER BY attrition_rate DESC;

# Attrition by Job Role
SELECT jobrole,ROUND(AVG(attrition_flag)*100,2) AS attrition_rate
FROM employees
GROUP BY jobrole
ORDER BY attrition_rate DESC;

# Overtime Impact
SELECT overtime,ROUND(AVG(attrition_flag)*100,2) AS attrition_rate
FROM employees
GROUP BY overtime;

# Average Salary of Employees Who Left
SELECT attrition,ROUND(AVG(monthlyincome)*100,2) AS avg_income
FROM employees
GROUP BY attrition;

# Tenure Risk Analysis
SELECT tenure_band,ROUND(AVG(attrition_flag)*100,2) AS attrition_rate
FROM employees
GROUP BY tenure_band
ORDER BY attrition_rate DESC;

# Rank Departments by Attrition
SELECT 
    department,
    ROUND(AVG(attrition_flag)*100,2) AS attrition_rate,
    RANK() OVER (ORDER BY AVG(attrition_flag) DESC) AS risk_rank
FROM employees
GROUP BY department;


