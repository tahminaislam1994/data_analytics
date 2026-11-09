-- All Table fetch
select * from public."Geo"
select * from public."People"
select * from public."Products"
select * from public."Sales"


-- Data Transformation (Cleaning)
-- Creating Master table 
with "Master_Table" as (select concat('OR','-',
row_number() over()) as Order_Id,  --(Sales table doesn't have primary key. so create a primay key first)
s.*,
g.*,
p.*,
pr.*
from public."Sales" as s
left join public."Geo" g on s."GeoID" = g."GeoID"
left join public."People" p on s."PID" = p."PID"
left join public."Products" pr on s."SPID" = pr."SPID")
select * from "Master_Table"; -- to call CTE



-- Find out Amount per box from Sales table
Select *, ROUND("Amount"/NULLIF("Boxes",0)) as "Amount_Per_Box" from "Master_Table"; -- round removes decimal, nullif allows to divide 0/0

-- Yearly Sales summary table 
select 
extract (Year from "SaleDate") as "Year", -- Year extract from date
round(sum("Amount")) as "Total Sales",
round(avg("Amount"),2) as "Avg Sale", -- take 2 decimal point
round(avg("Boxes")) as "Avg Boxes" 
from "Master_Table"
group by 1
order by 2 desc;

-- Monthly Sales summary table 
select 
extract (Month from "SaleDate") as "Month", -- Year extract from date
round(sum("Amount")) as "Total Sales",
round(avg("Amount"),2) as "Avg Sale", -- take 2 decimal point
round(avg("Boxes")) as "Avg Boxes" 
from "Master_Table"
where extract (Year from "SaleDate") = 2022
group by 1
order by 2 desc;

-- Month and Region wise sales
select "Geo", "Region", 
to_char("SaleDate", 'Month') as "Month", -- Month name show kore
round(sum("Amount")) as "Total Sales",
round(avg("Amount"),2) as "Avg Sale"
from "Master_Table"
where extract(Year from "SaleDate") = 2022
group by 1,2,3
order by 3;

-- Top 10 Salesperson based on Sales
select 
p."Salesperson",
p."Location",
sum(s."Amount") as "Total Sales",
round(avg(s."Amount"),2) as "AVG Sales"
from public."Sales" as s
left join public."Products" as p on s."SPID" = p."SPID"
group by 1, 2
order by 3 desc
limit 10;






