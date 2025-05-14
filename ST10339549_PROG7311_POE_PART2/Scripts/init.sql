-- =====================================
-- ========== SCHEMA CREATION ==========
-- =====================================

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
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Kaitlin Levy', 'kaitlin.levy@agrienergy.com', '8ca5631a1235b3069cb650511fae72d23938224bdfa5555b93e137c979edd2aa', 'Coordinator', '001-704-223-2689x898', '2025-05-14 13:00:14');

-- Password: X5Cses
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Holly Benjamin', 'holly.benjamin@agrienergy.com', 'c24fad4115787ffb1822ec887a2a732ccdbb775459b9b00a30c236af31a996f5', 'Field Agent', '(550)542-9616', '2025-05-14 13:00:14');

-- Password: SS7F7Ub
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Tracy Hansen', 'tracy.hansen@agrienergy.com', '0c10bd574018ec91a1aa1f2385e7dbccae2ae72597ddbcc728d091b6793a3162', 'Coordinator', '001-285-282-2494x78200', '2025-05-14 13:00:14');

-- Password: 4FLdvNvI2
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Jennifer Smith', 'jennifer.smith@agrienergy.com', '86445c5ae26dc3c94b0eeed061f12d52744d31ff677c2c4a320abbb55715d834', 'Coordinator', '8035826098', '2025-05-14 13:00:14');

-- Password: n4ZWsHtYrc
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Stephanie Scott', 'stephanie.scott@agrienergy.com', 'a51a19b2a2f8a14863e420371f2cb2841d8de7c3218276e30c57cbbcb6a5f332', 'Coordinator', '766-327-4077', '2025-05-14 13:00:14');

-- Password: V7PlY6I
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Abigail Clayton', 'abigail.clayton@agrienergy.com', 'e3bac93b37fb1241795e9acf390eec619a06e16cda43770b503e1b63b5689d84', 'Operations', '4203062391', '2025-05-14 13:00:14');

-- Password: TYA0Zfu
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Christopher Brown', 'christopher.brown@agrienergy.com', '7ddea7f8eb590d9c0612254e099ada88546a6508fa306b2890a3384e92ea647d', 'Field Agent', '001-925-279-5210x560', '2025-05-14 13:00:14');

-- Password: 3gxCnCY
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Nicholas Hernandez', 'nicholas.hernandez@agrienergy.com', '5c04a13062d52e69a0381f93a47d7026eba9c2d3dee19e1532a7ce8e82c3d159', 'Operations', '645.486.1715x208', '2025-05-14 13:00:14');

-- Password: 1N5Mpx
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Bruce Aguilar', 'bruce.aguilar@agrienergy.com', 'c36b1f7e0e69281aa65759a645baf7675d9bdea9023634073ab93f150f645c32', 'Operations', '(738)727-7455', '2025-05-14 13:00:14');

-- Password: 3wS4Nag
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Amber David', 'amber.david@agrienergy.com', '99002ddb3d805c1e61a4f9c79c3f2b7fd64310e8abf4ad2f4c63c1cb9682f3cd', 'Operations', '+1-141-655-0945', '2025-05-14 13:00:14');

-- Password: 7GPbmdRx
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Duane Pace', 'duane.pace@agrienergy.com', '20b8608e0450b848bc461f75c45fa0b1a298a9030bfd8be322c579516264769f', 'Operations', '4644093000', '2025-05-14 13:00:14');

-- Password: v50RXc
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Stacy Powers', 'stacy.powers@agrienergy.com', 'f0737d51ebb51448ab9dc9df42993e22f6aa8ad0d7842bc9283c79f034ec79e0', 'Field Agent', '166.583.9260x27513', '2025-05-14 13:00:14');

-- Password: 2EuKVmo8oV
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Eileen Weaver', 'eileen.weaver@agrienergy.com', '1c4cf471a30821af89f5978f420159adfb6e94b7c6e576cae9a9db21153e0ec0', 'Field Agent', '(912)912-4822', '2025-05-14 13:00:14');

-- Password: K8ZR7Eftk1
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Tracy Kim', 'tracy.kim@agrienergy.com', '58170001102668625b786f6d192a76d8d514a37acdfc1c068dd29c6c35d0b219', 'Operations', '(045)073-1323x7283', '2025-05-14 13:00:14');

-- Password: O9aCkgw
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Brian Wright', 'brian.wright@agrienergy.com', '92a6592147ebe975ea0417407d5a5f2f246abe33de5b4c1c730edd151202e6dd', 'Operations', '+1-826-185-8917x0926', '2025-05-14 13:00:14');

-- Password: Ie7Cg8
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Albert Perkins', 'albert.perkins@agrienergy.com', '9a897f81d8ecc24451f8f54b1d7f525802be6ee44feaaa955caa3a5ed1427ca2', 'Field Agent', '+1-893-056-8927', '2025-05-14 13:00:14');

-- Password: bf4KgQiPLi
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Rebecca Waller', 'rebecca.waller@agrienergy.com', '33b0b96776f0d4cf266871f75861478ba26b5720762780de6c40fc8f43f3a535', 'Operations', '2433855023', '2025-05-14 13:00:14');

-- Password: 6IHdagwpM
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Alice White', 'alice.white@agrienergy.com', 'a547f6786082539bd927c74fe5103afe451475d10427328ac930e4474aa2b9a6', 'Coordinator', '+1-548-759-4457', '2025-05-14 13:00:14');

-- Password: xS7OKJrd6
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('James Lynch', 'james.lynch@agrienergy.com', '053d39cd1c101f4e6fade9404a4ec601f6cc8a4c2b2a04cc50833f82cdb8fd5e', 'Coordinator', '796.016.0189x464', '2025-05-14 13:00:14');

-- Password: K2WiXvCnHZ
INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt) VALUES ('Ralph Henry', 'ralph.henry@agrienergy.com', 'a69ee9bdcec388cc3b5910beff83639834d345e7bb950673a01eada6fd246bfa', 'Operations', '+1-274-307-7372x4050', '2025-05-14 13:00:14');

-- ==============
-- FARMER INSERTS
-- ==============

-- Password: 4DG0bgy
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Makayla Bryant', 'makayla.bryant@agrifarm.com', 'b5134922a20ce0051f61c6ddf69ba99e94cffabcdae737ac6dea3624521cb9ea', '(138)486-8122', '35525 Emma Creek Apt. 462, Ryanland, UT 23409', '2025-05-14 13:00:14');

-- Password: iKGmOLwM3
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Denise Rocha', 'denise.rocha@agrifarm.com', '3ef3ca4be11f042123886775d37cf1a41f5595386e62b58cf600f7ef677e9449', '+1-668-463-6127x306', '490 David Mews Apt. 548, Michelemouth, AZ 91076', '2025-05-14 13:00:14');

-- Password: 4S5RpTetU
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('James King', 'james.king@agrifarm.com', '66bae0dc6803f0ee84f84a16e46c32c788ea192b26f18f0dea6dc1e1c5640b52', '+1-073-125-5077x958', '445 Cole Village, Howellmouth, OH 42747', '2025-05-14 13:00:14');

-- Password: 1B2xbDW
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Derek Moreno', 'derek.moreno@agrifarm.com', '95d4bfb271e471063ff582cff606bc297a61103b04395a63be3dfe9f2ab88431', '+1-728-008-6904x7255', '5976 Dennis Crescent Apt. 318, South Christopher, PA 51421', '2025-05-14 13:00:14');

-- Password: 66hWagOsa
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Cheryl Johnson', 'cheryl.johnson@agrifarm.com', '6755dcb47de1089543686ecdeef6c3dceb79098cb609c83f4c3314d65cc60073', '(501)491-5332', '8296 Stephen Mountains Apt. 536, Lake Courtneybury, SD 39700', '2025-05-14 13:00:14');

-- Password: 66QiyI5Er
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Sean Campbell', 'sean.campbell@agrifarm.com', 'd0d9551deb99ad6e702d2e333cd53df6b13010aee9808b6faf613f598b541069', '659.010.4703x410', '786 Mitchell Square Suite 576, South Wayne, WY 44916', '2025-05-14 13:00:14');

-- Password: 3Jfn38jrO
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Krista Floyd', 'krista.floyd@agrifarm.com', '5dc75f9df5a1b84a7005e7e17778ebc0daeceadb390a31c012abe998859f0345', '(335)504-4114x75080', '661 Richardson Mountain Apt. 604, South Ashley, AR 22141', '2025-05-14 13:00:14');

-- Password: D6QpCHz
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Susan Gonzalez', 'susan.gonzalez@agrifarm.com', '1a248e4174cf4407824976b604fc18eed04de5f5b88e95474f6c8d9976ee54ff', '496-032-0375', '651 Shawn Forks Suite 263, Jonathanport, MA 21383', '2025-05-14 13:00:14');

-- Password: fSVKf8Ja
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Courtney Duke', 'courtney.duke@agrifarm.com', '966eb5eb8271cb81b3408ce421d8c63b958de0eac4db40ecc0dd0061a4f8aafe', '574.230.8050x8485', '1839 Amber Turnpike, Port Elizabethtown, SD 46428', '2025-05-14 13:00:14');

-- Password: 7NRGwAm
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Jared Guzman', 'jared.guzman@agrifarm.com', 'f56e18d990a70f1b2ae82297cbccc2ac5485895e0c46c6031db9387eb0503774', '001-071-237-9577', '306 Le Mountain, Dukechester, PA 83522', '2025-05-14 13:00:14');

-- Password: JnKNEpHf5
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Nathan Johnson', 'nathan.johnson@agrifarm.com', 'e6205454d6dce6e19398f68ec93d12b6b5021c77db95adb778186283afb2fe5f', '(743)709-6725', '7258 Wells Radial Apt. 374, East Nancy, WV 08360', '2025-05-14 13:00:14');

-- Password: GrYrsr6O2
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Andrea Jennings', 'andrea.jennings@agrifarm.com', '773ca881f3df0e7bf1d88a29559f2c8439dca2534cba05ca51d0ca0e22e74561', '+1-073-691-8478x519', '2272 Megan Inlet Apt. 679, Andrewton, TN 74546', '2025-05-14 13:00:14');

-- Password: 4X7W2UeDYD
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Christopher Sanchez', 'christopher.sanchez@agrifarm.com', '7c5b5db08d0425315282fb5be8a3267cf95a4f604d461b50d18637405c2a805c', '522.195.9249', '9646 Brittany Station, East Johnbury, IN 75980', '2025-05-14 13:00:14');

-- Password: n68BdG4dN
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Courtney Mckay', 'courtney.mckay@agrifarm.com', '9b752c7fef046839d80194af2b06910bbede12d7e8bab1f6475ffe9a406bf506', '8548140487', '129 Smith Harbor, North Andrewshire, WY 77037', '2025-05-14 13:00:14');

-- Password: n8BLqg8e
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Michael Simon', 'michael.simon@agrifarm.com', 'f3758768c816b15093b37a9638b621fd515d8d63bc78abe129ceca8bb20d2ddb', '512.383.3979', '26688 Hunt Parkway Suite 853, West Mark, IL 38923', '2025-05-14 13:00:14');

-- Password: cw9K2q
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Renee Phillips', 'renee.phillips@agrifarm.com', 'a4ed782759262116cec3c561c20d6229dd00c4b872f3eaf68a76b01f609a90fb', '(695)507-7237', 'PSC 8325, Box 7156, APO AA 06762', '2025-05-14 13:00:14');

-- Password: 72Hi4Mm3Zs
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Alan Barnes', 'alan.barnes@agrifarm.com', 'e329fb187abd09b5ed8f2bce050ce64634dd175e3f44da4cafbb3b2c002695c4', '(827)570-0780x71286', '973 Katie Plaza Suite 503, New Dave, CT 76378', '2025-05-14 13:00:14');

-- Password: Y0x7KJjAk
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Courtney Marsh', 'courtney.marsh@agrifarm.com', '827fcc422fff1d8d9e2cde4f32f7bb0d9f8cb7653a0cebce081a3e8b6f9f31c8', '001-415-421-4939x2408', '424 Oconnor Square, Amandafort, MA 62317', '2025-05-14 13:00:14');

-- Password: e323Aga
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Dana Knight', 'dana.knight@agrifarm.com', '3f6d06fa6573f2b46ce5a71378b198d5bce6592a4d9391eabd8bd152c96179ce', '853-347-8902x564', '7770 Scott Coves, South Kelly, PA 79777', '2025-05-14 13:00:14');

-- Password: Z1zWwz9xCX
INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, FarmerAddress, CreatedAt) VALUES ('Hannah Cordova', 'hannah.cordova@agrifarm.com', 'c15a5e1a11d769418835d80a39e9fbe703926267a9f1d49aa9517500792b72a1', '(944)150-2892x28867', '017 Destiny Plains Suite 079, Johnsonbury, AK 41813', '2025-05-14 13:00:14');

-- ===============
-- PRODUCT INSERTS
-- ===============

INSERT INTO Products (FarmerId, ProductName, ProductCategory, Description, Quantity, UnitPrice, ProductionDate, CreatedAt) VALUES
(1, 'Chili Peppers', 'Herbs', 'Chili Peppers freshly harvested and packaged for quality.', 133, 25.36, '2025-04-18', '2025-05-14 13:00:14'),
(2, 'Sweetcorn', 'Poultry', 'Sweetcorn freshly harvested and packaged for quality.', 119, 25.01, '2025-05-07', '2025-05-14 13:00:14'),
(3, 'Pumpkins', 'Dairy', 'Pumpkins freshly harvested and packaged for quality.', 178, 24.49, '2025-05-07', '2025-05-14 13:00:14'),
(4, 'Chili Peppers', 'Fruits', 'Chili Peppers freshly harvested and packaged for quality.', 140, 39.15, '2025-05-02', '2025-05-14 13:00:14'),
(5, 'Free Range Eggs', 'Dairy', 'Free Range Eggs freshly harvested and packaged for quality.', 54, 20.3, '2025-04-18', '2025-05-14 13:00:14'),
(6, 'Chili Peppers', 'Poultry', 'Chili Peppers freshly harvested and packaged for quality.', 68, 28.56, '2025-05-05', '2025-05-14 13:00:14'),
(7, 'Goat Cheese', 'Vegetables', 'Goat Cheese freshly harvested and packaged for quality.', 152, 24.94, '2025-04-17', '2025-05-14 13:00:14'),
(8, 'Spinach', 'Fruits', 'Spinach freshly harvested and packaged for quality.', 148, 18.12, '2025-04-18', '2025-05-14 13:00:14'),
(9, 'Cucumbers', 'Poultry', 'Cucumbers freshly harvested and packaged for quality.', 102, 26.92, '2025-04-28', '2025-05-14 13:00:14'),
(10, 'Strawberries', 'Fruits', 'Strawberries freshly harvested and packaged for quality.', 67, 36.64, '2025-05-06', '2025-05-14 13:00:14'),
(11, 'Goat Cheese', 'Poultry', 'Goat Cheese freshly harvested and packaged for quality.', 165, 36.45, '2025-05-05', '2025-05-14 13:00:14'),
(12, 'Free Range Eggs', 'Herbs', 'Free Range Eggs freshly harvested and packaged for quality.', 100, 32.2, '2025-04-27', '2025-05-14 13:00:14'),
(13, 'Organic Tomatoes', 'Vegetables', 'Organic Tomatoes freshly harvested and packaged for quality.', 43, 15.98, '2025-04-30', '2025-05-14 13:00:14'),
(14, 'Organic Tomatoes', 'Dairy', 'Organic Tomatoes freshly harvested and packaged for quality.', 147, 7.72, '2025-05-04', '2025-05-14 13:00:14'),
(15, 'Cucumbers', 'Herbs', 'Cucumbers freshly harvested and packaged for quality.', 111, 17.09, '2025-04-17', '2025-05-14 13:00:14'),
(16, 'Green Beans', 'Herbs', 'Green Beans freshly harvested and packaged for quality.', 120, 6.79, '2025-04-16', '2025-05-14 13:00:14'),
(17, 'Green Beans', 'Dairy', 'Green Beans freshly harvested and packaged for quality.', 177, 41.72, '2025-05-08', '2025-05-14 13:00:14'),
(18, 'Green Beans', 'Vegetables', 'Green Beans freshly harvested and packaged for quality.', 196, 32.89, '2025-04-16', '2025-05-14 13:00:14'),
(19, 'Pumpkins', 'Herbs', 'Pumpkins freshly harvested and packaged for quality.', 130, 28.04, '2025-05-02', '2025-05-14 13:00:14'),
(20, 'Organic Tomatoes', 'Herbs', 'Organic Tomatoes freshly harvested and packaged for quality.', 118, 20.15, '2025-04-30', '2025-05-14 13:00:14');