CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1)
);

CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DateVisited DATE,
    Diagnosis TEXT,
    Prescription TEXT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender)
VALUES
    (1, 'John', 'Doe', '1990-05-15', 'M'),
    (2, 'Jane', 'Smith', '1985-09-23', 'F');


INSERT INTO MedicalRecords (RecordID, PatientID, DateVisited, Diagnosis, Prescription, Notes)
VALUES
    (1, 1, '2023-08-15', 'Common cold', 'Rest and hydration', 'Follow up in a week.'),
    (2, 2, '2023-07-20', 'Stress-related symptoms', 'Stress management techniques', 'Recommended yoga classes.');

SELECT Patients.PatientID, Patients.FirstName, Patients.LastName, MedicalRecords.DateVisited, MedicalRecords.Diagnosis, MedicalRecords.Prescription, MedicalRecords.Notes
FROM Patients
INNER JOIN MedicalRecords ON Patients.PatientID = MedicalRecords.PatientID
WHERE Patients.PatientID = 1;

UPDATE MedicalRecords
SET Prescription = 'Antibiotics and rest'
WHERE RecordID = 1;

FROM Patients
INNER JOIN MedicalRecords ON Patients.PatientID = MedicalRecords.PatientID
WHERE MedicalRecords.Diagnosis = 'Common cold';
