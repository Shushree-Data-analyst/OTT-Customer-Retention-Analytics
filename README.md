# 📺 OTT Customer Churn Analysis | End-to-End Data Analytics Project

## Overview
This project analyzes customer behavior across OTT platforms to understand churn patterns, identify revenue risks, and provide business recommendations to improve customer retention.

The project follows a complete analytics workflow:

**Python (EDA & Cleaning) → SQL (Business Queries) → Power BI (Dashboard & Insights)**

---

## Business Problem

OTT platforms lose customers frequently, impacting revenue and customer lifetime value.

The objective of this project is to:

- Identify factors contributing to customer churn.
- Understand customer behavior and subscription trends.
- Measure churn across plans and platforms.
- Provide actionable recommendations to improve retention and revenue.

---

## Dataset

- **3,000 customers**
- **17 features**
- Customer demographics
- Subscription plans
- Watch hours
- Payment failures
- Support tickets
- NPS scores
- Churn status

---

## Tech Stack

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn

- **SQL (MySQL)**
  - Aggregations
  - Group By
  - Window Functions
  - Subqueries

- **Power BI**
  - KPI Cards
  - Interactive Dashboard
  - Visual Analytics

---

## ETL Pipeline

### Extract
- Imported raw OTT customer dataset.

### Transform
- Data cleaning using Python:
  - Removed duplicates
  - Handled missing values
  - Corrected datatypes
  - Created cleaned dataset

### Load
- Loaded cleaned data into MySQL for analysis.
- Connected Power BI with SQL outputs for dashboard creation.

---

## Key Business Questions Solved

✔ What is the overall churn rate?

✔ Which subscription plans have the highest churn?

✔ Which platforms lose the most customers?

✔ Which cities contribute the most subscribers?

✔ Which plans generate maximum revenue?

✔ How do watch hours affect customer retention?

---

## Key Insights

### 1. High Customer Attrition
A significant percentage of customers leave the platform, indicating retention challenges.

### 2. Premium Plans Experience Higher Churn
Plans such as **Premium+, Free, Premium HD, Super, and Club & Cinema** show churn rates above **25%**, indicating pricing or value perception issues.

### 3. Customer Experience Impacts Retention
Low NPS scores and increased support tickets are associated with higher churn.

### 4. Engagement Matters
Customers with higher weekly watch hours tend to stay longer.

### 5. Revenue Concentration Risk
Revenue heavily depends on a limited number of subscription plans, increasing business risk if churn rises.

---

## Recommendations

### Improve Customer Retention Programs
- Personalized content recommendations.
- Loyalty rewards for long-tenure customers.
- Renewal discounts for high-risk users.

### Reduce Payment Failures
- Automatic payment reminders.
- Multiple payment options.

### Enhance Customer Support
- Faster ticket resolution.
- Proactive customer engagement.

### Increase User Engagement
- Content recommendations based on viewing behavior.
- Push notifications for new releases.

### Optimize Premium Plans
- Revisit pricing strategy.
- Bundle additional features to improve perceived value.

---

## Expected Business Impact

| Metric | Current | Target |
|----------|---------|---------|
| Churn Rate | ~22% | <18% |
| Customer Retention | 78% | 82-85% |
| Revenue Growth | Baseline | +10-15% |
| Payment Failure Loss | 100% | -20% |
| Customer Satisfaction (NPS) | Current | +15% |
| Customer Lifetime Value | Baseline | +12-18% |

---

## Project Structure

```
OTT_Customer_Churn_Analysis/
│
├── data/
│   ├── raw/
│   │     └── OTT_Churn.xlsx
│   ├── cleaned/
│   │     └── OTT_Cleaned_Data.csv
│
├── notebooks/
│   └── OTT Customer Churn Analysis.ipynb
│
├── sql_queries/
│   ├── Total Customers.sql
│   ├── Churn Rate.sql
│   ├── Revenue by Subscription Plan.sql
│   ├── Average Watch Hours.sql
│   ├── Top Cities by Subscribers.sql
│   └── Churn by Platform.sql
│
├── dashboard/
│   └── OTT Customer Churn Analysis Dashboard.pbix
│
├── images/
│   └── dashboard_screenshot.png
│
└── README.md
```

---

## Dashboard KPIs

- Total Customers
- Churn Rate
- Revenue by Subscription Plan
- Average Watch Hours
- Top Subscriber Cities
- Platform-wise Churn Analysis

---

## Outcome

This project demonstrates an end-to-end data analytics workflow, transforming raw customer data into actionable business insights that help OTT platforms reduce churn, improve retention, and increase revenue.
