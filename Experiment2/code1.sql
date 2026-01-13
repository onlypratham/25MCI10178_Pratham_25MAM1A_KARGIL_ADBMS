CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(30),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Aman', 'Delhi', 96.5),
(2, 'Riya', 'Delhi', 97.0),
(3, 'Kunal', 'Delhi', 92.0),
(4, 'Neha', 'Mumbai', 98.0);
(5, 'Rohit', 'Mumbai', 96.5),
(6, 'Sneha', 'Mumbai', 94.0);

-- without case statement
SELECT city,COUNT(*) AS above_95
FROM Students
WHERE percentage > 95
group by city;

-- with case statement
select city, sum(case
when percentage > 95 then 1
else 0br
end) as above_95
from Students
group by city;


-- II
select city, avg(case
when percentage > 95 then percentage
else NULL
end) as average
from Students
group by city
order by average desc
