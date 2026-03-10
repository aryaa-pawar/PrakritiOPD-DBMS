# PrakritiOPD – Panchakarma Clinic Management System

A **Database Management System (DBMS) project** designed to manage the operations of a Panchakarma outpatient clinic.
The system focuses on handling patient records, treatment plans, therapy sessions, inventory tracking, billing, and staff management using **MySQL relational database concepts**.

This project demonstrates the practical implementation of **database design, normalization, SQL queries, triggers, views, and stored procedures**.

---

# Project Objective

The objective of this project is to design and implement a structured database system that can efficiently manage the workflow of a Panchakarma clinic.

The system helps in:

• Managing patient records
• Scheduling therapy sessions
• Tracking treatment plans
• Managing medical inventory
• Handling billing and payments
• Monitoring staff and therapists

The database ensures **data integrity, efficient querying, and automation of business rules using triggers and procedures**.

---

# Technologies Used

**Database:** MySQL
**Query Language:** SQL
**Version Control:** Git & GitHub
**Database Concepts Implemented:**

• Entity Relationship (ER) Modeling
• Relational Schema Design
• Normalization
• SQL Queries
• Views
• Stored Procedures
• Triggers
• Constraints and Relationships

---

# Database Entities

The system consists of multiple entities representing different components of the clinic.

Main tables include:

• Patient
• Doctor
• Therapist
• Staff
• Receptionist
• Appointment
• Treatment_Plan
• Therapy
• Therapy_Session
• Package
• Package_Therapy
• Plan_Therapy
• Patient_Treatment_History
• Inventory_Item
• Inventory_Status
• Session_Inventory_Usage
• Bill
• Payment
• Doctor_Workload

These tables are connected using **primary keys and foreign keys** to maintain relational integrity.

---

# Key Features Implemented

## Patient Management

Stores patient information including personal details and treatment history.

## Appointment Scheduling

Allows scheduling and tracking of patient appointments with doctors.

## Treatment Planning

Doctors can create treatment plans which consist of multiple therapies.

## Therapy Session Tracking

Each therapy session performed by therapists is recorded and linked to treatment plans.

## Inventory Management

Tracks clinic inventory items such as oils, medicines, and consumables used during therapy sessions.

## Billing System

Automatically calculates treatment costs and generates patient bills.

## Payment Tracking

Records payments made by patients for their treatments.

---

# SQL Components Implemented

## Complex SQL Queries

The project includes **15 complex SQL queries** demonstrating:

• Joins between multiple tables
• Aggregation functions
• Grouping and filtering
• Subqueries
• Reporting queries

These queries help retrieve useful operational insights from the database.

---

## Views

Three views were implemented to simplify complex queries and improve data accessibility.

Examples include:

• Patient treatment overview
• Therapy session details
• Billing summary reports

Views help present filtered and structured data without modifying base tables.

---

## Stored Procedures

Two stored procedures were implemented to automate common operations.

Examples:

• Procedure to generate billing details
• Procedure to retrieve patient treatment records

Stored procedures improve **code reuse, security, and database efficiency**.

---

## Triggers

Two triggers were implemented to enforce business rules automatically.

### Inventory Validation Trigger

A **BEFORE INSERT trigger** on `Session_Inventory_Usage`:

• Checks if enough inventory is available
• Prevents negative stock
• Automatically deducts the used quantity

### Billing Trigger

A trigger on the `Bill` table ensures correct calculation of net payable amount and maintains billing consistency.

Triggers enforce **automatic data validation and business logic at the database level**.

---

# ER Diagram

The database structure is represented using an **Entity Relationship Diagram (ERD)** which shows:

• Entities
• Relationships
• Primary Keys
• Foreign Keys

The ER diagram is included in this repository as:

`ER.png`

---

# Repository Structure

```
PrakritiOPD-DBMS
│
├── schema.sql
├── data.sql
├── queries.sql
├── demo_queries.sql
├── views.sql
├── procedures.sql
├── triggers.sql
│
├── ER.png
│
└── Documentation.docx
```

---

# How to Run the Project

## Step 1 – Create Database

Open MySQL and create the database:

```sql
CREATE DATABASE PrakritiOPD;
USE PrakritiOPD;
```

---

## Step 2 – Create Tables

Run the schema file:

```sql
SOURCE schema.sql;
```

---

## Step 3 – Insert Sample Data

```sql
SOURCE data.sql;
```

---

## Step 4 – Add Views, Procedures, and Triggers

```sql
SOURCE views.sql;
SOURCE procedures.sql;
SOURCE triggers.sql;
```

---

## Step 5 – Run Queries

Test queries using:

```sql
SOURCE queries.sql;
```

or

```sql
SOURCE demo_queries.sql;
```

---

