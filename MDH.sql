create database medical_data_history;

select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;

-- Show first name, last name, and gender of patients who's gender is 'M'
select first_name , last_name , gender from patients where gender = 'M' ;

-- Show first name and last name of patients who does not have allergies.
select first_name , last_name ,allergies  from patients where allergies is null ;

-- Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%' ;

-- Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name ,weight from patients where weight between 100 and 120 ;

-- Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
update patients set allergies = 'NKA' where allergies is null ;  
set sql_safe_updates =0;
select* from patients;
set sql_safe_updates =1;

-- Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat( first_name,last_name)as 'full name' from patients;

-- Show first name, last name, and the full province name of each patient.
select first_name,last_name , province_name
from patients as p
join 
province_names as pn
on p.province_id = pn.province_id; 

-- Show how many patients have a birth_date with 2010 as the birth year.
select * from patients where year(birth_date) = '2010';

-- Show the first_name, last_name, and height of the patient with the greatest height.
-- (select first_name,last_name, max(height) as greatest_height from patients group by first_name,last_name order by max(height) desc limit 1;
-- or )
select first_name,last_name, height as greatest_height from patients order by height desc limit 1;

-- Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in ('1','45','534','879','1000');

-- Show the total number of admissions
select count(*) from admissions;

-- Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;

-- Show the total number of admissions for patient_id 579.
select count(*) from admissions where patient_id = 579;

-- Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select distinct(city) from patients where province_id = 'NS';

-- Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name , birth_date, height, weight from patients where height>160 and weight>70;

-- Show unique birth years from patients and order them by ascending.
select distinct year(birth_date) as birth_year from patients order by birth_year asc;

-- Show unique first names from the patients table which only occurs once in the list.
        /* For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. 
         If only 1 person is named 'Leo' then include them in the output. 
         Tip: HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.*/
select distinct first_name from patients group by first_name having count(*)=1;

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients where first_name like 's____s' ;

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table.
select p.patient_id, p.first_name, p.last_name , a.diagnosis 
from patients as p  
join
admissions as a 
on p.patient_id = a.patient_id
where a.diagnosis ='Dementia';

-- Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
select first_name from patients order by length(first_name),first_name;

-- Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select 
count( case when gender = 'M' then 1 end)as male_patients , 
count( case when gender = 'F' then 1 end) as female_patients 
from patients;

-- Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.


-- Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select a.patient_id , a.diagnosis, 
rank() over(partition by diagnosis order by patient_id ) as frequency_of_diagnosis,
concat(p.first_name,p.last_name) as patient_name
from admissions as a
join 
patients as p
on a.patient_id = p.patient_id;

-- or

select patient_id , diagnosis,
rank() over(partition by diagnosis order by patient_id) as frequency_of_diagnosis 
from admissions;

-- Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
select city,count(*) as no_of_paitent_in_a_city
from patients
group by city order by count(*) desc , city asc;

-- Show first name, last name and role of every person that is either patient or doctor.    The roles are either "Patient" or "Doctor"
select first_name , last_name,  'Patient' as role from patients
union
select first_name,last_name , 'Doctor' as role from doctors;

-- Show all allergies ordered by popularity. Remove NULL values from query.
select  allergies, count(*) as total_cases 
from patients
where allergies != "NKA"
group by allergies
order by total_cases desc;

-- Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
select first_name, last_name, birth_date  from patients where birth_date between 1970 and 1980 order by birth_date asc;

-- We want to display each patient's full name in a single column. 
   /* Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
    Separate the last_name and first_name with a comma. 
    Order the list by the first_name in decending order    
                        EX: SMITH,jane*/
	select  first_name ,last_name , 
concat_ws(',',
		  case when last_name is not null then upper(last_name) end,
          case when first_name is not null then lower(first_name) end) as full_name
from patients
order by first_name desc;
 
-- Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select province_id,sum(height) from patients group by province_id having sum(height) >= 7000;

-- Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select last_name, max(weight), min(weight),
(max(weight)-min(weight)) as diff_weight 
from patients 
where last_name = 'Maroni';

-- Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
select day(admission_date) as day_of_month , count(*) as admission_count from admissions
where admission_date is not null
group by day(admission_date)  order by admission_count desc ;
-- or
select day(admission_date) as day_of_month , count(admission_date) as admission_count from admissions
group by day(admission_date)  order by admission_count desc ;

-- Show all of the patients grouped into weight groups. 
          /* Show the total amount of patients in each weight group. 
           Order the list by the weight group decending. 
                     e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.*/
	select count(*) as total_no_of_patients, 
            case
			   when weight between 0 and 9 then 0 
               when weight between 10 and 19 then 10 
               when weight between 20 and 29 then 20 
               when weight between 30 and 39 then 30 
               when weight between 40 and 49 then 40 
               when weight between 50 and 59 then 50 
               when weight between 60 and 69 then 60 
               when weight between 70 and 79 then 70
               when weight between 80 and 89 then 80 
               when weight between 90 and 99 then 90 
               when weight between 100 and 109 then 100 
               when weight between 110 and 119 then 110 
               when weight between 120 and 129 then 120 
               when weight between 130 and 139 then 130 
               when weight between 140 and 149 then 140 end as weight_group
	from patients 
    group by weight_group 
    order by weight_group desc;

-- Show patient_id, weight, height, isObese from the patients table. 
       /*Display isObese as a boolean 0 or 1. 
       Obese is defined as weight(kg)/(height(m).
       Weight is in units kg. Height is in units cm.*/
select patient_id, 
concat(first_name,last_name) as patient_name,
weight, height, 
round(weight/ power(height/100,2),2) as obese , 
case 
   when weight/ power(height/100,2) < 30 then 0
   else 1 end as isobese
from patients
where weight is not null and height is not null ;


-- Show patient_id, first_name, last_name, and attending doctor's specialty. 
        /*Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. 
        Check patients, admissions, and doctors tables for required information.*/
alter table admissions rename column attending_doctor_id to doctor_id;

select p.patient_id, a.diagnosis, d.first_name, d.last_name, d.specialty 
from patients as p 
join 
admissions as a
on p.patient_id = a.patient_id
join 
doctors as d
on a.doctor_id = d.doctor_id
where a.diagnosis = 'Epilepsy' and d.first_name = 'Lisa';








