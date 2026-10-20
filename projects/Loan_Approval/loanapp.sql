create database loan;
use loan;
select * from loan_approval_clean;
alter table loan_approval_clean rename to l_approval;
alter table l_approval drop column myunknowncolumn;
select * from l_approval limit 10;
select count(*) from l_approval;
select distinct(property_area) from l_approval;
select * from l_approval where self_employed='Yes' and ApplicantIncome>5000;
select count(*) from l_approval where loan_status='Y';
select education,round(avg(LoanAmount),2) as average_loan from l_approval group by education;
select married ,round(avg(applicantincome + coapplicantincome),2) as average_total_income from l_approval group by married;
select credit_history,round(avg(loanamount),2) as average_loan from l_approval group by credit_history;
select gender,count(gender) as total_applicants,sum(loan_status='y') as approvals,round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate from l_approval group by gender;
select property_area,round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate from l_approval group by property_area;
select * from l_approval where education='graduate' and self_employed='no' and loanamount>150;
select * from l_approval where property_area='urban' and credit_history=1;
select *, applicantincome+coapplicantincome as totalincome from l_approval order by totalincome desc limit 5;
select *, applicantincome+coapplicantincome as totalincome from l_approval;
select loan_id,applicantincome,case when applicantincome<3000 then 'low' when applicantincome between 3000 and 6000 then 'mid' else 'high' end as income_group from l_approval;
select round(avg(loanamount),2) as averageloan,case when applicantincome<3000 then 'low' when applicantincome between 3000 and 6000 then 'mid' else 'high' end as income_group  from l_approval group by income_group;
select * from l_approval where loanamount>(select avg(loanamount) from l_approval) ;
select property_area,avg(applicantincome+coapplicantincome) as avgtotalincome from l_approval group by property_area order by avgtotalincome desc limit 1; 
select * from (select  *,avg(applicantincome) over(partition by education) as averageincome from l_approval) as avginc where applicantincome>averageincome;
select *,(applicantincome+coapplicantincome) as totalincome,rank() over(order by applicantincome+coapplicantincome desc) as rnk from l_approval;
select distinct(property_area),avg(loanamount) over(partition by property_area) as averageloan from l_approval;
select education,round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate from l_approval group by education;
select round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate,credit_history,education from l_approval group by credit_history,education  order by  approval_rate desc ;
select round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate,property_area,education from l_approval group by property_area,education order by approval_rate desc;
select round((sum(loan_status='y')/count(loan_status))*100,2) as approval_rate, credit_history,self_employed from l_approval group by credit_history,self_employed order by approval_rate desc;










  




  



 