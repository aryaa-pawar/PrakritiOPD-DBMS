DELIMITER $$

CREATE PROCEDURE Create_Treatment_Plan(
IN p_patient INT,
IN p_doctor INT,
IN p_package INT,
IN p_diag TEXT,
IN p_start DATE,
IN p_end DATE
)
BEGIN

INSERT INTO treatment_plan
(Patient_ID,Doctor_ID,Package_ID,Diagnosis,Start_Date,End_Date)
VALUES
(p_patient,p_doctor,p_package,p_diag,p_start,p_end);

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE Generate_Bill(
IN p_plan INT,
IN p_total DECIMAL(10,2),
IN p_tax DECIMAL(10,2),
IN p_discount DECIMAL(10,2)
)
BEGIN

DECLARE net DECIMAL(10,2);

SET net = p_total + p_tax - p_discount;

INSERT INTO bill
(Plan_ID,Bill_Date,Total_Amount,Tax,Discount,Net_Amount)
VALUES
(p_plan,CURDATE(),p_total,p_tax,p_discount,net);

END$$

DELIMITER ;