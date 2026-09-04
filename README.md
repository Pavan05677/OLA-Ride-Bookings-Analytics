# 🚖 OLA Bengaluru Ride Bookings — End-to-End Data Analytics Project

An end-to-end data analytics project on OLA ride bookings in Bengaluru for **July 2024**, covering the full pipeline from raw data to a business-ready dashboard: **Excel (cleaning) → SQL (business queries) → Power BI (dashboard)**.

The goal was to analyze ride booking patterns, cancellations, revenue, and ratings to uncover insights that could help improve ride completion rates and customer experience.

---

## ❓ Problem Statement

OLA operates thousands of ride bookings daily across Bengaluru, but a large share of bookings never convert into a completed ride — they get canceled by the driver, canceled by the customer, or the driver simply isn't found. This directly hurts revenue, customer experience, and driver utilization, but the raw booking logs on their own don't make it clear **where** and **why** the drop-off is happening.

This project analyzes one month (July 2024) of OLA ride booking data to answer:

- What share of bookings actually succeed, and what share is lost to cancellations or "driver not found"?
- Who cancels more often — the driver or the customer — and what are the main reasons behind it?
- How does performance (booking value, distance, ratings) vary across vehicle types (Prime Sedan, Prime SUV, Prime Plus, Mini, Auto, Bike, E-Bike)?
- Which payment methods and customers drive the most revenue?
- Are driver and customer ratings consistent across vehicle types, or do some segments underperform?

The output is a clean dataset, a set of SQL views answering these business questions, and a Power BI dashboard that lets stakeholders explore booking status, revenue, cancellations, and ratings interactively — with the goal of identifying where OLA can act to reduce cancellations and improve the overall ride completion rate.

---

## 📌 Project Overview

- **Domain:** Ride-hailing / Mobility analytics
- **Dataset:** 71,201 ride bookings (1 July 2024 – 31 July 2024)
- **Total Booking Value:** ₹24M
- **Ride Success Rate:** 62.18%
- **Cancellation Rate:** 28.01%

The dataset simulates a real-world OLA operations log — booking status, vehicle type, pickup/drop locations, cancellation reasons, payment method, ride distance, and driver/customer ratings — and the project walks through cleaning it in Excel, answering business questions in SQL, and visualizing the results in an interactive Power BI dashboard.

---

## 🗂️ Repository Structure

```
├── Bookings.csv                     # Raw dataset (ride booking records)
├── OLA_booking_sql_project.sql      # SQL views answering 10 business questions
├── Ola_Booking_Dashboard.pbix       # Power BI dashboard (source file)
├── Ola_Booking_Dashboard.pdf        # Exported dashboard (static preview)
└── README.md
```

> Note: the raw CSV contains some blank padding rows in addition to the 71,201 valid booking records — these are filtered out during cleaning in Excel before analysis.

---

## 🧰 Tools & Tech Stack

| Stage              | Tool                  |
|--------------------|-----------------------|
| Data Cleaning      | Excel                 |
| Business Queries   | SQL (MySQL Workbench) |
| Dashboarding       | Power BI              |

---

## 📊 Dataset Description

Each row represents one ride booking with the following fields:

| Column | Description |
|---|---|
| `Date`, `Time` | Date and time of booking |
| `Booking_ID` | Unique ride booking identifier |
| `Booking_Status` | Success / Canceled by Driver / Canceled by Customer / Driver Not Found |
| `Customer_ID` | Unique customer identifier |
| `Vehicle_Type` | Prime Sedan, Prime SUV, Prime Plus, Mini, Auto, Bike, E-Bike |
| `Pickup_Location`, `Drop_Location` | Ride start and end points (Bengaluru areas) |
| `V_TAT`, `C_TAT` | Vehicle/Customer turnaround time |
| `Canceled_Rides_by_Customer`, `Canceled_Rides_by_Driver` | Cancellation reason (if applicable) |
| `Incomplete_Rides`, `Incomplete_Rides_Reason` | Incomplete ride flag and reason |
| `Booking_Value` | Fare value of the ride |
| `Payment_Method` | Cash, UPI, Credit Card, Debit Card |
| `Ride_Distance` | Distance travelled (km) |
| `Driver_Ratings`, `Customer_Rating` | Ratings given post-ride |

---

## 📑 Excel: Data Cleaning

Excel was used to:
- Load and inspect the raw booking data
- Handle nulls (e.g. cancellation/incomplete-ride fields that are only populated when relevant)
- Standardize data types (dates, ratings, distances)
- Filter out blank padding rows to arrive at the clean 71,201-record dataset
- Do a first-pass review of booking status, vehicle type, and revenue trends before moving to SQL and Power BI

---

## 🗄️ SQL: Business Questions

`OLA_booking_sql_project.sql` creates a view for each of the following 10 business questions and queries it:

1. Retrieve all successful bookings
2. Find the average ride distance for each vehicle type
3. Get the total number of rides canceled by drivers
4. List the top 5 customers by number of rides booked
5. Get the number of rides canceled by drivers due to personal & car-related issues
6. Find the maximum and minimum driver ratings for Prime Sedan bookings
7. Retrieve all rides paid for via UPI
8. Find the average customer rating per vehicle type
9. Calculate the total booking value of successfully completed rides
10. List all incomplete rides along with their reason

Each answer is implemented as a reusable SQL `VIEW` in MySQL, keeping the queries clean and easy to re-run.

---

## 📈 Power BI Dashboard

The dashboard (`Ola_Booking_Dashboard.pbix`) has 5 pages, all filterable by a date-range slicer:

### 1. Overall
<img width="1323" height="738" alt="overall" src="https://github.com/user-attachments/assets/9e80b5f7-4c10-49d2-960f-ad84a99b2c56" />

- Total Bookings: **71,201**
- Total Booking Value: **₹24M**
- Booking Status Breakdown: Success 62.18% · Canceled by Driver 17.88% · Canceled by Customer 10.13% · Driver Not Found 9.81%
- Ride volume trend over the month

### 2. Vehicle Type
<img width="1340" height="746" alt="Vehicle Type" src="https://github.com/user-attachments/assets/376890d0-5db1-48ec-a989-ea3c63a636f4" />

- Total & success booking value, average distance, and total distance travelled — broken down for Prime Sedan, Prime SUV, Prime Plus, Mini, Auto, Bike, and E-Bike
- Auto rides stand out with a much shorter average distance (~10 km) vs. ~25 km for the other vehicle types

### 3. Revenue
<img width="1335" height="746" alt="Revenue" src="https://github.com/user-attachments/assets/88ef87c3-e8c7-436c-b1cd-99a1b4aeca5c" />

- Revenue by payment method: **Cash** and **UPI** dominate, together accounting for the vast majority of booking value; Credit/Debit card usage is minimal
- Daily ride-distance trend across the month
- Top 5 customers by total booking value

### 4. Cancellation
<img width="1368" height="747" alt="Cancellation" src="https://github.com/user-attachments/assets/8e0ad5f7-e0a3-4952-9216-b775330db4ec" />

- Succeeded Bookings: **44,271** | Canceled Bookings: **19,942** | Cancellation Rate: **28.01%**
- Customer-side cancellations: mostly "Driver is not moving towards pickup" (29.96%) and "Driver asked to cancel" (25.66%)
- Driver-side cancellations: mostly "Personal & car related issues" (34.95%) and "Customer related issue" (29.48%)

### 5. Ratings
<img width="1345" height="752" alt="Ratings" src="https://github.com/user-attachments/assets/06730caf-d9fa-4e05-b454-fe86e87a12db" />

- Driver and customer ratings by vehicle type — all vehicle types cluster tightly around a **~4.0** average rating, indicating consistent service quality across the fleet

---

## 🔑 Key Insights

- Only **62%** of bookings complete successfully — cancellations (by driver + customer combined) and "driver not found" account for the rest, making cancellation reduction the biggest lever for improving completion rate.
- **Driver-side cancellations outnumber customer-side ones**, and are led by personal/vehicle issues — pointing to a driver-availability/vehicle-readiness problem rather than a pricing or customer-experience problem.
- **Cash and UPI** are the overwhelmingly preferred payment methods; card payments are negligible.
- Ratings are **stable across vehicle types** (~4.0 average), suggesting service quality is not a differentiator between segments.
- **Auto** rides are structurally different — much shorter average trip distance — useful for demand planning and pricing by vehicle type.

---

## 🚀 How to Use

1. **SQL:** Import `Bookings.csv` into a MySQL database named `ola`, then run `OLA_booking_sql_project.sql` to create the views and answer the business questions.
2. **Power BI:** Open `Ola_Booking_Dashboard.pbix` in Power BI Desktop to explore the interactive dashboard, or view `Ola_Booking_Dashboard.pdf` for a static preview.

---

## 👤 About the Author

**Pavan Hemant Patil**
Aspiring Data Analyst | B.Tech CSE (AI)
Skills: Excel · SQL · Power BI · Tableau · EDA
Certified Data Scientist (DataMites) | IABAC & Nasscom certified

Feel free to connect or reach out for feedback on this project!
