# 📊 E-commerce Sales Data Project

This project sets up a MySQL database schema for analyzing e-commerce sales trends.

## 🗂️ Contents

- `create_sales_dataset.sql` – Script to create a database and table.

## 🧠 Table Structure

| Column Name   | Data Type      | Description                      |
|---------------|----------------|----------------------------------|
| order_id      | VARCHAR(15)    | Unique ID for each order         |
| order_date    | DATE           | Order placement date             |
| ship_date     | DATE           | Shipping date                    |
| ship_mode     | VARCHAR(14)    | Shipping mode                    |
| customer_name | VARCHAR(22)    | Customer’s name                  |
| segment       | VARCHAR(11)    | Customer segment                 |
| state         | VARCHAR(36)    | State of delivery                |
| country       | VARCHAR(32)    | Country of delivery              |
| market        | VARCHAR(6)     | Market category                  |
| region        | VARCHAR(14)    | Region of the country            |
| product_id    | VARCHAR(16)    | Product ID                       |
| category      | VARCHAR(15)    | Product category                 |

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-sales-data-project.git
