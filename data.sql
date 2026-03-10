USE PrakritiOPD;

-- STAFF
INSERT INTO STAFF (First_Name, Last_Name, Role_Type, Contact_Number, Salary) VALUES
('Drishti','Sharma','Doctor','9876500001',80000),
('Aarav','Kulkarni','Doctor','9876500002',85000),
('Veda','Iyer','Doctor','9876500003',90000),
('Tanmay','Joshi','Therapist','9876500004',35000),
('Ishani','Deshpande','Therapist','9876500005',37000),
('Ritvik','Nair','Therapist','9876500006',36000),
('Meera','Patwardhan','Receptionist','9876500007',25000),
('Anaya','Menon','Receptionist','9876500008',26000);


-- DOCTORS

INSERT INTO DOCTOR VALUES
(1,'MD Ayurveda','Panchakarma Specialist',12,800),
(2,'BAMS','Detox Specialist',8,700),
(3,'MD Ayurveda','Rejuvenation Expert',15,900);


-- THERAPISTS

INSERT INTO THERAPIST VALUES
(4,'Certified Panchakarma Therapist','Senior'),
(5,'Kerala Panchakarma Certified','Intermediate'),
(6,'Ayurvedic Therapy Diploma','Senior');

-- RECEPTIONISTS
INSERT INTO RECEPTIONIST VALUES
(7,'Morning Shift'),
(8,'Evening Shift');


-- PATIENTS

INSERT INTO PATIENT 
(First_Name,Last_Name,DOB,Gender,Contact_Number,Email,Address)
VALUES
('Riya','Patil','1998-05-14','Female','9876511111','riya@email.com','Pune'),
('Aditya','Sharma','1995-08-10','Male','9876511112','adi@email.com','Mumbai'),
('Sneha','Joshi','2000-02-20','Female','9876511113','sneha@email.com','Pune'),
('Rahul','Mehta','1993-11-01','Male','9876511114','rahul@email.com','Nashik'),
('Neha','Kulkarni','1999-09-12','Female','9876511115','neha@email.com','Pune'),
('Arjun','Reddy','1996-06-30','Male','9876511116','arjun@email.com','Hyderabad'),
('Pooja','Iyer','1997-01-18','Female','9876511117','pooja@email.com','Chennai'),
('Kabir','Singh','1994-07-22','Male','9876511118','kabir@email.com','Delhi');


-- THERAPIES

INSERT INTO THERAPY 
(Therapy_Name,Category,Duration_Minutes,Cost,Description)
VALUES
('Abhyanga','Massage',60,1500,'Full body oil massage'),
('Shirodhara','Relaxation',45,2000,'Oil poured on forehead'),
('Panchakarma Detox','Detox',90,3500,'Deep detox therapy'),
('Herbal Steam','Steam',30,800,'Herbal steam bath'),
('Kati Basti','Back Therapy',40,1200,'Back pain treatment'),
('Nasya','Nasal Therapy',20,900,'Nasal detox therapy');


-- PACKAGES
INSERT INTO PACKAGE 
(Package_Name,Description,Package_Price)
VALUES
('Basic Detox','3 day detox therapy',5000),
('Stress Relief','Relaxation therapies',6000),
('Rejuvenation Package','Full rejuvenation plan',9000);

-- PACKAGE THERAPIES

INSERT INTO PACKAGE_THERAPY VALUES
(1,3),
(1,4),
(2,1),
(2,2),
(3,1),
(3,2),
(3,5),
(3,6);

-- INVENTORY ITEMS
INSERT INTO INVENTORY_ITEM
(Item_Name,Category,Quantity_In_Stock,Unit,Cost_Per_Unit)
VALUES
('Sesame Oil','Oil',100,'Liters',500),
('Herbal Powder','Herb',50,'Kg',700),
('Steam Herbs','Herb',40,'Kg',600),
('Cotton Towels','Utility',200,'Pieces',50),
('Medicinal Oil','Oil',80,'Liters',900);

-- TREATMENT PLANS

INSERT INTO TREATMENT_PLAN
(Patient_ID,Doctor_ID,Package_ID,Diagnosis,Start_Date,End_Date)
VALUES
(1,1,1,'Body detox','2026-03-01','2026-03-05'),
(2,2,2,'Stress and anxiety','2026-03-02','2026-03-06'),
(3,3,3,'Chronic back pain','2026-03-03','2026-03-08'),
(4,1,2,'Sleep disorder','2026-03-04','2026-03-07'),
(5,2,1,'Digestive issues','2026-03-05','2026-03-09');


-- PLAN THERAPIES
INSERT INTO PLAN_THERAPY VALUES
(1,3,3,'Detox sessions'),
(1,4,2,'Steam therapy'),
(2,1,3,'Massage therapy'),
(2,2,2,'Relaxation therapy'),
(3,5,4,'Back therapy'),
(3,6,3,'Nasal therapy');


-- APPOINTMENTS

INSERT INTO APPOINTMENT
(Patient_ID,Doctor_ID,Appointment_Date,Appointment_Time,Appointment_Type)
VALUES
(1,1,'2026-03-01','10:00:00','Consultation'),
(2,2,'2026-03-02','11:30:00','Follow-up'),
(3,3,'2026-03-03','09:30:00','Consultation'),
(4,1,'2026-03-04','14:00:00','Consultation'),
(5,2,'2026-03-05','15:00:00','Follow-up');

-- THERAPY SESSIONS
INSERT INTO THERAPY_SESSION
(Plan_ID,Therapy_ID,Therapist_ID,Session_Date,Start_Time,End_Time)
VALUES
(1,3,4,'2026-03-01','10:00:00','11:30:00'),
(1,4,5,'2026-03-02','10:30:00','11:00:00'),
(2,1,4,'2026-03-02','11:30:00','12:30:00'),
(2,2,6,'2026-03-03','09:30:00','10:15:00'),
(3,5,5,'2026-03-04','14:00:00','14:40:00');


-- SESSION INVENTORY USAGE
INSERT INTO SESSION_INVENTORY_USAGE
(Session_ID,Item_ID,Quantity_Used)
VALUES
(1,1,2),
(1,2,1),
(2,3,1),
(3,1,1.5),
(4,5,1),
(5,1,1);


-- BILLS
INSERT INTO BILL
(Plan_ID,Bill_Date,Total_Amount,Tax,Discount,Net_Amount)
VALUES
(1,'2026-03-05',5000,500,200,5300),
(2,'2026-03-06',6000,600,300,6300),
(3,'2026-03-08',9000,900,500,9400);


-- PAYMENTS
INSERT INTO PAYMENT
(Bill_ID,Amount,Payment_Date,Payment_Mode,Transaction_Reference)
VALUES
(1,5300,'2026-03-05','UPI','TXN12345'),
(2,6300,'2026-03-06','Card','TXN12346'),
(3,9400,'2026-03-08','Cash','TXN12347');
