USE PrakritiOPD;
DELIMITER $$

CREATE TRIGGER trg_deduct_inventory
BEFORE INSERT ON SESSION_INVENTORY_USAGE
FOR EACH ROW
BEGIN

DECLARE current_stock DECIMAL(10,2);

SELECT Quantity_In_Stock 
INTO current_stock
FROM inventory_item
WHERE Item_ID = NEW.Item_ID;

IF current_stock < NEW.Quantity_Used THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Not enough stock available';

ELSE

UPDATE inventory_item
SET Quantity_In_Stock = Quantity_In_Stock - NEW.Quantity_Used
WHERE Item_ID = NEW.Item_ID;

END IF;

END$$

DELIMITER ;

-- billing 
DELIMITER $$

CREATE TRIGGER trg_calculate_net_amount
BEFORE INSERT ON BILL
FOR EACH ROW
BEGIN

SET NEW.Net_Amount = NEW.Total_Amount + NEW.Tax - NEW.Discount;

END$$

DELIMITER ;