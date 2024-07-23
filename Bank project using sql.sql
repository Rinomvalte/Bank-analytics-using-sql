SELECT * FROM bank_analytics.`copy of finance_1`;
alter table bank_analytics.`copy of finance_1` rename to finance_01; 
select * from finance2;
select * from finance_01;
#KPI-1
-- Year wise loan amount
select year_d as year_of_issue,sum(loan_amnt)as total_loan_amnt from finance_01
group by  year_of_issue
order by  total_loan_amnt;
#KPI-2
-- Grade and sub grade wise revol_bal.
select grade,sub_grade,sum(revol_bal) as total_rovol_bal
from finance_01 inner join finance2
on finance_01.id=finance2.id
group by grade,sub_grade
order by grade,sub_grade;
#KPI-3
--- Total Payment for verified and non verfied status.
select verification_status,
round(sum(total_pymnt),2)as Total_payment
from finance_01 inner join finance2
on finance_01.id=finance2.id
group by verification_status;
#KPI-4
-- State wise and last_credit_pull_d wise loan status
select * from finance2;
select * from finance_01;
select addr_state,last_credit_pull_d,loan_status
from finance_01 inner join finance2
on finance_01.id=finance2.id
group by addr_state,last_credit_pull_d,loan_status
order by last_credit_pull_d  ;

#KPI-5
-- Home ownership Vs last payment date stats
select home_ownership,last_pymnt_d,
round(sum(total_pymnt),2)as Total_payment
from finance_01 inner join finance2
on finance_01.id=finance2.id
group by home_ownership,last_pymnt_d
order by home_ownership desc,last_pymnt_d desc;