DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS SupplyInventory;
DROP TABLE IF EXISTS SupplyOrder;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS ServiceSales;

CREATE TABLE Taverns (
    ID INT IDENTITY(1,1),
    Name VARCHAR(100),
    FloorCount INT,
    OwnerID INT,
    LocationID INT
);

INSERT INTO Taverns VALUES ('Moe''s Tavern', 2, 1, 1);
INSERT INTO Taverns VALUES ('Moe''s Tavern', 2, 1, 2);
INSERT INTO Taverns VALUES ('Moe''s Tavern', 2, 1, 3);
INSERT INTO Taverns VALUES ('Moe''s Tavern', 2, 1, 4);
INSERT INTO Taverns VALUES ('Moe''s Tavern', 2, 1, 5);


CREATE TABLE Users (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Birthday DATE,
    RoleID INT
);

INSERT INTO Users VALUES ('Moe', '1999-01-01', 1);
INSERT INTO Users VALUES ('Monroe', '1999-08-24', 2);
INSERT INTO Users VALUES ('Marry', '1999-07-25', 3);
INSERT INTO Users VALUES ('Monty', '1974-11-22', 4);
INSERT INTO Users VALUES ('Morty', '2000-10-08', 5);


CREATE TABLE Roles (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);

INSERT INTO Roles VALUES ('Owner');
INSERT INTO Roles VALUES ('Stranger');
INSERT INTO Roles VALUES ('Drunk');
INSERT INTO Roles VALUES ('Regular');
INSERT INTO Roles VALUES ('Bartender');


CREATE TABLE Locations (
    ID INT IDENTITY(1,1),
    Name VARCHAR(75)
);

INSERT INTO Locations VALUES ('Medford, NJ');
INSERT INTO Locations VALUES ('Marlton, NJ');
INSERT INTO Locations VALUES ('Trenton, NJ');
INSERT INTO Locations VALUES ('Union, NJ');
INSERT INTO Locations VALUES ('Atlantic City, NJ');


CREATE TABLE BasementRats (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50),
    TavernID INT
);

INSERT INTO BasementRats VALUES ('Barry', 1);
INSERT INTO BasementRats VALUES ('Murray', 2);
INSERT INTO BasementRats VALUES ('Harry', 3);
INSERT INTO BasementRats VALUES ('Alice', 4);
INSERT INTO BasementRats VALUES ('Marry', 5);
INSERT INTO BasementRats VALUES ('Barry', 5);
INSERT INTO BasementRats VALUES ('Murray', 4);
INSERT INTO BasementRats VALUES ('Harry', 1);
INSERT INTO BasementRats VALUES ('Alice', 2);
INSERT INTO BasementRats VALUES ('Marry', 3);


CREATE TABLE Supplies (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Unit VARCHAR(50)
);

INSERT INTO Supplies VALUES ('Strong Ale', 'Ounce');
INSERT INTO Supplies VALUES ('Bread', 'Loaf');
INSERT INTO Supplies VALUES ('Cheese', 'Wheel');
INSERT INTO Supplies VALUES ('Cheese', 'Slice');
INSERT INTO Supplies VALUES ('Pie', 'Slice');


CREATE TABLE SupplyInventory (
    SupplyID INT,
    TavernID INT,
    Amount INT,
    Date DATE
);

INSERT INTO SupplyInventory VALUES (1,1, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (1,2, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (1,3, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (1,4, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (1,5, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (2,1, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (2,2, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (2,3, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (2,4, 3, '2022-02-22');
INSERT INTO SupplyInventory VALUES (2,5, 3, '2022-02-22');

CREATE TABLE SupplyOrder (
    SupplyID INT,
    TavernID INT,
    Cost DECIMAL(5,3),
    Amount INT,
    Date DATE
);

INSERT INTO SupplyOrder VALUES (1,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (2,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (3,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (4,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (5,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (1,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (2,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (3,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (4,2,19.5, 3, '2022-02-22');
INSERT INTO SupplyOrder VALUES (5,2,19.5, 3, '2022-02-22');

CREATE TABLE Services (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);

INSERT INTO Services VALUES ('Food');
INSERT INTO Services VALUES ('Drink');
INSERT INTO Services VALUES ('Inn');
INSERT INTO Services VALUES ('Entertainment');
INSERT INTO Services VALUES ('Stables');

/* Status Enum
    Active 1
    Inactive 2
*/    
    
CREATE TABLE ServiceStatus (
    SerivceID INT,
    TavernID INT,
    status INT
);

INSERT INTO ServiceStatus VALUES (1, 1, 1);
INSERT INTO ServiceStatus VALUES (1, 2, 1);
INSERT INTO ServiceStatus VALUES (1, 3, 1);
INSERT INTO ServiceStatus VALUES (1, 4, 1);
INSERT INTO ServiceStatus VALUES (1, 5, 1);

CREATE TABLE ServiceSales (
    ServiceID INT,
    TavernID INT,
    GuestID INT,
    Date DATE,
    Amount INT
);

INSERT INTO ServiceSales VALUES (1, 1, 2, '2022-02-22', 5);
INSERT INTO ServiceSales VALUES (1, 2, 2, '2022-02-22', 5);
INSERT INTO ServiceSales VALUES (1, 3, 2, '2022-02-22', 5);
INSERT INTO ServiceSales VALUES (1, 4, 2, '2022-02-22', 5);
INSERT INTO ServiceSales VALUES (1, 5, 2, '2022-02-22', 5);

SELECT TOP 10 * FROM Taverns;
SELECT TOP 10 * FROM Users;
SELECT TOP 10 * FROM Roles;
SELECT TOP 10 * FROM Locations;
SELECT TOP 10 * FROM BasementRats;
SELECT TOP 10 * FROM Supplies;
SELECT TOP 10 * FROM SupplyInventory;
SELECT TOP 10 * FROM SupplyOrder;
SELECT TOP 10 * FROM Services;
SELECT TOP 10 * FROM ServiceStatus;
SELECT TOP 10 * FROM ServiceSales;