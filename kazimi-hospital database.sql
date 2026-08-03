-- creating database
CREATE DATABASE Kazimi_Hospital ;

-- Creating Tables of doctor , patient and Appointment
CREATE TABLE doctor (
    doc_id SERIAL PRIMARY KEY,
    doc_name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE patient (
    pat_id SERIAL PRIMARY KEY,
    pat_name VARCHAR(50),
    age INT,
    disease VARCHAR(50)
);

CREATE TABLE appointment (
    app_id SERIAL PRIMARY KEY,
    pat_id INT,
    doc_id INT,
    appointment_date DATE
);

-- Inserting Data in the Tables :
INSERT INTO doctor (doc_name, specialization) VALUES
('Dr. Ali', 'Cardiologist'),
('Dr. Sara', 'Dermatologist'),
('Dr. John', 'Neurologist');

INSERT INTO patient (pat_name, age, disease) VALUES
('Aman', 30, 'Heart Issue'),
('Riya', 25, 'Skin Allergy'),
('Farhan', 40, 'Migraine');

INSERT INTO appointment (pat_id, doc_id, appointment_date) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(3, 3, '2024-01-15');