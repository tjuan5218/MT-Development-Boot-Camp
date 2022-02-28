DROP TABLE IF EXISTS 
    GuestClasses,
    Classes,
    SupplySales,
    ServiceSales,
    Guests,
    GuestStatus,
    TavernServices,
    ServiceStatus,
    Services,
    SupplyOrder,
    SupplyInventory,
    Supplies,
    BasementRats,
    Taverns,
    Locations,
    UserRoles,
    Users,
    Roles
;
    
/* Tables based on first example schema shown in class */

CREATE TABLE Roles (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(200)
);

INSERT INTO Roles VALUES 
    ('Owner', 'owner of tavern'),
    ('Stranger', 'stranger that visited tavern'),
    ('Drunk', 'town drunk'),
    ('Regular', 'regular attendee of tavern'),
    ('Bartender' , 'bartender of tavern')
;


CREATE TABLE Users (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50),
    Birthday DATE,
);

ALTER TABLE Users ADD PRIMARY KEY (ID);

INSERT INTO Users VALUES 
    ('Moe', '1999-01-01'),
    ('Monroe', '1999-08-24'),
    ('Marry', '1999-07-25'),
    ('Monty', '1974-11-22'),
    ('Morty', '2000-10-08')
;


CREATE TABLE UserRoles (
    ID INT IDENTITY(1,1),
    UserID INT,
    RoleID INT
);

ALTER TABLE UserRoles ADD 
    PRIMARY KEY (ID),
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (RoleID) REFERENCES Roles(ID)
;

INSERT INTO UserRoles VALUES 
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5)
;


CREATE TABLE Locations (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO Locations VALUES 
    ('Medford, NJ'),
    ('Marlton, NJ'),
    ('Trenton, NJ'),
    ('Union, NJ'),
    ('Atlantic City, NJ')
;


CREATE TABLE Taverns (
    ID INT IDENTITY(1,1),
    Name VARCHAR(100),
    FloorCount INT,
    OwnerID INT,
    LocationID INT
);

ALTER TABLE Taverns ADD 
    PRIMARY KEY (ID),
    FOREIGN KEY (OwnerID) REFERENCES Users(ID),
    FOREIGN KEY (LocationID) REFERENCES Locations(ID)
;

INSERT INTO Taverns VALUES 
    ('Moe''s Tavern', 2, 1, 1),
    ('Moe''s Tavern', 2, 1, 2),
    ('Moe''s Tavern', 2, 1, 3),
    ('Moe''s Tavern', 2, 1, 4),
    ('Moe''s Tavern', 2, 1, 5)
;


CREATE TABLE BasementRats (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID)
);

INSERT INTO BasementRats VALUES 
    ('Barry', 1),
    ('Murray', 2),
    ('Harry', 3),
    ('Alice', 4),
    ('Marry', 5),
    ('Barry', 5),
    ('Murray', 4),
    ('Harry', 1),
    ('Alice', 2),
    ('Marry', 3)
;


/* Types of supplies with name and unit */
CREATE TABLE Supplies (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Unit VARCHAR(50)
);

INSERT INTO Supplies VALUES 
    ('Strong Ale', 'Ounce'),
    ('Bread', 'Loaf'),
    ('Cheese', 'Wheel'),
    ('Cheese', 'Slice'),
    ('Pie', 'Slice')
;


/* Current supply inventory for all taverns linked by supply and tavern ID */
CREATE TABLE SupplyInventory (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    Amount INT,
    UpdateDate DATE
);

INSERT INTO SupplyInventory VALUES 
    (1,1, 3, '2022-02-22'),
    (1,2, 3, '2022-02-22'),
    (1,3, 3, '2022-02-22'),
    (1,4, 3, '2022-02-22'),
    (1,5, 3, '2022-02-22'),
    (2,1, 3, '2022-02-22'),
    (2,2, 3, '2022-02-22'),
    (2,3, 3, '2022-02-22'),
    (2,4, 3, '2022-02-22'),
    (2,5, 3, '2022-02-22')
;

/* Supply orders for all taverns linked by supply and tavern ID */
CREATE TABLE SupplyOrder (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    Cost DECIMAL(5,2),
    Amount INT,
    OrderDate DATE
);

INSERT INTO SupplyOrder VALUES 
    (1,2,19.5, 3, '2022-02-22'),
    (2,2,19.5, 3, '2022-02-22'),
    (3,2,19.5, 3, '2022-02-22'),
    (4,2,19.5, 3, '2022-02-22'),
    (5,2,19.5, 3, '2022-02-22'),
    (1,2,19.5, 3, '2022-02-22'),
    (2,2,19.5, 3, '2022-02-22'),
    (3,2,19.5, 3, '2022-02-22'),
    (4,2,19.5, 3, '2022-02-22'),
    (5,2,19.5, 3, '2022-02-22')
;


/* Types of services */
CREATE TABLE Services (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Services VALUES 
    ('Food'),
    ('Drink'),
    ('Inn'),
    ('Entertainment'),
    ('Stables')
;

/* Types of service status */
CREATE TABLE ServiceStatus (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO ServiceStatus VALUES 
    ('Active'),
    ('Inactive'),
    ('Out of Stock'),
    ('Discontinued'),
    ('Out of Season')
;


/* Services offered by all taverns linked by service, tavern, and status
   ID */
CREATE TABLE TavernServices (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceID INT FOREIGN KEY REFERENCES Services(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    statusID INT FOREIGN KEY REFERENCES ServiceStatus(ID)
);

INSERT INTO TavernServices VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 1)
;

/* Types of statuses that a guest can have. One per guest */
CREATE TABLE GuestStatus (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO GuestStatus VALUES
    ('Healthy'),
    ('Sick'),
    ('Hungry'),
    ('Thirsty'),
    ('Poisoned'),
    ('Drunk')
;

/* Guests that have attended any of the taverns in system. */
CREATE TABLE Guests (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Birthday DATE,
    Cakeday DATE,
    Status INT FOREIGN KEY REFERENCES GuestStatus(ID)
);

INSERT INTO Guests VALUES 
    ('Tommy', '2022-02-28', '2022-02-28', 6),
    ('Rick', '2022-02-28', '2022-02-28', 6),
    ('Harry', '2022-02-28', '2022-02-28', 6),
    ('Dawn', '2022-02-28', '2022-02-28', 6),
    ('Dorothy', '2022-02-28', '2022-02-28', 6)
;

/* Service sales of all taverns linked by service, tavern, and guest ID */
CREATE TABLE ServiceSales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceID INT FOREIGN KEY REFERENCES Services(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    SaleDate DATE,
    Amount INT
);

INSERT INTO ServiceSales VALUES 
    (1, 1, 2, '2022-02-22', 5),
    (1, 2, 2, '2022-02-22', 5),
    (1, 3, 2, '2022-02-22', 5),
    (1, 4, 2, '2022-02-22', 5),
    (1, 5, 2, '2022-02-22', 5)
;

/* Service sales of all taverns linked by service, tavern, and guest ID */
CREATE TABLE SupplySales (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    SupplyID INT FOREIGN KEY REFERENCES Supplies(ID),
    TavernID INT FOREIGN KEY REFERENCES Taverns(ID),
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    SaleDate DATE,
    Amount INT  
);

INSERT INTO SupplySales VALUES
    (1, 1, 1, '2022-02-28', 3),
    (1, 1, 2, '2022-02-28', 3),
    (1, 1, 3, '2022-02-28', 3),
    (1, 1, 4, '2022-02-28', 3),
    (1, 1, 5, '2022-02-28', 3)
;

/* Types of classes that a guest can be. Can be multiple for a single guest */
CREATE TABLE Classes (
    ID INT IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Classes VALUES
    ('Fighter'),
    ('Archer'),
    ('Healer'),
    ('Mage'),
    ('Rogue')
;

/* Linking table for the classes of all guests */
CREATE TABLE GuestClasses (
    GuestID INT FOREIGN KEY REFERENCES Guests(ID),
    ClassID INT FOREIGN KEY REFERENCES Classes(ID),
    Level INT
);

INSERT INTO GuestClasses VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1)
;

DROP TABLE IF EXISTS BasementRats;

/* Faulty insertions to demonstrate constraints
INSERT INTO GuestClasses VALUES (1, 6, 1);
INSERT INTO Guests VALUES ('Joey', '2022-02-28', '2022-02-28', 7);
INSERT INTO TavernServices VALUES (1, 100, 1);
INSERT INTO SupplyOrder VALUES (10, 1, 19.5, 3, '2022-02-28');
INSERT INTO Taverns VALUES ('Big Al''s', 1, 10, 1);
*/

/*
SELECT TOP 10 * FROM Taverns;
SELECT TOP 10 * FROM Users;
SELECT TOP 10 * FROM Roles;
SELECT TOP 10 * FROM Locations;
SELECT TOP 10 * FROM Supplies;
SELECT TOP 10 * FROM SupplyInventory;
SELECT TOP 10 * FROM SupplyOrder;
SELECT TOP 10 * FROM Services;
SELECT TOP 10 * FROM ServiceStatus;
SELECT TOP 10 * FROM TavernServices;
SELECT TOP 10 * FROM ServiceSales;
*/