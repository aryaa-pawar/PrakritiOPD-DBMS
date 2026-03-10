--  VIEWS 
-- Patient_Treatment_History
SELECT * FROM Patient_Treatment_History;

--  Doctor_Workload
SELECT * FROM Doctor_Workload;

-- Inventory_Status
SELECT * FROM Inventory_Status;

--  STORED PROCEDURES
-- Create_Treatment_Plan
-- Call Procedure
CALL Create_Treatment_Plan(
1,
1,
2,
'Stress relief therapy',
'2026-03-12',
'2026-03-16'
);
-- result
SELECT * 
FROM treatment_plan
ORDER BY Plan_ID DESC
LIMIT 1;

-- Generate_Bill
-- Call Procedure
CALL Generate_Bill(
1,
5000,
500,
200
);
--  Result
SELECT *
FROM bill
ORDER BY Bill_ID DESC
LIMIT 1;

--  TRIGGERS

-- Trigger 1: trg_calculate_net_amount
-- Insert Bill Without Net Amount
INSERT INTO BILL
(Plan_ID, Bill_Date, Total_Amount, Tax, Discount)
VALUES
(2,'2026-03-10',6000,600,300);
-- result
SELECT *
FROM BILL
ORDER BY Bill_ID DESC
LIMIT 1;

ALTER TABLE BILL
MODIFY Net_Amount DECIMAL(10,2);

SHOW TRIGGERS;

-- Insert Inventory Usage
INSERT INTO SESSION_INVENTORY_USAGE
(Session_ID, Item_ID, Quantity_Used)
VALUES
(1,1,2);
-- result
SELECT Item_Name, Quantity_In_Stock
FROM inventory_item
WHERE Item_ID = 1;