
CREATE DATABASE Pharmacy;

USE Pharmacy;

CREATE TABLE Tablets (
    Tablet_ID INT PRIMARY KEY,
    Tablet_Name VARCHAR(50),
    Tablet_Weight DECIMAL(6,2),
    Disease VARCHAR(50),
    Symptom VARCHAR(50)
);

ALTER TABLE Tablets
ADD Cost DECIMAL(8,2);

ALTER TABLE Tablets
RENAME COLUMN Cost TO Tablet_Cost;

INSERT INTO Tablets
(Tablet_ID, Tablet_Name, Tablet_Weight, Disease, Symptom, Tablet_Cost)
VALUES
(1,'Paracetamol',500,'Fever','High Fever',10),
(2,'Crocin',650,'Fever','Body Pain',15),
(3,'Dolo 650',650,'Fever','Headache',18),
(4,'Cetirizine',10,'Allergy','Sneezing',12),
(5,'Azithromycin',500,'Infection','Sore Throat',45),
(6,'Amoxicillin',250,'Infection','Cough',30),
(7,'Pantoprazole',40,'Acidity','Heartburn',20),
(8,'Omeprazole',20,'Acidity','Stomach Pain',18),
(9,'Metformin',500,'Diabetes','High Sugar',35),
(10,'Glimepiride',2,'Diabetes','High Sugar',28),
(11,'Aspirin',75,'Heart Disease','Chest Pain',22),
(12,'Atorvastatin',10,'Cholesterol','High Cholesterol',40),
(13,'Ibuprofen',400,'Pain','Muscle Pain',16),
(14,'Diclofenac',50,'Pain','Joint Pain',25),
(15,'Vitamin C',500,'Vitamin Deficiency','Weakness',12),
(16,'Zincovit',100,'Vitamin Deficiency','Weakness',20),
(17,'ORS',1000,'Dehydration','Loose Motions',8),
(18,'Loperamide',2,'Diarrhea','Loose Motions',14),
(19,'Levocetirizine',5,'Allergy','Sneezing',18),
(20,'Cetriz-D',10,'Cold','Runny Nose',22);

UPDATE Tablets SET Tablet_Cost=12 WHERE Tablet_ID=1;
UPDATE Tablets SET Tablet_Cost=50 WHERE Tablet_ID=5;
UPDATE Tablets SET Tablet_Cost=30 WHERE Tablet_ID=10;

ALTER TABLE Tablets
DROP COLUMN Disease;

ALTER TABLE Tablets
ADD Age_Group VARCHAR(20);

UPDATE Tablets SET Age_Group='Children' WHERE Tablet_ID IN (1,4,15,17);
UPDATE Tablets SET Age_Group='Adults' WHERE Tablet_ID IN (2,3,5,6,7,8,9,10,11,12,13,14,18,19,20);
UPDATE Tablets SET Age_Group='All Ages' WHERE Tablet_ID=16;

SELECT Symptom, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Symptom;

SELECT Age_Group, COUNT(*) AS Total
FROM Tablets
GROUP BY Age_Group
HAVING COUNT(*) >= 2;

SELECT * FROM Tablets;

SELECT
MIN(Tablet_Weight) AS Minimum_Weight,
MAX(Tablet_Weight) AS Maximum_Weight
FROM Tablets;

ALTER TABLE Tablets
ADD Qty INT;

UPDATE Tablets SET Qty=10 WHERE Tablet_ID=1;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=2;
UPDATE Tablets SET Qty=15 WHERE Tablet_ID=3;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=4;
UPDATE Tablets SET Qty=18 WHERE Tablet_ID=5;
UPDATE Tablets SET Qty=25 WHERE Tablet_ID=6;
UPDATE Tablets SET Qty=30 WHERE Tablet_ID=7;
UPDATE Tablets SET Qty=22 WHERE Tablet_ID=8;
UPDATE Tablets SET Qty=17 WHERE Tablet_ID=9;
UPDATE Tablets SET Qty=16 WHERE Tablet_ID=10;
UPDATE Tablets SET Qty=14 WHERE Tablet_ID=11;
UPDATE Tablets SET Qty=13 WHERE Tablet_ID=12;
UPDATE Tablets SET Qty=21 WHERE Tablet_ID=13;
UPDATE Tablets SET Qty=19 WHERE Tablet_ID=14;
UPDATE Tablets SET Qty=24 WHERE Tablet_ID=15;
UPDATE Tablets SET Qty=28 WHERE Tablet_ID=16;
UPDATE Tablets SET Qty=35 WHERE Tablet_ID=17;
UPDATE Tablets SET Qty=11 WHERE Tablet_ID=18;
UPDATE Tablets SET Qty=23 WHERE Tablet_ID=19;
UPDATE Tablets SET Qty=27 WHERE Tablet_ID=20;

SELECT
Tablet_ID,
Tablet_Name,
(Tablet_Weight * Qty) AS Total_Weight,
Symptom
FROM Tablets;

SELECT
Tablet_ID,
Tablet_Name,
Tablet_Weight,
Symptom
FROM Tablets
WHERE Age_Group='Adults'
AND Tablet_Weight >= 100;