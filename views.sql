CREATE VIEW Patient_Treatment_History AS
SELECT 
p.Patient_ID,
CONCAT(p.First_Name,' ',p.Last_Name) AS Patient_Name,
tp.Plan_ID,
CONCAT(s.First_Name,' ',s.Last_Name) AS Doctor_Name,
t.Therapy_Name,
ts.Session_Date,
ts.Session_Status
FROM therapy_session ts
JOIN treatment_plan tp ON ts.Plan_ID = tp.Plan_ID
JOIN patient p ON tp.Patient_ID = p.Patient_ID
JOIN staff s ON tp.Doctor_ID = s.Staff_ID
JOIN therapy t ON ts.Therapy_ID = t.Therapy_ID;

CREATE VIEW Doctor_Workload AS
SELECT
s.Staff_ID,
CONCAT(s.First_Name,' ',s.Last_Name) AS Doctor_Name,
COUNT(tp.Plan_ID) AS Total_Treatment_Plans
FROM treatment_plan tp
JOIN staff s ON tp.Doctor_ID = s.Staff_ID
GROUP BY s.Staff_ID;

CREATE VIEW Inventory_Status AS
SELECT
Item_ID,
Item_Name,
Category,
Quantity_In_Stock,
Unit
FROM inventory_item;