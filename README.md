# 📺 OTT Customer Churn Analysis
### Python · SQL · Power BI · EDA · Feature Engineering

<br>

> **"22.47% of subscribers are leaving — this project finds out exactly who, why, and what to do about it."**

<br>

![Python](https://img.shields.io/badge/Python-3.10-blue?style=flat-square&logo=python)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?style=flat-square&logo=mysql)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-yellow?style=flat-square&logo=powerbi)
![Pandas](https://img.shields.io/badge/Pandas-EDA-lightblue?style=flat-square&logo=pandas)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)

---

## 📌 Table of Contents

- [Business Problem](#-business-problem)
- [Project Objective](#-project-objective)
- [Tech Stack](#-tech-stack)
- [Dataset Overview](#-dataset-overview)
- [Project Architecture](#-project-architecture)
- [What I Did](#-what-i-did)
- [Key Metrics & KPIs](#-key-metrics--kpis)
- [Insights Found](#-insights-found)
- [Business Impact](#-business-impact)
- [Recommendations](#-business-recommendations)
- [Folder Structure](#-folder-structure)
- [How to Run](#-how-to-run)

---

## 🔴 Business Problem

India's OTT (Over-The-Top) streaming market is one of the most competitive digital spaces in the world — with 10+ platforms battling for the same subscriber. Every lost customer is not just a number; it is recurring monthly revenue walking out the door permanently.

Despite having rich subscriber data, platforms typically have **no early warning system** for churn. Retention efforts are reactive — triggered only after the customer has already cancelled. The business had no answer to three fundamental questions:

- **Who** is most likely to churn next?
- **Why** are customers leaving — is it price, content, platform, or experience?
- **When** does churn happen — and can we catch it before it does?

Without data-backed answers, retention budgets get wasted on broad, untargeted campaigns with minimal ROI.

---

## 🎯 Project Objective

Build an end-to-end data analytics solution that:

1. Cleans and prepares raw subscriber data for analysis
2. Performs deep exploratory analysis to surface churn drivers
3. Extracts business metrics through structured SQL queries
4. Visualises findings in a Power BI dashboard for stakeholder consumption
5. Delivers specific, data-backed recommendations to reduce churn

---

## 🛠 Tech Stack

| Tool / Library | Purpose |
|---|---|
| **Python** | Core language for data processing and EDA |
| **Pandas** | Data loading, cleaning, transformation |
| **NumPy** | Numerical operations and corrections |
| **Matplotlib & Seaborn** | EDA visualisations (countplots, boxplots) |
| **MySQL** | Business metric extraction via SQL queries |
| **SQLAlchemy** | ORM connector — Pandas DataFrame → MySQL |
| **Power BI** | Executive dashboard and storytelling |
| **Jupyter Notebook** | Analysis environment |

---

## 📦 Dataset Overview

| Attribute | Value |
|---|---|
| **Total Records** | 3,000 subscribers |
| **Features** | 17 columns |
| **Platforms** | 10 OTT platforms |
| **Geography** | 20+ Indian cities |
| **Target Variable** | `churned` (Yes / No → 1 / 0) |

**Features include:** `customer_id`, `platform`, `subscription_plan`, `city`, `age_group`, `primary_device`, `fav_genre`, `payment_method`, `tenure_months`, `monthly_charge_inr`, `avg_watch_hrs_week`, `num_profiles`, `login_failures`, `payment_failures`, `support_tickets`, `nps_score`, `churned`

---

## 🏗 Project Architecture

```
Raw Excel Data (OTT_Churn.xlsx)
        │
        ▼
┌──────────────────────┐
│  Python / Pandas     │  ← Data Cleaning, Feature Engineering, EDA
│  Jupyter Notebook    │
└──────────┬───────────┘
           │  SQLAlchemy (to_sql)
           ▼
┌──────────────────────┐
│  MySQL Database      │  ← Business SQL Queries (8 queries)
│  ott_churn_db        │
└──────────┬───────────┘
           │  Cleaned CSV Export
           ▼
┌──────────────────────┐
│  Power BI Dashboard  │  ← Executive Visualisation
└──────────────────────┘
```

---

## 🔧 What I Did

### Phase 1 — Data Cleaning & Feature Engineering

The raw dataset had several quality issues that needed resolving before any analysis:

**Missing Value Treatment**
- `city` → filled with **mode** (most frequent city) — appropriate for categorical data
- `monthly_charge_inr` → filled with **median** — median chosen over mean to avoid distortion from high-end plan outliers
- `nps_score` → filled with **median** — same rationale; NPS is right-skewed

**Outlier Correction**
- `avg_watch_hrs_week` contained **negative values** due to data entry errors
- Applied `abs()` transformation to recover the actual engagement magnitude without data loss

**Data Standardisation**
- All column names lowercased using `.str.lower()` for consistent downstream querying
- Removed duplicate rows using `drop_duplicates()`
- Encoded target variable: `churned` mapped `Yes → 1`, `No → 0` for numerical analysis

**Concepts Applied:** Data Pipeline, Feature Engineering, Imputation Strategy, Outlier Detection, Binary Encoding

---

### Phase 2 — Exploratory Data Analysis (EDA)

Performed both **univariate** and **bivariate** analysis to understand churn patterns:

| Analysis | Visualisation | Purpose |
|---|---|---|
| Churn Distribution | Countplot | Class balance check |
| Churn by Device Type | Countplot + Hue | Device-level segmentation |
| Churn by Payment Method | Countplot + Hue | Payment friction analysis |
| NPS Score vs Churn | Boxplot | Satisfaction divergence |
| Churn by Age Group | Countplot + Hue | Demographic targeting |
| Monthly Charge Outliers | Boxplot | Pricing anomaly detection |

---

### Phase 3 — SQL Business Analytics

Cleaned data pushed to **MySQL** (`ott_churn_db`) via **SQLAlchemy**. Eight targeted SQL queries written to answer specific business questions:

```sql
-- Overall churn rate
SELECT ROUND(AVG(churned) * 100, 2) AS churn_rate FROM ott_customer_churn;

-- Platform-wise churn ranking
SELECT platform, ROUND(AVG(churned) * 100, 2) AS churn_rate
FROM ott_customer_churn
GROUP BY platform ORDER BY churn_rate DESC;

-- Subscription plan churn
SELECT subscription_plan, ROUND(AVG(churned) * 100, 2) AS churn_rate
FROM ott_customer_churn
GROUP BY subscription_plan ORDER BY churn_rate DESC;

-- Revenue by subscription plan
SELECT subscription_plan, SUM(monthly_charge_inr) AS total_revenue
FROM ott_customer_churn
GROUP BY subscription_plan ORDER BY total_revenue DESC;

-- Top cities by subscriber count
SELECT city, COUNT(*) AS total_customers
FROM ott_customer_churn
GROUP BY city ORDER BY total_customers DESC LIMIT 10;

-- Average weekly engagement
SELECT ROUND(AVG(avg_watch_hrs_week), 2) AS avg_watch_hours
FROM ott_customer_churn;
```

---

### Phase 4 — Power BI Dashboard

Loaded the cleaned CSV into Power BI to build an **executive-level dashboard** featuring:
- Churn rate KPI card (22.47%)
- Platform-wise and plan-wise churn bar charts
- Geographic subscriber distribution map
- NPS score distribution slicer
- Revenue breakdown by subscription plan

---

## 📊 Key Metrics & KPIs

| Metric | Value |
|---|---|
| 📉 Overall Churn Rate | **22.47%** (674 of 3,000 customers) |
| 💸 Monthly Revenue at Risk | **INR 1,96,943** |
| 📅 Annualised Revenue Risk | **~INR 23.6 Lakhs/year** |
| 💰 Total Monthly Revenue Base | **INR 9,02,481** |
| 🔴 Revenue % Lost to Churn | **21.8%** |
| ⭐ NPS — Retained Customers | **5.33 / 10** |
| ⭐ NPS — Churned Customers | **3.64 / 10** (31.7% lower) |
| 📺 Avg Watch Hours — Retained | **13.02 hrs/week** |
| 📺 Avg Watch Hours — Churned | **11.10 hrs/week** (−14.7%) |
| 🕐 Avg Tenure — Retained | **25.35 months** |
| 🕐 Avg Tenure — Churned | **22.21 months** (−12.4%) |
| 💳 Avg Payment Failures — Churned | **2.36** vs 1.90 retained |
| 🔑 Avg Login Failures — Churned | **3.18** vs 2.93 retained |

---

## 💡 Insights Found

### 🔵 Platform-Level Churn

| Platform | Churn Rate | Signal |
|---|---|---|
| ZEE5 | ~31.58% | Highest — also has data quality/casing issues |
| MX Player | 26.15% | High — engagement & content concerns |
| Hotstar | 25.08% | Pricing sensitivity |
| JioCinema | 23.21% | Near average |
| SonyLIV | 22.90% | Near average |
| Netflix India | 19.66% | Below average — content stickiness |
| Prime Video India | 20.00% | Below average — ecosystem lock-in |
| ShemarooMe | 18.98% | Lowest churn among major platforms |

> **Note:** ZEE5 appears as both "ZEE5" and "Zee5" in the data — a data governance gap inflating churn figures.

---

### 🟠 Subscription Plan Churn

| Plan | Churn Rate | Revenue (Monthly) |
|---|---|---|
| Premium+ | 28.26% | INR 27,308 |
| Free | 27.40% | INR 4,975 |
| Premium | 22.98% | **INR 1,89,017** (highest) |
| Annual | 20.00% | INR 1,44,700 |
| Premium 4K | 22.15% | INR 1,38,542 |
| Basic | **14.10%** (lowest) | INR 15,522 |
| MX Gold | 17.04% | INR 13,865 |

> **Premium, Annual, and Premium 4K** together generate INR 4,72,259/month — **52% of total revenue**. These are the highest-priority retention cohorts.

---

### 🟢 Demographic & Device Insights

**By Age Group:**
- 26–35 years → **26.38% churn** (highest — core earning demographic)
- 36–45 years → **25.46% churn**
- 18–25 years → **20.77% churn**
- 55+ years → **19.94% churn** (lowest — most loyal)

**By Primary Device:**
- Tablet → **23.47%** (highest)
- Smart TV → **23.31%**
- Mobile → **20.70%** (lowest — habitual, accessible usage)

**By Payment Method:**
- Debit Card → **24.39%** (highest — auto-renewal friction)
- Net Banking → **20.67%** (lowest — deliberate, sticky)

---

### 🟡 Engagement & Friction Signals

- Churned users watch **~1.92 fewer hours/week** — a measurable early warning signal
- Churned users have **3.1 fewer months of tenure** — newer subscribers are more vulnerable
- **Payment failures** clearly differentiate churners (2.36 vs 1.90) — involuntary churn signal
- **Support tickets** are nearly identical for churned vs retained (2.41 vs 2.44) — support interaction alone is not a churn predictor

---

### 📍 Geographic Insight (SQL)

Top cities by subscriber count:

| City | Subscribers |
|---|---|
| Pune | 384 |
| Jaipur | 244 |
| Nagpur | 242 |
| Surat | 237 |
| Delhi | 232 |
| Bengaluru | 229 |

> Pune dominates with 384 subscribers — 28% more than the next city. Tier-1 metros are evenly distributed at 220–232 each.

---

## 📈 Business Impact

This analysis converts churn from a **lagging metric** (noticed after cancellation) into a **leading signal** that can be acted on before revenue is lost.

| Impact Area | Before This Analysis | After This Analysis |
|---|---|---|
| Churn visibility | Noticed after it happened | Predictable by segment |
| Retention targeting | Broad, untargeted campaigns | Precision by platform, plan, age, device |
| Revenue risk | Unknown | Quantified at INR 1,96,943/month |
| Engagement monitoring | No threshold | Watch-hour drop as early warning |
| Payment friction | Not tracked | 2.36 avg failures flags churners |
| Satisfaction signal | NPS collected but unused | 3.64 vs 5.33 gap — actionable trigger |
| Data infrastructure | Siloed in Excel | Live pipeline: Excel → Python → MySQL → Power BI |

---

## ✅ Business Recommendations

### R1 — Watch-Hour Early Warning System
Set automated alerts when weekly watch time drops below **8 hrs/week for 2 consecutive weeks** (vs 12–13 hr platform average). Trigger personalised content recommendation or discount offer.
> **Projected Impact:** 15–20% reduction in churn among at-risk users

### R2 — Tier-Specific Retention Budgets
Allocate disproportionately more retention spend on **Premium, Annual, and Premium 4K** subscribers — who contribute 52% of total monthly revenue. A 5% churn reduction in this segment alone saves **INR 23,600/month** (INR 2.83 Lakhs/year).

### R3 — Fix the Premium+ Value Gap
Premium+ has the highest paid-plan churn at **28.26%**. Audit the price-value equation: add exclusive content, early access features, or loyalty perks. Consider a "Premium+ Lite" option to reduce downgrade-to-free behaviour.

### R4 — NPS-Triggered Intervention Workflow
Users scoring **NPS ≤ 4** should enter a customer success workflow within 48 hours. Given the 31.7% NPS gap between churned and retained users, proactive outreach on low-NPS users is a high-ROI retention lever.

### R5 — Payment Failure Recovery Automation
Build an automated retry + communication workflow for subscribers with **2+ payment failures**: 7-day grace period with in-app notification, SMS, and email — reducing involuntary churn from billing friction.

### R6 — Focus on the 26–45 Age Cohort
The 26–35 (26.38%) and 36–45 (25.46%) segments are the highest-risk demographics and also the highest-spending audience. Tailor content (web series, family plans, originals) and pricing bundles for this cohort.

### R7 — Tablet & Smart TV UX Overhaul
Tablet (23.47%) and Smart TV (23.31%) users churn most by device. Mirror mobile UX patterns (the lowest churn device at 20.70%) in larger-screen experiences — improved content discovery, faster load times, remote-friendly UI.

### R8 — Data Governance: Standardise Platform Names
Implement a validation layer to normalise platform names at ingestion (e.g., "ZEE5", "Zee5" → "Zee5"). Current inconsistency inflates churn metrics and undermines reporting accuracy.

---

### 📊 Projected Impact if Recommendations Applied

| Recommendation | Target | Est. Monthly Saving |
|---|---|---|
| Watch-hour early warning | Churn 22.47% → 18% | INR 40,000–65,000 |
| Premium segment retention (+8%) | Retain 8% more premium users | INR 15,000–25,000 |
| Payment recovery automation | Failures 2.36 → <1.5 | INR 10,000–20,000 |
| NPS intervention workflow | NPS 4.95 → 6.0+ | Passive churn reduced |
| **Combined (conservative)** | **Churn ~16–18%** | **INR 58,000–1,10,000/month** |

> **Annual Revenue Recovery Potential: INR 7–12 Lakhs/year** from a data infrastructure that is already built.

---

## 📁 Folder Structure

```
OTT_Churn/
│
├── 📓 OTT Customer Churn Analysis — Python & EDA.ipynb   # Main notebook
├── 📊 OTT Customer Churn Analysis Dashboard.pbix          # Power BI dashboard
│
├── ott_queries/
│   ├── Create database.sql
│   ├── Total Customers.sql
│   ├── Churned Rate.sql
│   ├── Churn by Platform.sql
│   ├── Churn by Subscription Plan.sql
│   ├── Revenue by Subscription Plan.sql
│   ├── Top Cities by Subscribers.sql
│   └── Average Watch Hours.sql
│
└── Row & Cleaning_data/
    ├── OTT_Churn.xlsx              # Raw dataset
    └── OTT_Cleaned_Data.csv        # Cleaned & processed data
```

---

## ▶️ How to Run

### Prerequisites
```bash
pip install pandas numpy matplotlib seaborn sqlalchemy pymysql openpyxl
```

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/your-username/OTT-Churn-Analysis.git
cd OTT-Churn-Analysis
```

**2. Run the Jupyter Notebook**
```bash
jupyter notebook "OTT Customer Churn Analysis — Python & EDA.ipynb"
```

**3. Set up MySQL**
```bash
mysql -u root -p
```
```sql
CREATE DATABASE ott_churn_db;
```
Update the SQLAlchemy connection string in the notebook:
```python
engine = create_engine('mysql+pymysql://root:your_password@localhost:3306/ott_churn_db')
```

**4. Run SQL Queries**

Execute the `.sql` files in `ott_queries/` in this order:
1. `Create database.sql`
2. `Total Customers.sql`
3. `Churned Rate.sql`
4. `Churn by Platform.sql`
5. `Churn by Subscription Plan.sql`
6. `Revenue by Subscription Plan.sql`
7. `Top Cities by Subscribers.sql`
8. `Average Watch Hours.sql`

**5. Open Power BI Dashboard**

Open `OTT Customer Churn Analysis Dashboard.pbix` in Power BI Desktop and refresh the data source to point to `OTT_Cleaned_Data.csv`.

---

## 🧠 Concepts & Skills Demonstrated

| Concept | Application in This Project |
|---|---|
| **Data Pipeline (ETL)** | Excel → Pandas → MySQL → Power BI |
| **Feature Engineering** | `abs()` correction, binary encoding, column normalisation |
| **Imputation Strategy** | Mode for categorical; Median for skewed numerics |
| **Outlier Detection & Treatment** | Boxplot analysis + transformation |
| **Univariate EDA** | Churn distribution, class balance check |
| **Bivariate EDA** | Hue-based countplots, NPS boxplot by churn |
| **SQL Aggregation** | `GROUP BY`, `AVG()`, `SUM()`, `COUNT()`, `ORDER BY`, `LIMIT` |
| **Database Integration** | SQLAlchemy ORM, `to_sql()` push |
| **Churn Rate Computation** | `AVG(binary_flag) × 100` method |
| **Segment Analysis** | Multi-dimensional slicing across 6 variables |
| **Business Intelligence** | Power BI KPIs, slicers, bar charts, maps |
| **Storytelling with Data** | Insights translated to INR revenue impact |

---

## 👩‍💻 About the Author

**Shushree Swain**  
Aspiring Data Analyst | Python · SQL · Power BI · EDA


---
