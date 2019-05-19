Drop Table Appointments;
Drop Table Doctors;
Drop Table Hospital;
Drop Table Patients;

CREATE TABLE Patients 
(
    pID         INT NOT NULL,
    pFname      VARCHAR(20) NOT NULL,
    PLname      VARCHAR(20) NOT NULL,
    pDOB        VARCHAR(10) NOT NULL,
    pEmail      VARCHAR(50) NOT NULL,
    password    VARCHAR(25) NOT NULL,
    CONSTRAINT pk_Patients PRIMARY KEY (pID)
);

CREATE TABLE Hospital 
(
    hID                 INT NOT NULL,
    hospitalName        VARCHAR(50) NOT NULL,
    hospitalAddress     VARCHAR(50) NOT NULL,
    hospitalPhone       VARCHAR(20),
    hospitalEmail       VARCHAR(30),
    CONSTRAINT pk_Hospital PRIMARY KEY (hID)
);

CREATE TABLE Doctors
(
    dID                     INT NOT NULL,
    doctorName              VARCHAR(50) NOT NULL,
    hID                     INT NOT NULL,
    timeStart               VARCHAR(20),
    timeEnd                 VARCHAR(20),
    CONSTRAINT pk_Doctors PRIMARY KEY (dID)
);

CREATE TABLE Appointments
(
    pID                    INT NOT NULL,
    pFname                 VARCHAR(20) NOT NULL,
    PLname                 VARCHAR(20) NOT NULL,
    hID                    INT NOT NULL,
    hospitalName           VARCHAR(50) NOT NULL,
    hospitalAddress        VARCHAR(50) NOT NULL,
    dID                    INT NOT NULL,
    doctorName             VARCHAR(50) NOT NULL,
    appointmentDateTime    VARCHAR(20),
    CONSTRAINT pk_Appointments PRIMARY KEY (pID, hID, dID)
);

ALTER TABLE Doctors
        ADD CONSTRAINT Doctors_Hospital_fk 
        FOREIGN KEY (hID)
        REFERENCES Hospital(hID);

ALTER TABLE Appointments
        ADD CONSTRAINT Appointments_Patients_fk 
        FOREIGN KEY (pID)
        REFERENCES Patients(pID);

ALTER TABLE Appointments
        ADD CONSTRAINT Appointments_Hospital_fk 
        FOREIGN KEY (hID)
        REFERENCES Hospital(hID);

ALTER TABLE Appointments
        ADD CONSTRAINT Appointments_Doctors_fk 
        FOREIGN KEY (dID)
        REFERENCES Doctors(dID);

INSERT INTO Patients (pID, pFname, pLname, pDOB, pEmail, password) VALUES
            (016540, 'Charles', 'Preston', '1950-05-29', 'charlespreston@gmail.com', 'blackhawks77'),
            (016541, 'Chi', 'Ngo', '1950-05-29', 'ChiSux@gmail.com', 'blackhawks77');

INSERT INTO Hospital (hID, hospitalName, hospitalAddress, hospitalPhone, hospitalEmail) VALUES
            (4056781, 'Kaiser Permanente', ' 3401 S Harbor Blvd, Santa Ana, CA', '(714) 830-6500', 'SAKP@kaiserpermanente.com'),
            (4056782, 'Kaiser Permanente', ' 3717 S Euclid St, Garden Grove, CA', '(714) 830-6500', 'GGKP@kaiserpermanente.com'),
            (4056783, 'Kaiser Permanente', ' 5451 S Chapman Ave, Orange, CA', '(714) 830-6500', 'ORKP@kaiserpermanente.com'),
            (4056784, 'Kaiser Permanente', ' 506 S Beach Blvd, Huntington Beach, CA', '(714) 830-6500', 'HBKP@kaiserpermanente.com'),
            (4056785, 'Kaiser Permanente', ' 2523 S La Palma Ave, Anaheim, CA', '(714) 830-6500', 'ANKP@kaiserpermanente.com');

INSERT INTO Doctors(dID, doctorName, hID, timeStart, timeEnd) VALUES
            (567551, 'Glenn Quagmire', 4056781, '2018-12-12 08:00', '2018-12-12 15:00'),
            (567552, 'Judit Lorin', 4056785, '2018-12-13 15:30', '2018-12-12 19:00'),
            (567554, 'Milenko Gozzo', 4056784, '2018-12-12 12:30', '2018-12-12 18:00'),
            (567555, 'Clive Barter', 4056783, '2018-12-14 10:00', '2018-12-12 16:30'),
            (567556, 'Gregory Marwa', 4056785, '2018-12-16 11:30', '2018-12-12 17:00'),
            (567557, 'Roni Milanka', 4056784, '2018-12-14 09:30', '2018-12-12 16:00'),
            (567558, 'Amika Hanna', 4056781, '2018-12-15 13:00', '2018-12-12 19:00'),
            (567559, 'Wu Ning', 4056783, '2018-12-13 11:00', '2018-12-12 18:00'),
            (567560, 'Chin Kun', 4056782, '2018-12-14 10:30', '2018-12-12 17:00');


INSERT INTO Appointments (pID, pFname, pLname, hID, hospitalName, hospitalAddress, dID, doctorName, appointmentDateTime) VALUES
            (016540, 'Charles', 'Preston', 4056781, 'Kaiser Permanente', '3401 S Harbor Blvd, Santa Ana, CA', 567551, 'Glenn Quagmire', '2018-12-12 08:00'),
            (016541, 'Chi', 'Ngo', 4056781, 'Kaiser Permanente', '3401 S Harbor Blvd, Santa Ana, CA', 567551, 'Glenn Quagmire', '2018-11-27 08:00');



Select * FROM Patients;
Select * FROM Hospital;
Select * FROM Doctors;
Select * FROM Appointments;

Select timeStart FROM Doctors WHERE doctorName = 'Glenn Quagmire';
Select doctorName FROM Appointments WHERE appointmentDateTime = '2018-12-12 08:00' OR hospitalAddress = '3401 S Harbor Blvd, Santa Ana, CA';
Select * From Appointments;
-- update appointments 
-- set appointmentTime = '12:30'
-- where pID = ;
-- Select pID FROM Patients WHERE pEmail = 'charlespreston@gmail.com' AND password = 'blackhawks77';