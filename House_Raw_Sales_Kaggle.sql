USE portfolio;

--Which date corresponds to the highest number of sales?
Select * from raw_sales;
Select a.sell_date, MAX(a.house_sold) as sold
from (Select datesold as sell_date, COUNT(*) as house_sold
from raw_sales
group by datesold ) as a
group by sell_date
Order by sold DESC;



--Find out the postcode with the highest average price per sale? (Using Aggregate Functions)
Select b.postcode, MAX(b.avg_price) as highest_avg_price
from (Select postcode, AVG(price) as avg_price
from raw_sales
group by postcode) as b
group by b.postcode
order by highest_avg_price DESC
;

--Which year witnessed the lowest number of sales?
Select YEAR(a.sell_date), MIN(a.house_sold) as sold
from (Select datesold as sell_date, COUNT(*) as house_sold
from raw_sales
group by datesold ) as a
group by sell_date
Order by sold ASC;


--Use the window function to deduce the top six postcodes by year's price.
Select postcode, DENSE_RANK() OVER(partition by year(datesold) order by price DESC )
from raw_sales;
