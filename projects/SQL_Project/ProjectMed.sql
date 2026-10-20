create database med;
use med;
alter table admissions rename column attending_doctor_id to doctor_id;
select first_name,last_name,gender from patients where gender='M';
select first_name,last_name from patients where allergies is null;
select first_name from patients where first_name like 'C%';
select first_name,last_name from patients where weight between 100 and 120;
update patients set allergies='NKA' where allergies is null;
alter table patients add column FullName varchar(30);
update patients set FullName=concat(first_name,' ',last_name);
select first_name,last_name,province_names.province_name from patients join province_names on patients.province_id=province_names.province_id;
select count(*) from patients where year(birth_date)=2010;
select first_name,last_name,height from patients order by height desc limit 1;
select * from patients where patient_id in (1,45,534,879,1000);
select count(*) from admissions;
select count(*) from admissions where patient_id=579;
select distinct(city) from patients where province_id='NS';
select first_name,last_name,birth_date from patients where height>160 and weight>70;
select distinct(year(birth_date)) from patients order by year(birth_date) asc;
select count(first_name),first_name from patients group by first_name having count(*) =1 order by first_name;
select patient_id,first_name from patients where length(first_name)>=6 and first_name like 's%s';
select p.patient_id,p.first_name,p.last_name from patients as p join admissions  as a on p.patient_id=a.patient_id  where diagnosis='dementia';
select first_name from patients order by length(first_name),first_name ;
select count(*),case when gender='m' then 'male' when gender='f' then 'female' else null end as GENDER from patients group by gender;
select sum(gender='m') as male,sum(gender='f') as female from patients;
select patient_id,diagnosis from admissions group by patient_id,diagnosis having count(*)>1;
select city,count(patient_id) from patients group by city order by count(patient_id) desc ,city asc;
select first_name,last_name,case when first_name in (select first_name from patients) and last_name in (select last_name from patients) then 'Patient' else 'Doctor' end as role from patients union all select first_name,last_name,case when first_name in (select first_name from doctors) and last_name in (select last_name from doctors) then 'Doctor' else 'Patient' end as role from doctors;
select allergies,count(*) as total from patients where allergies is not null  group by allergies order by total desc;
select first_name,last_name,birth_date from patients where year(birth_date) between 1970 and 1979 order by birth_date;
select concat(upper(last_name),',',lower(first_name)) as fullname from patients order by first_name desc;
select sum(height) as total_height,province_id from patients group by province_id having sum(height)>=7000;
select max(weight)-min(weight) as weight_diff from patients where last_name='Maroni';
select dayofmonth(admission_date),count(admission_date) as number_of_admissions from admissions group by dayofmonth(admission_date) order by number_of_admissions desc ;
select weight-(weight mod 10) as weight_group,count(*) as total_patients  from patients group by weight_group order by weight_group desc;
select patient_id,weight,height,(weight/(height/100)/(height/100))>30 as isobese from patients;
select p.patient_id,p.first_name,p.last_name,d.specialty from patients as p join admissions as a on p.patient_id=a.patient_id join doctors as d on a.doctor_id=d.doctor_id   where a.diagnosis='Epilepsy' and d.first_name='Lisa' ;



 

 

