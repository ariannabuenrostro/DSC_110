This is the first file in this repository
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');




select*from patients; 

select * from Patients
where gender = 'F';

select Name, Age
from patients;

select * from Patients
where age > 40;

select count (*) from patients;

select count (distinct city) from patients;

select distinct city from patients;

select avg(age) from patients;

select min(age) from patients;

select max(age) from patients;

select gender, avg(age) Avg_age
from Patients
group by gender;
order by 2;

select gender, avg(age) Avg_age
from Patients
group by gender
order by 2;

select city, min(age) min_age
from Patients
group by city;

select city, max(age) max_age
from Patients
group by city
order by 1 desc;

create table Visits (
  visit_id integer primary key,
  patient_id integer,
  visit_date text,
  diagnosis text,
  cost real,
  Foreign key (patient_id) references Patients(patient_id)
  );
  
  INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);


select * from visits;

select patients.patient_id, visit_id, diagnosis, city
from patients left join visits 
on patients.patient_id= visits.patient_id

select city, avg(cost)
from patients join visits
on patients.patient_id = visits.patient_id
group by city;
