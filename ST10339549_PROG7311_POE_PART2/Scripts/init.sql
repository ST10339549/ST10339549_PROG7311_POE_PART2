-- =====================================
-- ========== SCHEMA CREATION ==========
-- =====================================
CREATE DATABASE AgriEnergyConnect;
GO

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Farmers;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(100),
    EmployeeEmail NVARCHAR(100),
    EmployeePasswordHash NVARCHAR(64),
    EmployeeRoleTitle NVARCHAR(50),
    EmployeePhoneNumber NVARCHAR(20),
    CreatedAt DATETIME
);

CREATE TABLE Farmers (
    FarmerId INT PRIMARY KEY IDENTITY(1,1),
    FarmerName NVARCHAR(100),
    FarmerEmail NVARCHAR(100),
    FarmerPasswordHash NVARCHAR(64),
    FarmerPhoneNumber NVARCHAR(20),
    FarmerAddress NVARCHAR(255),
    CreatedAt DATETIME
);

CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    FarmerId INT,
    ProductName NVARCHAR(100),
    ProductCategory NVARCHAR(50),
    Description NVARCHAR(255),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ProductionDate DATE,
    CreatedAt DATETIME,
    FOREIGN KEY (FarmerId) REFERENCES Farmers(FarmerId)
);

-- ================
-- EMPLOYEE INSERTS
-- ================

-- Password: 62jMW7z
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Kaitlin Levy', 'kaitlin.levy@agrienergy.com', '8ca5631a1235b3069cb650511fae72d23938224bdfa5555b93e137c979edd2aa', 'Coordinator', '+27 71 223 2689', '2025-05-14 13:00:14');

-- Password: X5Cses
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Holly Benjamin', 'holly.benjamin@agrienergy.com', 'c24fad4115787ffb1822ec887a2a732ccdbb775459b9b00a30c236af31a996f5', 'Field Agent', '072 542 9616', '2025-05-14 13:00:14');

-- Password: SS7F7Ub
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Tracy Hansen', 'tracy.hansen@agrienergy.com', '0c10bd574018ec91a1aa1f2385e7dbccae2ae72597ddbcc728d091b6793a3162', 'Coordinator', '+27 82 282 2494', '2025-05-14 13:00:14');

-- Password: 4FLdvNvI2
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Jennifer Smith', 'jennifer.smith@agrienergy.com', '86445c5ae26dc3c94b0eeed061f12d52744d31ff677c2c4a320abbb55715d834', 'Coordinator', '083 582 6098', '2025-05-14 13:00:14');

-- Password: n4ZWsHtYrc
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Stephanie Scott', 'stephanie.scott@agrienergy.com', 'a51a19b2a2f8a14863e420371f2cb2841d8de7c3218276e30c57cbbcb6a5f332', 'Coordinator', '+27 76 327 4077', '2025-05-14 13:00:14');

-- Password: V7PlY6I
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Abigail Clayton', 'abigail.clayton@agrienergy.com', 'e3bac93b37fb1241795e9acf390eec619a06e16cda43770b503e1b63b5689d84', 'Operations', '084 306 2391', '2025-05-14 13:00:14');

-- Password: TYA0Zfu
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Christopher Brown', 'christopher.brown@agrienergy.com', '7ddea7f8eb590d9c0612254e099ada88546a6508fa306b2890a3384e92ea647d', 'Field Agent', '+27 79 279 5210', '2025-05-14 13:00:14');

-- Password: 3gxCnCY
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Nicholas Hernandez', 'nicholas.hernandez@agrienergy.com', '5c04a13062d52e69a0381f93a47d7026eba9c2d3dee19e1532a7ce8e82c3d159', 'Operations', '061 486 1715', '2025-05-14 13:00:14');

-- Password: 1N5Mpx
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Bruce Aguilar', 'bruce.aguilar@agrienergy.com', 'c36b1f7e0e69281aa65759a645baf7675d9bdea9023634073ab93f150f645c32', 'Operations', '+27 73 727 7455', '2025-05-14 13:00:14');

-- Password: 3wS4Nag
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Amber David', 'amber.david@agrienergy.com', '99002ddb3d805c1e61a4f9c79c3f2b7fd64310e8abf4ad2f4c63c1cb9682f3cd', 'Operations', '064 655 0945', '2025-05-14 13:00:14');

-- ==============
-- FARMER INSERTS
-- ==============

-- Password: 4DG0bgy
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Makayla Bryant', 'makayla.bryant@agrifarm.com', 'b5134922a20ce0051f61c6ddf69ba99e94cffabcdae737ac6dea3624521cb9ea', '078 486 8122', '35525 Emma Creek Apt. 462, Ryanland, UT 23409', '2025-05-14 13:00:14');

-- Password: iKGmOLwM3
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Denise Rocha', 'denise.rocha@agrifarm.com', '3ef3ca4be11f042123886775d37cf1a41f5595386e62b58cf600f7ef677e9449', '+27 66 463 6127', '490 David Mews Apt. 548, Michelemouth, AZ 91076', '2025-05-14 13:00:14');

-- Password: 4S5RpTetU
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('James King', 'james.king@agrifarm.com', '66bae0dc6803f0ee84f84a16e46c32c788ea192b26f18f0dea6dc1e1c5640b52', '073 125 5077', '445 Cole Village, Howellmouth, OH 42747', '2025-05-14 13:00:14');

-- Password: 1B2xbDW
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Derek Moreno', 'derek.moreno@agrifarm.com', '95d4bfb271e471063ff582cff606bc297a61103b04395a63be3dfe9f2ab88431', '+27 72 800 6904', '5976 Dennis Crescent Apt. 318, South Christopher, PA 51421', '2025-05-14 13:00:14');

-- Password: 66hWagOsa
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Cheryl Johnson', 'cheryl.johnson@agrifarm.com', '6755dcb47de1089543686ecdeef6c3dceb79098cb609c83f4c3314d65cc60073', '071 491 5332', '8296 Stephen Mountains Apt. 536, Lake Courtneybury, SD 39700', '2025-05-14 13:00:14');

-- Password: 66QiyI5Er
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Sean Campbell', 'sean.campbell@agrifarm.com', 'd0d9551deb99ad6e702d2e333cd53df6b13010aee9808b6faf613f598b541069', '+27 65 010 4703', '786 Mitchell Square Suite 576, South Wayne, WY 44916', '2025-05-14 13:00:14');

-- Password: 3Jfn38jrO
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Krista Floyd', 'krista.floyd@agrifarm.com', '5dc75f9df5a1b84a7005e7e17778ebc0daeceadb390a31c012abe998859f0345', '073 504 4114', '661 Richardson Mountain Apt. 604, South Ashley, AR 22141', '2025-05-14 13:00:14');

-- Password: D6QpCHz
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Susan Gonzalez', 'susan.gonzalez@agrifarm.com', '1a248e4174cf4407824976b604fc18eed04de5f5b88e95474f6c8d9976ee54ff', '+27 74 032 0375', '651 Shawn Forks Suite 263, Jonathanport, MA 21383', '2025-05-14 13:00:14');

-- Password: fSVKf8Ja
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Courtney Duke', 'courtney.duke@agrifarm.com', '966eb5eb8271cb81b3408ce421d8c63b958de0eac4db40ecc0dd0061a4f8aafe', '074 230 8050', '1839 Amber Turnpike, Port Elizabethtown, SD 46428', '2025-05-14 13:00:14');

-- Password: 7NRGwAm
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Jared Guzman', 'jared.guzman@agrifarm.com', 'f56e18d990a70f1b2ae82297cbccc2ac5485895e0c46c6031db9387eb0503774', '+27 71 237 9577', '306 Le Mountain, Dukechester, PA 83522', '2025-05-14 13:00:14');

-- ===============
-- PRODUCT INSERTS
-- ===============

INSERT INTO Products (FarmerId, ProductName, ProductCategory, Description, Quantity, UnitPrice, ProductionDate, CreatedAt) VALUES
(1, 'Organic Tomatoes', 'Vegetables', 'Organic Tomatoes freshly harvested and packaged for quality.', 122, 16.75, '2025-04-18', '2025-05-14 13:00:14'),
(1, 'Spinach', 'Fruits', 'Spinach picked this morning and ready for distribution.', 89, 20.40, '2025-04-19', '2025-05-14 13:00:14'),
(1, 'Chili Peppers', 'Herbs', 'Chili Peppers selected and sorted with freshness guaranteed.', 64, 13.33, '2025-04-20', '2025-05-14 13:00:14'),
(1, 'Mushrooms', 'Vegetables', 'Mushrooms picked this morning and ready for distribution.', 103, 18.76, '2025-04-21', '2025-05-14 13:00:14'),
(1, 'Sweetcorn', 'Fruits', 'Sweetcorn freshly harvested and packaged for quality.', 73, 15.25, '2025-04-22', '2025-05-14 13:00:14'),
(1, 'Pumpkins', 'Dairy', 'Pumpkins selected and sorted with freshness guaranteed.', 97, 23.45, '2025-04-23', '2025-05-14 13:00:14'),
(1, 'Goat Cheese', 'Dairy', 'Goat Cheese picked this morning and ready for distribution.', 85, 27.30, '2025-04-24', '2025-05-14 13:00:14'),
(1, 'Free Range Eggs', 'Poultry', 'Free Range Eggs freshly harvested and packaged for quality.', 60, 21.99, '2025-04-25', '2025-05-14 13:00:14'),
(2, 'Organic Chicken', 'Poultry', 'Organic Chicken selected and sorted with freshness guaranteed.', 45, 35.00, '2025-04-26', '2025-05-14 13:00:14'),
(2, 'Grass-fed Beef', 'Meat', 'Grass-fed Beef picked this morning and ready for distribution.', 30, 50.00, '2025-04-27', '2025-05-14 13:00:14'),
(2, 'Almond Milk', 'Dairy', 'Almond Milk freshly harvested and packaged for quality.', 55, 12.50, '2025-04-28', '2025-05-14 13:00:14'),
(2, 'Organic Honey', 'Sweeteners', 'Organic Honey selected and sorted with freshness guaranteed.', 40, 18.99, '2025-04-29', '2025-05-14 13:00:14'),
(2, 'Fresh Basil', 'Herbs', 'Fresh Basil picked this morning and ready for distribution.', 70, 10.75, '2025-04-30', '2025-05-14 13:00:14'),
(2, 'Organic Apples', 'Fruits', 'Organic Apples freshly harvested and packaged for quality.', 90, 15.50, '2025-05-01', '2025-05-14 13:00:14'),
(2, 'Carrots', 'Vegetables', 'Carrots selected and sorted with freshness guaranteed.', 110, 8.99, '2025-05-02', '2025-05-14 13:00:14'),
(2, 'Organic Strawberries', 'Fruits', 'Organic Strawberries picked this morning and ready for distribution.', 80, 22.50, '2025-05-03', '2025-05-14 13:00:14'),
(3, 'Cucumbers', 'Vegetables', 'Cucumbers freshly harvested and packaged for quality.', 95, 9.99, '2025-05-04', '2025-05-14 13:00:14'),
(3, 'Organic Blueberries', 'Fruits', 'Organic Blueberries selected and sorted with freshness guaranteed.', 65, 14.99, '2025-05-05', '2025-05-14 13:00:14'),
(3, 'Organic Yogurt', 'Dairy', 'Organic Yogurt picked this morning and ready for distribution.', 50, 6.50, '2025-05-06', '2025-05-14 13:00:14'),
(3, 'Fresh Oregano', 'Herbs', 'Fresh Oregano freshly harvested and packaged for quality.', 75, 11.25, '2025-05-07', '2025-05-14 13:00:14'),
(3, 'Organic Peaches', 'Fruits', 'Organic Peaches selected and sorted with freshness guaranteed.', 85, 17.50, '2025-05-08', '2025-05-14 13:00:14'),
(3, 'Free Range Chicken Eggs', 'Poultry', 'Free Range Chicken Eggs picked this morning and ready for distribution.', 60, 24.99, '2025-05-09', '2025-05-14 13:00:14'),
(3, 'Organic Quinoa', 'Grains', 'Organic Quinoa freshly harvested and packaged for quality.', 40, 30.00, '2025-05-10', '2025-05-14 13:00:14'),
(3, 'Grass-fed Lamb', 'Meat', 'Grass-fed Lamb selected and sorted with freshness guaranteed.', 20, 55.00, '2025-05-11', '2025-05-14 13:00:14'),
(4, 'Organic Garlic', 'Vegetables', 'Organic Garlic picked this morning and ready for distribution.', 100, 7.50, '2025-05-12', '2025-05-14 13:00:14'),
(4, 'Fresh Cilantro', 'Herbs', 'Fresh Cilantro freshly harvested and packaged for quality.', 80, 9.99, '2025-05-13', '2025-05-14 13:00:14'),
(4, 'Organic Walnuts', 'Nuts & Seeds', 'Organic Walnuts selected and sorted with freshness guaranteed.', 45, 15.00, '2025-05-14', '2025-05-14 13:00:14'),
(4, 'Organic Coconut Milk', 'Dairy', 'Organic Coconut Milk picked this morning and ready for distribution.', 55, 12.00, '2025-05-15', '2025-05-14 13:00:14'),
(4, 'Organic Grapes', 'Fruits', 'Organic Grapes freshly harvested and packaged for quality.', 70, 18.50, '2025-05-16', '2025-05-14 13:00:14'),
(4, 'Organic Chia Seeds', 'Nuts & Seeds', 'Organic Chia Seeds selected and sorted with freshness guaranteed.', 60, 22.00, '2025-05-17', '2025-05-14 13:00:14'),
(4, 'Organic Almond Butter', 'Sweeteners', 'Organic Almond Butter picked this morning and ready for distribution.', 50, 25.00, '2025-05-18', '2025-05-14 13:00:14'),
(4, 'Organic Pumpkin Seeds', 'Nuts & Seeds', 'Organic Pumpkin Seeds freshly harvested and packaged for quality.', 40, 20.00, '2025-05-19', '2025-05-14 13:00:14'),
(5, 'Organic Cauliflower', 'Vegetables', 'Organic Cauliflower selected and sorted with freshness guaranteed.', 90, 10.00, '2025-05-20', '2025-05-14 13:00:14'),
(5, 'Organic Zucchini', 'Vegetables', 'Organic Zucchini picked this morning and ready for distribution.', 85, 12.50, '2025-05-21', '2025-05-14 13:00:14'),
(5, 'Organic Carrots', 'Vegetables', 'Organic Carrots freshly harvested and packaged for quality.', 100, 8.00, '2025-05-22', '2025-05-14 13:00:14'),
(5, 'Organic Bell Peppers', 'Vegetables', 'Organic Bell Peppers selected and sorted with freshness guaranteed.', 75, 11.00, '2025-05-23', '2025-05-14 13:00:14'),
(5, 'Organic Cucumbers', 'Vegetables', 'Organic Cucumbers picked this morning and ready for distribution.', 80, 9.50, '2025-05-24', '2025-05-14 13:00:14'),
(5, 'Organic Eggplant', 'Vegetables', 'Organic Eggplant freshly harvested and packaged for quality.', 70, 10.50, '2025-05-25', '2025-05-14 13:00:14'),
(6, 'Organic Sweet Potatoes', 'Vegetables', 'Organic Sweet Potatoes selected and sorted with freshness guaranteed.', 60, 7.50, '2025-05-26', '2025-05-14 13:00:14'),
(6, 'Organic Butternut Squash', 'Vegetables', 'Organic Butternut Squash picked this morning and ready for distribution.', 55, 8.50, '2025-05-27', '2025-05-14 13:00:14'),
(6, 'Organic Beets', 'Vegetables', 'Organic Beets freshly harvested and packaged for quality.', 50, 9.00, '2025-05-28', '2025-05-14 13:00:14'),
(6, 'Organic Radishes ', 'Vegetables', 'Organic Radishes selected and sorted with freshness guaranteed.', 45, 6.50, '2025-05-29', '2025-05-14 13:00:14'),
(6, 'Organic Green Beans', 'Vegetables', 'Organic Green Beans picked this morning and ready for distribution.', 40, 7.00, '2025-05-30', '2025-05-14 13:00:14'),
(6, 'Organic Peas', 'Vegetables', 'Organic Peas freshly harvested and packaged for quality.', 35, 8.00, '2025-05-31', '2025-05-14 13:00:14'),
(7, 'Organic Lettuce', 'Vegetables', 'Organic Lettuce selected and sorted with freshness guaranteed.', 30, 5.50, '2025-06-01', '2025-05-14 13:00:14'),
(7, 'Organic Kale', 'Vegetables', 'Organic Kale picked this morning and ready for distribution.', 25, 6.00, '2025-06-02', '2025-05-14 13:00:14'),
(7, 'Organic Collard Greens', 'Vegetables', 'Organic Collard Greens freshly harvested and packaged for quality.', 20, 7.00, '2025-06-03', '2025-05-14 13:00:14'),
(7, 'Organic Swiss Chard', 'Vegetables', 'Organic Swiss Chard selected and sorted with freshness guaranteed.', 15, 8.00, '2025-06-04', '2025-05-14 13:00:14'),
(7, 'Organic Arugula', 'Vegetables', 'Organic Arugula picked this morning and ready for distribution.', 10, 9.00, '2025-06-05', '2025-05-14 13:00:14'),
(7, 'Organic Bok Choy', 'Vegetables', 'Organic Bok Choy freshly harvested and packaged for quality.', 5, 10.00, '2025-06-06', '2025-05-14 13:00:14'),
(8, 'Organic Cilantro', 'Herbs', 'Organic Cilantro selected and sorted with freshness guaranteed.', 100, 11.50, '2025-06-07', '2025-05-14 13:00:14'),
(8, 'Organic Parsley', 'Herbs', 'Organic Parsley picked this morning and ready for distribution.', 90, 12.50, '2025-06-08', '2025-05-14 13:00:14'),
(8, 'Organic Thyme', 'Herbs', 'Organic Thyme freshly harvested and packaged for quality.', 80, 13.50, '2025-06-09', '2025-05-14 13:00:14'),
(8, 'Organic Rosemary', 'Herbs', 'Organic Rosemary selected and sorted with freshness guaranteed.', 70, 14.50, '2025-06-10', '2025-05-14 13:00:14'),
(8, 'Organic Sage', 'Herbs', 'Organic Sage picked this morning and ready for distribution.', 60, 15.50, '2025-06-11', '2025-05-14 13:00:14'),
(8, 'Organic Dill', 'Herbs', 'Organic Dill freshly harvested and packaged for quality.', 50, 16.50, '2025-06-12', '2025-05-14 13:00:14'),
(9, 'Organic Mint', 'Herbs', 'Organic Mint selected and sorted with freshness guaranteed.', 40, 17.50, '2025-06-13', '2025-05-14 13:00:14'),
(9, 'Organic Fennel', 'Herbs', 'Organic Fennel picked this morning and ready for distribution.', 30, 18.50, '2025-06-14', '2025-05-14 13:00:14'),
(9, 'Organic Tarragon', 'Herbs', 'Organic Tarragon freshly harvested and packaged for quality.', 20, 19.50, '2025-06-15', '2025-05-14 13:00:14'),
(9, 'Organic Chervil', 'Herbs', 'Organic Chervil selected and sorted with freshness guaranteed.', 10, 20.50, '2025-06-16', '2025-05-14 13:00:14'),
(9, 'Organic Bay Leaves', 'Herbs', 'Organic Bay Leaves picked this morning and ready for distribution.', 5, 21.50, '2025-06-17', '2025-05-14 13:00:14'),
(9, 'Organic Lemongrass', 'Herbs', 'Organic Lemongrass freshly harvested and packaged for quality.', 3, 22.50, '2025-06-18', '2025-05-14 13:00:14'),
(10, 'Organic Ginger', 'Herbs', 'Organic Ginger selected and sorted with freshness guaranteed.', 2, 23.50, '2025-06-19', '2025-05-14 13:00:14'),
(10, 'Organic Turmeric', 'Herbs', 'Organic Turmeric picked this morning and ready for distribution.', 1, 24.50, '2025-06-20', '2025-05-14 13:00:14'),
(10, 'Organic Wasabi', 'Herbs', 'Organic Wasabi freshly harvested and packaged for quality.', 1, 25.50, '2025-06-21', '2025-05-14 13:00:14'),
(10, 'Organic Horseradish', 'Herbs', 'Organic Horseradish selected and sorted with freshness guaranteed.', 1, 26.50, '2025-06-22', '2025-05-14 13:00:14'),
(10, 'Organic Cilantro Lime Rice', 'Grains', 'Organic Cilantro Lime Rice picked this morning and ready for distribution.', 1, 27.50, '2025-06-23', '2025-05-14 13:00:14'),
(10, 'Organic Coconut Rice', 'Grains', 'Organic Coconut Rice freshly harvested and packaged for quality.', 1, 28.50, '2025-06-24', '2025-05-14 13:00:14'),
(10, 'Organic Jasmine Rice', 'Grains', 'Organic Jasmine Rice selected and sorted with freshness guaranteed.', 1, 29.50, '2025-06-25', '2025-05-14 13:00:14'),
(10, 'Organic Basmati Rice', 'Grains', 'Organic Basmati Rice picked this morning and ready for distribution.', 1, 30.50, '2025-06-26', '2025-05-14 13:00:14'),
(10, 'Organic Brown Rice', 'Grains', 'Organic Brown Rice freshly harvested and packaged for quality.', 1, 31.50, '2025-06-27', '2025-05-14 13:00:14');