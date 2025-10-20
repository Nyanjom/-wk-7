-- Table 1: Stores Order-level information
-- This table removes the partial dependency.
-- CustomerName now fully depends on the primary key, OrderID.
CREATE TABLE `Orders` (
    `OrderID` INT NOT NULL,
    `CustomerName` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`OrderID`)
);

-- Table 2: Stores the details for each order
-- The columns Quantity and Product both depend on the *entire*
-- composite primary key (OrderID, Product).
CREATE TABLE `OrderItems` (
    `OrderID` INT NOT NULL,
    `Product` VARCHAR(100) NOT NULL,
    `Quantity` INT NOT NULL,
    
    -- Create the composite primary key
    PRIMARY KEY (`OrderID`, `Product`),
    
    -- Create the foreign key relationship back to the Orders table
    CONSTRAINT `fk_orderitems_order`
        FOREIGN KEY (`OrderID`)
        REFERENCES `Orders` (`OrderID`)
        ON DELETE CASCADE
);