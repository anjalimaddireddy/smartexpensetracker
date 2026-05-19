# 💰 Smart Expense Tracker

A full-stack personal finance tracking system built using **MySQL, Python, and Streamlit**.  
It helps users record expenses, categorize spending, set budgets, and analyze financial patterns through an interactive dashboard.

---

## 📌 Project Overview

This project simulates a real-world expense management system where users can:
- Track daily expenses
- Categorize spending (Food, Travel, Shopping, etc.)
- Set monthly budgets
- Analyze spending behavior using SQL queries
- Visualize insights using a Streamlit dashboard

---

## 🧱 Tech Stack

- **Database:** MySQL
- **Backend Logic:** SQL (Joins, Aggregations, Procedures, Triggers)
- **Frontend Dashboard:** Streamlit
- **Data Processing:** Python (Pandas)
- **Visualization:** Streamlit Charts


---

## ⚙️ Features

### 📊 Expense Management
- Add and store daily expenses
- Categorize spending by type
- Track user-wise transactions

### 📈 Analytics
- Monthly spending analysis
- Category-wise expense breakdown
- Budget vs actual comparison

### 🔔 Advanced SQL Features
- Stored Procedures for adding expenses
- Triggers for budget alerts
- Window functions for ranking categories

### 📉 Dashboard
- Interactive Streamlit UI
- Summary metrics (Total, Average, Transactions)
- Charts for financial insights

---

## 🛠️ How to Run the Project

### 1. Clone Repository
```bash
git clone https://github.com/anjalimaddireddy/smart-expense-tracker.git

### 2. Setup Database

Run SQL files in order:

```bash
schema.sql
sample_data.sql
advanced_queries.sql
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Run Application

```bash
streamlit run app.py
```

---

## 📦 Requirements

```
streamlit
pandas
mysql-connector-python
```

---

## 📊 Sample Insights

* Highest spending category: Food / Travel
* Monthly spending trends visualization
* Budget vs actual comparison per category

---

## 🚀 Future Improvements

* AI-based spending predictions
* User login system
* Mobile-friendly dashboard
* Export reports (PDF/Excel)
* Notifications for overspending

---

