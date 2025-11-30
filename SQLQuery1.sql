--------------- Create the DB -----------------
Create database [St.Depression] ;
Use [St.Depression] go;

--------------- test 1 ------------------------
Select * from students 
--> Succeded 
-----------------------------------------------

/*
===============================================
                INSIGHTS 
=============================================== 
*/ 

-- ins1 : Overall Depression Count 
--  Counts the total number of students with and without depression
SELECT Depression, COUNT(*) as Count
FROM students
GROUP BY Depression;
/* There are 16,336 students with depression (Depression = 1) and
 11,565 students without (Depression = 0) */ 


--  2. Average Age by Depression Status
-- Description: Calculates the average age of students for both depressed and non-depressed groups.
-- Query:
SELECT Depression, AVG(Age) as Average_Age
FROM students
GROUP BY Depression;
-- Result: The average age for non-depressed students is approximately 27.14, while for depressed students, it is lower, at approximately 24.89

-- Depression Count by Gender
-- Description: Breaks down the depression count by gender.
-- Query:
SELECT Gender, Depression, COUNT(*) as Count
FROM students
GROUP BY Gender, Depression
ORDER BY Gender, Depression;
-- Result:
-- Female: 7,221 depressed, 5,133 not depressed.
-- Male: 9,115 depressed, 6,432 not depressed

-- Academic Pressure and Depression
--  Description: Compares the average academic pressure (on a scale) for students with and without depression.
-- Query:
SELECT Depression, AVG(Academic_Pressure) as Avg_Academic_Pressure
FROM students
GROUP BY Depression;
-- Result: Students with depression have a significantly higher average academic pressure (3.69) compared to those without (2.36)


/* 5. Suicidal Thoughts by Depression Status
Description: Calculates the percentage of students who have had suicidal thoughts, grouped by their depression status.
Query: */
SELECT
  Depression,
  Have_you_ever_had_suicidal_thoughts_,
  COUNT() * 100.0 / SUM(COUNT()) OVER (PARTITION BY Depression) as Percentage
FROM students
-- GROUP BY Depression, Have_you_ever_had_suicidal_thoughts_;--
-- Result: Over 85.4% of students with depression reported having suicidal thoughts, compared to 32.0% of students without depression

/* 6. Average CGPA by Depression Status
Description: Checks if there is a significant difference in average CGPA between the two groups.
Query: */
SELECT Depression, AVG(CGPA) as Average_CGPA
FROM students
GROUP BY Depression;
-- Result: The average CGPA is very similar for both groups, with non-depressed students at 7.62 and depressed students at 7.68


