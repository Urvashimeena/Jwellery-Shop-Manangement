

1)  Customers of particular city
 select c_name,date,amount from (customer as c join customer_transaction as ct ON (c.cid=ct.cid) ) where c_city='udaipur';
2)customers who buy paricular product
 select c_name from( (customer as c join billing as b ON(c.cid=b.cid)) as r0 join 
product_info as p1 ON(r0.bill_id=p1.bill_id))as r1 join product  p2 ON(r1.pid=p2.pid)
where name=' ';

//3) whose bill is remaining
select c_name from customer where cid IN(select distinct cid from customer_transaction Except select distinct cid from customer_transaction
where remaining=0); 

4)bill paid at first time
select  distinct c_name,bill_id,cphone_no from billing as b natural join customer as c
where (payable-(cash+silver_return+gold_return))=0;

5)gold sold at particular date
 select  sum(p2.weight) as gold_sold , sum(price_total) as price_of_gold from (product_info as p1 join product as p2 ON(p1.pid=p2.pid) natural join billing) where 
date='06/12/2016' and material='gold';



6)total stock of gold
select sum(weight)as Remaining_gold_in_shop from product  where material='gold' Except (select  sum(p2.weight) as gold_sold from (product_info as p1 join product as p2 ON(p1.pid=p2.pid) natural join billing) where 
material='gold');

8)  net profit of year
select sum(net_profit) from billing where extract(year from date)=2016;

9) schemes of particular customer
 select count(sid) from customer_scheme where cid=21 group by sid;

10)




