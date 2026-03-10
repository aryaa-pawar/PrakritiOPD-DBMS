CREATE DATABASE PrakritiOPD;
USE PrakritiOPD;

CREATE TABLE PATIENT (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male','Female','Other') NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Address TEXT
);

CREATE TABLE STAFF (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Role_Type ENUM('Doctor','Therapist','Receptionist') NOT NULL,
    Contact_Number VARCHAR(15) UNIQUE,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    Availability_Status ENUM('Available','On Leave') DEFAULT 'Available'
);

CREATE TABLE DOCTOR (
    Staff_ID INT PRIMARY KEY,
    Qualification VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Experience INT CHECK (Experience >= 0),
    Consultation_Fee DECIMAL(10,2) CHECK (Consultation_Fee >= 0),
    FOREIGN KEY (Staff_ID) REFERENCES STAFF(Staff_ID) ON DELETE CASCADE
);

CREATE TABLE THERAPIST (
    Staff_ID INT PRIMARY KEY,
    Certification VARCHAR(100),
    Expertise_Level VARCHAR(50),
    FOREIGN KEY (Staff_ID) REFERENCES STAFF(Staff_ID) ON DELETE CASCADE
);

CREATE TABLE RECEPTIONIST (
    Staff_ID INT PRIMARY KEY,
    Shift_Timing VARCHAR(50),
    FOREIGN KEY (Staff_ID) REFERENCES STAFF(Staff_ID) ON DELETE CASCADE
);

CREATE TABLE THERAPY (
    Therapy_ID INT AUTO_INCREMENT PRIMARY KEY,
    Therapy_Name VARCHAR(100) NOT NULL UNIQUE,
    Category VARCHAR(100),
    Duration_Minutes INT NOT NULL CHECK (Duration_Minutes > 0),
    Cost DECIMAL(10,2) NOT NULL CHECK (Cost >= 0),
    Description TEXT
);

CREATE TABLE PACKAGE (
    Package_ID INT AUTO_INCREMENT PRIMARY KEY,
    Package_Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT,
    Package_Price DECIMAL(10,2)
);

CREATE TABLE PACKAGE_THERAPY (
    Package_ID INT,
    Therapy_ID INT,
    PRIMARY KEY (Package_ID, Therapy_ID),
    FOREIGN KEY (Package_ID) REFERENCES PACKAGE(Package_ID) ON DELETE CASCADE,
    FOREIGN KEY (Therapy_ID) REFERENCES THERAPY(Therapy_ID) ON DELETE CASCADE
);

CREATE TABLE TREATMENT_PLAN (
    Plan_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Package_ID INT,
    Diagnosis TEXT,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Plan_Status ENUM('Active','Completed','Cancelled') DEFAULT 'Active',
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Staff_ID),
    FOREIGN KEY (Package_ID) REFERENCES PACKAGE(Package_ID)
);

CREATE TABLE PLAN_THERAPY (
    Plan_ID INT,
    Therapy_ID INT,
    Frequency INT,
    Notes TEXT,
    PRIMARY KEY (Plan_ID, Therapy_ID),
    FOREIGN KEY (Plan_ID) REFERENCES TREATMENT_PLAN(Plan_ID) ON DELETE CASCADE,
    FOREIGN KEY (Therapy_ID) REFERENCES THERAPY(Therapy_ID) ON DELETE CASCADE
);

CREATE TABLE APPOINTMENT (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    Appointment_Type VARCHAR(50),
    Status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Staff_ID)
);

CREATE TABLE INVENTORY_ITEM (
    Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_Name VARCHAR(100) UNIQUE,
    Category VARCHAR(100),
    Quantity_In_Stock DECIMAL(10,2),
    Unit VARCHAR(20),
    Cost_Per_Unit DECIMAL(10,2)
);

CREATE TABLE THERAPY_SESSION (
    Session_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_ID INT,
    Therapy_ID INT,
    Therapist_ID INT,
    Session_Date DATE,
    Start_Time TIME,
    End_Time TIME,
    Session_Status ENUM('Scheduled','Completed','Missed') DEFAULT 'Scheduled',
    Session_Notes VARCHAR(255),
    FOREIGN KEY (Plan_ID) REFERENCES TREATMENT_PLAN(Plan_ID),
    FOREIGN KEY (Therapy_ID) REFERENCES THERAPY(Therapy_ID),
    FOREIGN KEY (Therapist_ID) REFERENCES STAFF(Staff_ID)
);

CREATE TABLE SESSION_INVENTORY_USAGE (
    Usage_ID INT AUTO_INCREMENT PRIMARY KEY,
    Session_ID INT,
    Item_ID INT,
    Quantity_Used DECIMAL(10,2),
    FOREIGN KEY (Session_ID) REFERENCES THERAPY_SESSION(Session_ID),
    FOREIGN KEY (Item_ID) REFERENCES INVENTORY_ITEM(Item_ID)
);

CREATE TABLE BILL (
    Bill_ID INT AUTO_INCREMENT PRIMARY KEY,
    Plan_ID INT,
    Bill_Date DATE,
    Total_Amount DECIMAL(10,2),
    Tax DECIMAL(10,2),
    Discount DECIMAL(10,2),
    Net_Amount DECIMAL(10,2),
    FOREIGN KEY (Plan_ID) REFERENCES TREATMENT_PLAN(Plan_ID)
);

CREATE TABLE PAYMENT (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Bill_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Mode ENUM('Cash','Card','UPI','Online'),
    Transaction_Reference VARCHAR(100),
    FOREIGN KEY (Bill_ID) REFERENCES BILL(Bill_ID) ON DELETE CASCADE
);