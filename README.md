Medical Data History

Perform the Problem Queries:

1. Show first name, last name, and gender of patients who's gender is 'M'

2. Show first name and last name of patients who does not have allergies.

3. Show first name of patients that start with the letter 'C'

4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

6. Show first name and last name concatenated into one column to show their full name.

7. Show first name, last name, and the full province name of each patient.

8. Show how many patients have a birth_date with 2010 as the birth year.

9. Show the first_name, last_name, and height of the patient with the greatest height.

10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000

11. Show the total number of admissions

12. Show all the columns from admissions where the patient was admitted and discharged on the same day.

13. Show the total number of admissions for patient_id 579.

14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?

15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70

16. Show unique birth years from patients and order them by ascending.

17. Show unique first names from the patients table which only occurs once in the list.
  
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output. Tip: HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table.

20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.

21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

22. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.

25. Show first name, last name and role of every person that is either patient or doctor.    The roles are either "Patient" or "Doctor"

26. Show all allergies ordered by popularity. Remove NULL values from query.

27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.

28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane

29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). Weight is in units kg. Height is in units cm.

34. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. Check patients, admissions, and doctors tables for required information.
