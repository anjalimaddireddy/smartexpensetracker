import streamlit as st
import pandas as pd
import mysql.connector

# ----------------- PAGE CONFIG -----------------
st.set_page_config(page_title="Expense Tracker", layout="wide")

# ----------------- DB CONNECTION -----------------
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="expense_db"
)

# ----------------- SIDEBAR -----------------
st.sidebar.title("💰 Expense Tracker")
menu = st.sidebar.radio("Navigate", ["Dashboard", "Analytics"])

# ----------------- LOAD DATA -----------------
df = pd.read_sql("SELECT * FROM Expenses", conn)

df['expense_date'] = pd.to_datetime(df['expense_date'])
df['month'] = df['expense_date'].dt.month

# ----------------- DASHBOARD -----------------
if menu == "Dashboard":

    st.title("📊 Smart Expense Dashboard")

    total_spent = df['amount'].sum()
    avg_spent = df['amount'].mean()

    col1, col2, col3 = st.columns(3)

    col1.metric("Total Spent", f"₹ {total_spent}")
    col2.metric("Average Expense", f"₹ {round(avg_spent,2)}")
    col3.metric("Transactions", len(df))

    st.markdown("---")

    st.subheader("🧾 Recent Expenses")
    st.dataframe(df.sort_values("expense_date", ascending=False))

# ----------------- ANALYTICS -----------------
elif menu == "Analytics":

    st.title("📈 Spending Analytics")

    # Monthly spending
    monthly = df.groupby('month')['amount'].sum().reset_index()

    st.subheader("Monthly Spending")
    st.line_chart(monthly.set_index('month'))

    # Category spending
    cat_query = """
    SELECT c.category_name, SUM(e.amount) as total
    FROM Expenses e
    JOIN Categories c ON e.category_id = c.category_id
    GROUP BY c.category_name
    """
    cat_df = pd.read_sql(cat_query, conn)

    st.subheader("Category-wise Spending")
    st.bar_chart(cat_df.set_index('category_name'))

    # Budget comparison
    budget_query = """
    SELECT c.category_name, b.budget_amount, COALESCE(SUM(e.amount),0) as spent
    FROM Budgets b
    JOIN Categories c ON b.category_id = c.category_id
    LEFT JOIN Expenses e ON b.category_id = e.category_id
    GROUP BY c.category_name, b.budget_amount
    """
    budget_df = pd.read_sql(budget_query, conn)

    st.subheader("Budget vs Spending")
    st.dataframe(budget_df)

conn.close()