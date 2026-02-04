This is the first file in this repository

    ---This query creates a table called "Patients" with
   --- a format with patients information including their patient id,name, age,
   --- gender, and city they're from
    
    CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

---This inserts the corresponding information into the table
    
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');


---This line is selecting all the information from the patients table and 
-- restating the information

select*from patients; 

---This query is selecting all the information listed in the patients table from the patients 
--that identify as female

select * from Patients
where gender = 'F';

--This query is selecting the names and ages of all patients from the patients table

select Name, Age
from patients;

--This query is selecting all the info from the patients table for the patients who are
-- less than 40 years old

select * from Patients
where age > 40;

---This query is counting how many data entries there are in the patients table based on
-- all the data logged

select count (*) from patients;

--- This query is counting how many individual cities the patients are from based
--- on the logged data in the patients table 

select count (distinct city) from patients;

--- This query is listing all the individual cities each patient is from 
-- based on the data in the patients table

select distinct city from patients;

--- This query is stating the average age among the patients based on the information
--- logged into the age section of the patients table

select avg(age) from patients;

---This query is stating the minimum age among along the patients
--- based on the information in the patients table

select min(age) from patients;

---This query is stating the max age among the patients based on 
--- the information in the patients table

select max(age) from patients;

---The next two queries are stating the average age among each gender in ascending order
--based on the information in the patients table
--- This query has an error in the third line
----The fourth query is the correct version

select gender, avg(age) Avg_age
from Patients
group by gender;
order by 2;

select gender, avg(age) Avg_age
from Patients
group by gender
order by 2;

---This query is stating the minimum ages of the patients in each individual city
--- based on the info in patients table

select city, min(age) min_age
from Patients
group by city;

---This query is stating the maximum ages of the patients in each individual city
---  in descending order based on the info in patients table

select city, max(age) max_age
from Patients
group by city
order by 1 desc;

---This query is creating a new table called visits with visitors' info
--- including the visit id, patient id, visit date, diagnosis, cost of the visit

create table Visits (
  visit_id integer primary key,
  patient_id integer,
  visit_date text,
  diagnosis text,
  cost real,
  Foreign key (patient_id) references Patients(patient_id)
  );

---This query is inserting the corresponding information to the visits table

  INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

--This query is restating all the information logged in the visits table

select * from visits;

---This query is combining all of the information from the patients table and visits
---table and putting them together into one table

select patients.patient_id, visit_id, diagnosis, city
from patients left join visits 
on patients.patient_id= visits.patient_id

---This query is combining the cities each patient is from from the patients table
    --- and the average cost of all of the visits from the visits table and 
    ---logging the info into one table
    
select city, avg(cost)
from patients join visits
on patients.patient_id = visits.patient_id
group by city;
